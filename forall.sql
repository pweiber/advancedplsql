CREATE TABLE forall_test (
  id           NUMBER(10),
  code         VARCHAR2(10),
  description  VARCHAR2(50));

ALTER TABLE forall_test ADD (
  CONSTRAINT forall_test_pk PRIMARY KEY (id));

ALTER TABLE forall_test ADD (
  CONSTRAINT forall_test_uk UNIQUE (code));

SET SERVEROUTPUT ON
DECLARE
  TYPE t_forall_test_tab IS TABLE OF forall_test%ROWTYPE;

  l_tab    t_forall_test_tab := t_forall_test_tab();
  l_start  NUMBER;
  l_size   NUMBER            := 1000000;
BEGIN
  -- Populate collection.
  FOR i IN 1 .. l_size LOOP
    l_tab.extend;

    l_tab(l_tab.last).id          := i;
    l_tab(l_tab.last).code        := TO_CHAR(i);
    l_tab(l_tab.last).description := 'Description: ' || TO_CHAR(i);
  END LOOP;

  EXECUTE IMMEDIATE 'TRUNCATE TABLE forall_test';

  -- Time regular inserts.
  l_start := DBMS_UTILITY.get_time;

  FOR i IN l_tab.first .. l_tab.last LOOP
    INSERT INTO forall_test (id, code, description)
    VALUES (l_tab(i).id, l_tab(i).code, l_tab(i).description);
  END LOOP;

  DBMS_OUTPUT.put_line('Normal Inserts: ' || 
                       TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
  
  EXECUTE IMMEDIATE 'TRUNCATE TABLE forall_test';

  -- Time bulk inserts.  
  l_start := DBMS_UTILITY.get_time;

  FORALL i IN l_tab.first .. l_tab.last
    INSERT INTO forall_test VALUES l_tab(i);

  DBMS_OUTPUT.put_line('Bulk Inserts  : ' || 
                       TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );

  COMMIT;
END;
/
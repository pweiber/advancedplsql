drop table rowid_test;

CREATE TABLE rowid_test AS
SELECT *
FROM   all_objects;

ALTER TABLE rowid_test ADD (
  CONSTRAINT rowid_test_pk
  PRIMARY KEY (object_id)
);

SET SERVEROUTPUT ON
DECLARE
TYPE t_id_tab IS TABLE OF rowid_test.object_id%TYPE; 

  l_id_tab     t_id_tab;
  l_rowid      ROWID;
  l_start      NUMBER;
BEGIN
  SELECT object_id
  BULK COLLECT INTO l_id_tab
  FROM   rowid_test; 

  -- Time the original method.
  l_start := DBMS_UTILITY.get_time;

  FOR i IN l_id_tab.first .. l_id_tab.last LOOP
    SELECT rowid
    INTO   l_rowid
    FROM   rowid_test
    WHERE  object_id = l_id_tab(i)
    FOR UPDATE;   

    UPDATE rowid_test
    SET    object_name = object_name
    WHERE  object_id = l_id_tab(i);
  END LOOP; 

  DBMS_OUTPUT.put_line('Primary Key (' || l_id_tab.count || ' rows): ' ||
                       TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' ); 

  -- Time the original method.
  l_start := DBMS_UTILITY.get_time;

  FOR i IN l_id_tab.first .. l_id_tab.last LOOP
    SELECT rowid
    INTO   l_rowid
    FROM   rowid_test
    WHERE  object_id = l_id_tab(i)
    FOR UPDATE;

    UPDATE rowid_test
    SET    object_name = object_name
    WHERE  rowid = l_rowid;
  END LOOP; 

  DBMS_OUTPUT.put_line('Rowid (' || l_id_tab.count || ' rows)      : ' ||
                       TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
                       
 ROLLBACK;
                       
END;
/
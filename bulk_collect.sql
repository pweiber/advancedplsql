SET SERVEROUTPUT ON
DECLARE
  TYPE t_bulk_collect_test_tab IS TABLE OF big_table%ROWTYPE;

  l_tab    t_bulk_collect_test_tab := t_bulk_collect_test_tab();
  l_start  NUMBER;
  
    CURSOR c_data IS
    SELECT *
    FROM big_table;
    
BEGIN
  -- Time a regular population.
  l_start := DBMS_UTILITY.get_time;

  FOR cur_rec IN (SELECT *
                  FROM   big_table)
  LOOP
    l_tab.extend;
    l_tab(l_tab.last) := cur_rec;
  END LOOP;

  DBMS_OUTPUT.put_line('Regular : ' || 
                       TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
  
  -- Time bulk population.  
  l_start := DBMS_UTILITY.get_time;

  OPEN c_data;
  LOOP
    FETCH c_data
    BULK COLLECT INTO l_tab LIMIT 10000;
    EXIT WHEN l_tab.count = 0;

  END LOOP;
  CLOSE c_data;

  DBMS_OUTPUT.put_line('Bulk    : ' || 
                       TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
END;
/
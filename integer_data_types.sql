-- Integer Data Types

SET SERVEROUTPUT ON
  
DECLARE  
l_number1 NUMBER := 1;  
l_number2 NUMBER := 1;  
l_integer1 INTEGER := 1;  
l_integer2 INTEGER := 1;  
l_pls_integer1 PLS_INTEGER := 1;  
l_pls_integer2 PLS_INTEGER := 1;  
l_binary_integer1 BINARY_INTEGER := 1;  
l_binary_integer2 BINARY_INTEGER := 1;  
l_simple_integer1 BINARY_INTEGER := 1;  
l_simple_integer2 BINARY_INTEGER := 1;  
l_loops NUMBER := 1000000000;  
l_start NUMBER; 
BEGIN  
  -- Time NUMBER.  
  l_start := DBMS_UTILITY.get_time;  
  FOR i IN 1 .. l_loops  
  LOOP  
    l_number1 := l_number1 + l_number2;  
  END LOOP;  
  DBMS_OUTPUT.put_line ('NUMBER : ' || TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
 
  -- Time INTEGER.  
  l_start := DBMS_UTILITY.get_time;  
  FOR i IN 1 .. l_loops  
  LOOP  
    l_integer1 := l_integer1 + l_integer2;  
  END LOOP;  
  DBMS_OUTPUT.put_line ('INTEGER : ' || TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
 
  -- Time PLS_INTEGER.  
  l_start := DBMS_UTILITY.get_time;  
  FOR i IN 1 .. l_loops  
  LOOP  
    l_pls_integer1 := l_pls_integer1 + l_pls_integer2;  
  END LOOP;  
  DBMS_OUTPUT.put_line ('PLS_INTEGER : ' || TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
  
  -- Time BINARY_INTEGER.  
  l_start := DBMS_UTILITY.get_time;  
  FOR i IN 1 .. l_loops  
  LOOP  
    l_binary_integer1 := l_binary_integer1 + l_binary_integer2;  
  END LOOP;
  DBMS_OUTPUT.put_line ('BINARY_INTEGER : ' || TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
 
 -- Time SIMPLE_INTEGER.
 l_start := DBMS_UTILITY.get_time;
 FOR i IN 1 .. l_loops
 LOOP
   l_simple_integer1 := l_simple_integer1 + l_simple_integer2;
 END LOOP;
 DBMS_OUTPUT.put_line ('SIMPLE_INTEGER : ' || TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' ); 
END; 


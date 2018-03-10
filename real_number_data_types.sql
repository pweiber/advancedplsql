-- Real Number Data Types

SET SERVEROUTPUT ON  
 
DECLARE  
  l_number1 NUMBER := 1.1;  
  l_number2 NUMBER := 1.1;  
  l_binary_float1 BINARY_FLOAT := 1.1;  
  l_binary_float2 BINARY_FLOAT := 1.1;  
  l_simple_float1 SIMPLE_FLOAT := 1.1;  
  l_simple_float2 SIMPLE_FLOAT := 1.1;  
  l_binary_double1 BINARY_DOUBLE := 1.1;  
  l_binary_double2 BINARY_DOUBLE := 1.1;  
  l_simple_double1 SIMPLE_DOUBLE := 1.1;  
  l_simple_double2 SIMPLE_DOUBLE := 1.1;  
  l_loops NUMBER := 1000000000;  
  l_start NUMBER;  
 
BEGIN 
  -- Time NUMBER.  
  l_start := DBMS_UTILITY.get_time; 
  FOR i IN 1 .. l_loops 
  LOOP  
    l_number1 := l_number1 + l_number2;  
  END LOOP; 
  DBMS_OUTPUT.put_line('NUMBER : ' ||  TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
 
  -- Time BINARY_FLOAT.  
  l_start := DBMS_UTILITY.get_time; 
  FOR i IN 1 .. l_loops 
  LOOP  
    l_binary_float1 := l_binary_float1 + l_binary_float2;  
  END LOOP; 
  DBMS_OUTPUT.put_line('BINARY_FLOAT : ' ||  TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );

  -- Time SIMPLE_FLOAT.  
  l_start := DBMS_UTILITY.get_time; 
  FOR i IN 1 .. l_loops 
  LOOP  
    l_simple_float1 := l_simple_float1 + l_simple_float2;  
    
    END LOOP; 
  DBMS_OUTPUT.put_line('SIMPLE_FLOAT : ' ||  TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' ); 

  -- Time BINARY_DOUBLE.  
  l_start := DBMS_UTILITY.get_time; 
  FOR i IN 1 .. l_loops 
  LOOP  
    l_binary_double1 := l_binary_double1 + l_binary_double2;  
  END LOOP; 
  DBMS_OUTPUT.put_line('BINARY_DOUBLE : ' ||  TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' ); 

  -- Time SIMPLE_DOUBLE. 
  l_start := DBMS_UTILITY.get_time; 
  FOR i IN 1 .. l_loops 
  LOOP  
    l_simple_double1 := l_simple_double1 + l_simple_double2;  
  END LOOP; 
  DBMS_OUTPUT.put_line('SIMPLE_DOUBLE : ' ||  TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );
END;


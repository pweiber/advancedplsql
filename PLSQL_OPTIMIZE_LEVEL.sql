/*Create a procedure*/
CREATE OR REPLACE PROCEDURE P_SUM_SERIES(p_count NUMBER)
IS

  l_series NUMBER := 0;
  l_start NUMBER;

/*Declare a local subprogram which returns the double of a number*/
  FUNCTION F_CROSS (p_num NUMBER, p_multiplier NUMBER) RETURN NUMBER IS
    l_result NUMBER;

  BEGIN
    l_result := p_num * p_multiplier;
    RETURN (l_result);
  END F_CROSS;

  BEGIN

    /*Capture the start time*/
    l_start := DBMS_UTILITY.GET_TIME();

    /*Begin the loop for series calculation*/
    FOR J IN 1..p_count
    LOOP

      /*Set inlining for the local subprogram*/
      PRAGMA INLINE (F_CROSS, 'YES');
      l_series := l_series + F_CROSS(J,2);
    END LOOP;

    /*Time consumed to calculate the result*/
    DBMS_OUTPUT.PUT_LINE('Execution time:'|| TO_CHAR( (DBMS_UTILITY.get_time - l_start) / 100
                       , 'FM999990.00') || ' sec.' );

  END;
/
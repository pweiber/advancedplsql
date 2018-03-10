CREATE TABLE func_test (
  id NUMBER
);

INSERT INTO func_test
SELECT CASE
         WHEN level = 1000000 THEN 3
         WHEN MOD(level, 2) = 0 THEN 2
         ELSE 1
       END
FROM   dual
CONNECT BY level <= 1000000;
COMMIT;

CREATE OR REPLACE FUNCTION slow_function (p_in IN NUMBER)
  RETURN NUMBER
AS
BEGIN

  DBMS_LOCK.sleep(1);
  RETURN p_in;
END;
/

-- No caching

SET TIMING ON
SELECT slow_function(id)
FROM   func_test;

-- With cache

SET TIMING ON
SELECT (SELECT slow_function(id) FROM dual)
FROM   func_test;

/

-- Write SQL query to solve the problem given below
-- Consider a scenario in which you have to create a table called Nobel_win where you 
-- have given the information about the entity who has achieved nobel prize in a particular 
-- subject all over the world.
-- Over here the table Nobel_win will contain attributes like year, subject, winner, country and 
-- category
-- You need to use the sql commands to create the table given and to solve the problem given 
-- below.

-- tabel--> NOBEL_WIN

CREATE TABLE NOBEL_WIN(
YEAR INT NOT NULL,
SUBJECT VARCHAR(50) NOT NULL,
WINNER_NAME VARCHAR(100) NOT NULL,
COUNTRY VARCHAR(50) NOT NULL,
CATEGORY VARCHAR(50) NOT NULL
);

DROP TABLE NOBEL_WIN;

TRUNCATE TABLE NOBEL_WIN;

INSERT INTO NOBEL_WIN VALUES(1970,'PHYSICS','HANNES ALFVEN','SWEDEN','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1970,'PHYSICS','LOUIS NEEL','FRANCE','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1970,'CHEMISTRY','LUIS FEDERICO LELOIR','FRANCE','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1970,'PHYSIOLOGY','ULF VON EULER','SWEDEN','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1970,'PHYSIOLOGY','BERNARD KATZ','GERMANY','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1970,'LITERATURE','ALEKSANDR SOLZHENITSYN','RUSSIA','LINGUIST');
INSERT INTO NOBEL_WIN VALUES(1970,'ECONOMICS','PAUL SAMUELSON','USA','ECONOMIST');
INSERT INTO NOBEL_WIN VALUES(1970,'PHYSIOLOGY','JULIUS AXELROD','USA','SCIENTIST');

INSERT INTO NOBEL_WIN VALUES(1971,'PHYSICS','DENNIS GABOR','HUNGARY','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1971,'CHEMISTRY','GERHARD HEZBERG','GERMANY','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1971,'PEACE','WILLY BRANDT','GERMANY','CHANCELLOR');
INSERT INTO NOBEL_WIN VALUES(1971,'LITERATURE','PABLO NERUDA','CHILE','LINGUIST');
INSERT INTO NOBEL_WIN VALUES(1971,'ECONOMICS','SIMON KUZNETS','RUSSIA','ECONOMIST');

INSERT INTO NOBEL_WIN VALUES(1978,'PEACE','ANWAR AL-SADAT','EGYPT','PRESIDENT');
INSERT INTO NOBEL_WIN VALUES(1978,'PEACE','MENACHEM BEGIN','ISRAEL','PRIME MINISTER');
INSERT INTO NOBEL_WIN VALUES(1987,'CHEMISTRY','DONALD J. CRAM','USA','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1987,'CHEMISTRY','JEAN-MARIE LEHN','FRANCE','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1987,'PHYSIOLOGY','SUSUMU TONEGAWA','JAPAN','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1994,'ECONOMICS','REINHARD SELTEN','GERMANY','ECONOMIST');
INSERT INTO NOBEL_WIN VALUES(1994,'PEACE','YITZHAK RABIN','ISRAEL','PRIME MINISTER');
INSERT INTO NOBEL_WIN VALUES(1987,'PHYSICS','JOHANNES GEORG BEDNOR','GERMANY','SCIENTIST');
INSERT INTO NOBEL_WIN VALUES(1987,'LITERATURE','JOSEPH BRODSKY','RUSSIA','LINGUIST');
INSERT INTO NOBEL_WIN VALUES(1987,'ECONOMICS','ROBERT SOLOW','USA','ECONOMIST');
INSERT INTO NOBEL_WIN VALUES(1994,'LITERATURE','KENZABURO OE','JAPAN','LINGUIST');

SELECT * FROM NOBEL_WIN;

-- Now make sure to solve the following query :
-- ● Write sql query to find the nobel prize winners of the year 1970. Return year,subject 
-- and winne
SELECT YEAR,SUBJECT,WINNER_NAME FROM NOBEL_WIN WHERE YEAR = 1970;

-- Write sql query to find the nobel prize winners in chemistry between the years 1965 
-- and 1975. Begin and end values are includedReturn year, subject, winner and 
-- country
SELECT YEAR,SUBJECT,WINNER_NAME,COUNTRY FROM NOBEL_WIN WHERE YEAR BETWEEN 1965 AND 1975 AND SUBJECT='CHEMISTRY';

-- Write sql query to retrieve the details of the winners whose first name matches with 
-- the string ‘Louis’. Return year,subject,winner,country
SELECT YEAR,SUBJECT,WINNER_NAME,COUNTRY FROM NOBEL_WIN WHERE WINNER_NAME LIKE 'LOUIS%';

-- Write sql query to find Nobel prize winners for the subject that does not begin with 
-- the letter ‘P’. Order the result by year, descending and winner in ascending

SELECT YEAR ,SUBJECT,WINNER_NAME FROM NOBEL_WIN WHERE SUBJECT NOT LIKE 'P%' ORDER BY YEAR DESC,WINNER_NAME ASC;

-- SELECT YEAR ,SUBJECT,WINNER_NAME FROM NOBEL_WIN WHERE SUBJECT NOT IN LIKE 'P%' ORDER BY YEAR DESC,WINNER_NAME ASC;
-- (NOT POSSIBLE( NOT IN)
-- BECAUSE...
-- Key Differences:
-- NOT IN: It checks against a specific set of values. For example:

-- SELECT * FROM NOBEL_WIN 
-- WHERE SUBJECT NOT IN ('Physics', 'Peace');
-- This query checks if the SUBJECT field is not one of the listed values ('Physics' or 'Peace'). It’s an exact match comparison, not pattern-based.

-- NOT LIKE: This is for pattern matching, typically used with wildcard characters like %. In your case:

-- SELECT * FROM NOBEL_WIN 
-- WHERE SUBJECT NOT LIKE 'P%';
-- This will exclude all subjects that start with 'P' (like 'Physics', 'Peace', etc.). It is checking the pattern of the string, not exact matches.

-- Why NOT IN Can't Be Used with Patterns:
-- NOT IN expects a set of exact values to compare against. It doesn't support partial matching or pattern-based filtering.
-- LIKE and NOT LIKE are designed specifically for pattern matching with wildcards.
-- Therefore, when you want to exclude subjects starting with 'P', you should use NOT LIKE 'P%' rather than NOT IN. That's why NOT LIKE is the correct choice for filtering based on starting characters.



-- Write sql query to find the details of 1970 Nobel prize winners. Order the result by 
-- subject, ascending except for ‘Chemistry’ and ‘Economics’ which will come at the 
-- end of the result set. Return year, subject, winner , country and category.

SELECT YEAR,SUBJECT,WINNER_NAME,COUNTRY,CATEGORY FROM NOBEL_WIN WHERE YEAR = 1970 ORDER BY 2;


SELECT YEAR,SUBJECT,WINNER_NAME,COUNTRY,CATEGORY FROM NOBEL_WIN WHERE YEAR = 1970 ORDER BY SUBJECT NOT IN('CHEMISTRY','ECONOMICS');-- IT WILL DO ASCEINDING
-- TO MAKE THE SUBJECT CHEMISTRY AND ECONOMICS

-- REAL QUERY
SELECT YEAR,SUBJECT,WINNER_NAME,COUNTRY,CATEGORY FROM NOBEL_WIN WHERE YEAR = 1970 ORDER BY SUBJECT NOT IN('CHEMISTRY','ECONOMICS') DESC;

SELECT YEAR, SUBJECT, WINNER_NAME, COUNTRY, CATEGORY FROM NOBEL_WIN WHERE YEAR = 1970 ORDER BY (SUBJECT IN ('CHEMISTRY', 'ECONOMICS')), SUBJECT ASC;

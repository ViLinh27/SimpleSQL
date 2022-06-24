--R(A,B) = {(0,1),(2,3),(0,1),(2,4),(3,4)}
--S(B,C) = {(0,1),(2,4),(2,5),(3,4),(0,2),(3,4)}

--Write the queries first, without creating the tables in SQLDeveloper. 
--Then create the tables in the database and check how many queries were correctly written.
DROP TABLE R;
DROP TABLE S;

CREATE TABLE R(
    A NUMBER,
    B NUMBER
);

CREATE TABLE S(
    B NUMBER,
    C NUMBER
);

INSERT INTO R VALUES(0,1);
INSERT INTO R VALUES(2,3);
INSERT INTO R VALUES(0,1);
INSERT INTO R VALUES(2,4);
INSERT INTO R VALUES(3,4);

INSERT INTO S VALUES(0,1);
INSERT INTO S VALUES(2,4);
INSERT INTO S VALUES(2,5);
INSERT INTO S VALUES(3,4);
INSERT INTO S VALUES(0,2);
INSERT INTO S VALUES(3,4);
--(i) [2pts] Finds A+B on R.
SELECT A+B From R;
--(ii) [2pts] Sorts R based on B,A.
SELECT A,B FROM R ORDER BY B, A;
--(iii) [2pts] Turns R from a bag to a set.
SELECT DISTINCT * FROM R;
--(iv) [2pts] Computes the sum of B for each A value in R.
SELECT A,SUM(B) AS sum_B FROM R
GROUP BY A;--record for each A
--(v) [4pts] Joins R and S and computes the max value of C for each A.
SELECT A,MAX(C) FROM R
INNER JOIN S ON R.B = S.B
GROUP BY A;
--vi) [2pts] Finds tuples of R which match and unmatch with S.
SELECT DISTINCT R.* FROM R
INNER JOIN S ON R.B = S.B;--match
SELECT R.* FROM R
LEFT OUTER JOIN S ON R.B = S.B
WHERE S.B IS NULL;--unmatch
--(vii) [2pts] Finds tuples of S which match and unmatch with R.
SELECT DISTINCT S.* FROM S
INNER JOIN R ON S.B=R.B; -- match
SELECT S.* FROM S
LEFT OUTER JOIN R ON S.B=R.B
WHERE R.B IS NULL;
--(viii) [4pts] Finds tuples of R which match and unmatch with S but 
--in which R.B is less than S.B.
SELECT R.*, S.* FROM R
INNER JOIN S ON R.B < S.B;--non equijoin, permitted
SELECT R.*, S.* FROM R
LEFT OUTER JOIN S ON R.B < S.B
WHERE S.B IS NULL;--unmatch
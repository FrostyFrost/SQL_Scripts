
 -- ฤ๋ÿ สมั
 
use TextCat
SELECT     TOP (100) PERCENT z1.m, z1.k, z1.res_rus, z2.res_eng, z3.res_ruseng

FROM         (SELECT     m, k, SUM(result) AS res_rus
                       FROM          dbo.kbs_result1
                       WHERE      (name LIKE 'r[a-z][a-z][0-9][0-9]')
                       GROUP BY m, k) AS z1 
                  INNER JOIN
                          (SELECT     m, k, SUM(result) AS res_eng
                            FROM          dbo.kbs_result1 AS kbs_result_1
                            WHERE      (name LIKE 'e[a-z][a-z][0-9][0-9]')
                            GROUP BY m, k) AS z2 ON z1.m = z2.m AND z1.k = z2.k 
                  INNER JOIN
                          (SELECT     m, k, SUM(result) AS res_ruseng
                            FROM          dbo.kbs_result1 AS kbs_result_1
                            WHERE       (name LIKE '[a-z][a-z][0-9][0-9]') 
                            GROUP BY m, k) AS z3 ON z1.m = z3.m AND z1.k = z3.k

--where res_ruseng <> res_rus 
                           
ORDER BY z1.m, z1.k

SELECT     TOP (100) PERCENT z1.m, z1.k, z1.res_rus, z2.res_eng, z3.res_ruseng
FROM         (SELECT     m, k, SUM(result) AS res_rus
                       FROM          dbo.kbs_result2
                       WHERE      (name LIKE 'r[a-z][a-z][0-9][0-9]')
                       GROUP BY m, k) AS z1 
                  INNER JOIN
                          (SELECT     m, k, SUM(result) AS res_eng
                            FROM          dbo.kbs_result2 AS kbs_result_1
                            WHERE      (name LIKE 'e[a-z][a-z][0-9][0-9]')
                            GROUP BY m, k) AS z2 ON z1.m = z2.m AND z1.k = z2.k 
                  INNER JOIN
                          (SELECT     m, k, SUM(result) AS res_ruseng
                            FROM          dbo.kbs_result2 AS kbs_result_1
                            WHERE       (name LIKE '[a-z][a-z][0-9][0-9]') 
                            GROUP BY m, k) AS z3 ON z1.m = z3.m AND z1.k = z3.k

--where res_ruseng <> res_rus 
                           
ORDER BY z1.m, z1.k
SELECT     TOP (100) PERCENT z1.m, z1.k, z1.res_rus, z2.res_eng, z3.res_ruseng
FROM         (SELECT     m, k, SUM(result) AS res_rus
                       FROM          dbo.kbs_result3
                       WHERE      (name LIKE 'r[a-z][a-z][0-9][0-9]')
                       GROUP BY m, k) AS z1 
                  INNER JOIN
                          (SELECT     m, k, SUM(result) AS res_eng
                            FROM          dbo.kbs_result3 AS kbs_result_1
                            WHERE      (name LIKE 'e[a-z][a-z][0-9][0-9]')
                            GROUP BY m, k) AS z2 ON z1.m = z2.m AND z1.k = z2.k 
                  INNER JOIN
                          (SELECT     m, k, SUM(result) AS res_ruseng
                            FROM          dbo.kbs_result3 AS kbs_result_1
                            WHERE       (name LIKE '[a-z][a-z][0-9][0-9]') 
                            GROUP BY m, k) AS z3 ON z1.m = z3.m AND z1.k = z3.k

--where res_ruseng <> res_rus 
                           
ORDER BY z1.m, z1.k

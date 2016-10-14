SELECT     TOP 100 PERCENT dbo.MI_I_eEO.word, dbo.MI_I_eEO.sum_countdocs, 1 * dbo.MI_I_eEO.max_MI_I + 1 *  dbo.RO_eEO.max_ro + 1*  dbo.S2_eEO.max_S2 AS Sum_uni6
                       FROM          dbo.MI_I_eEO INNER JOIN
                                              dbo.RO_eEO ON dbo.MI_I_eEO.word = dbo.RO_eEO.word INNER JOIN
                                              dbo.S2_eEO ON dbo.RO_eEO.word = dbo.S2_eEO.word where MI_I_eEO.word like  '%proces%'
                                              
                                              
select MI_I_eEO.word, max_MI_I,max_ro, max_S2  from dbo.MI_I_eEO INNER JOIN
                                              dbo.RO_eEO ON dbo.MI_I_eEO.word = dbo.RO_eEO.word INNER JOIN
                                              dbo.S2_eEO ON dbo.RO_eEO.word = dbo.S2_eEO.word where MI_I_eEO.word like '%proces%'
                                              
select  * from MI_I_eEO where word like  '%proces%'
select  * from RO_eeO  where word like  '%proces%'
select  * from S2_eEO where word like  '%proces%'
                                              
select  * from MI_I_rusengEO where word like  '%proces%'
select  * from RO_rusengeO  where word like  '%proces%'
select  * from S2_rusengEO where word like  '%proces%'
                                              
                                                                                            
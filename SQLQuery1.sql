--select word, count_words from mdt_rusengNM order by count_words desc
--select top 50 * from RO_rusengNM1
use textcat

select  mdt_rusengNM.word, count_words,  isnull(z1.r, 0) as RO , isnull(z2.r, 0) as MI_I, isnull(z3.r, 0) as S1, isnull(z4.r, 0) as S2,  (isnull(z1.rr, 0) + isnull(z2.rr, 0) + isnull(z3.rr, 0) + isnull(z4.rr, 0))as sum_profiles from mdt_rusengNM 
left join (select top 50 word,  ISNULL(RO_rusengNM1.max_ro, 0) as r, count(ISNULL(RO_rusengNM1.max_ro, 0)) as rr from RO_rusengNM1 group by word, max_ro order by max_ro desc ) as z1 on mdt_rusengNM.word = z1.word 
left join (select top 50 word,  isnull(MI_I_rusengNM1.max_MI_I,0) as r , count(ISNULL(MI_I_rusengNM1.max_MI_I, 0)) as rr from MI_I_rusengNM1 group by word, max_MI_I order by max_MI_I desc ) as z2 on mdt_rusengNM.word = z2.word 
left join (select top 50 word,  isnull(S1_rusengNM1.max_S1,0) as r  , count(ISNULL(S1_rusengNM1.max_S1, 0)) as rr from S1_rusengNM1 group by word, max_s1 order by max_s1 desc ) as z3 on mdt_rusengNM.word = z3.word 
left join (select top 50 word,  isnull(S2_rusengNM1.max_S2,0) as r  , count(ISNULL(S2_rusengNM1.max_s2, 0)) as rr from S2_rusengNM1 group by word, max_s2 order by max_s2 desc ) as z4 on mdt_rusengNM.word = z4.word 

order by sum_profiles desc



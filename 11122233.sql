use textcat

select * from temp_tak_low


select * from temp_dict_title
select * from temp_dict_abstract
select * from temp_dict_keywords
select * from temp_dict_titlekeywords
--high
select count(temp_tak_high.word)*100.00/185 from temp_tak_high inner join temp_dict_title on temp_dict_title.Word = temp_tak_high.word
select count(temp_tak_high.word)*100.00/185 from temp_tak_high inner join temp_dict_abstract on temp_dict_abstract.Word = temp_tak_high.word
select count(temp_tak_high.word)*100.00/185 from temp_tak_high inner join temp_dict_keywords on temp_dict_keywords.Word = temp_tak_high.word
--mid
select count(temp_tak_mid.word)*100.00/714 from temp_tak_mid inner join temp_dict_title on temp_dict_title.Word = temp_tak_mid.word
select count(temp_tak_mid.word)*100.00/714 from temp_tak_mid inner join temp_dict_abstract on temp_dict_abstract.Word = temp_tak_mid.word
select count(temp_tak_mid.word)*100.00/714 from temp_tak_mid inner join temp_dict_keywords on temp_dict_keywords.Word = temp_tak_mid.word
--low
select count(temp_tak_low.word)*100.00/13565 from temp_tak_low inner join temp_dict_title on temp_dict_title.Word = temp_tak_low.word
select count(temp_tak_low.word)*100.00/13565 from temp_tak_low inner join temp_dict_abstract on temp_dict_abstract.Word = temp_tak_low.word
select count(temp_tak_low.word)*100.00/13565 from temp_tak_low inner join temp_dict_keywords on temp_dict_keywords.Word = temp_tak_low.word



--high
select sum(temp_tak_high.title)*100.00/18277 from temp_tak_high inner join temp_dict_title on temp_dict_title.Word = temp_tak_high.word
select sum(temp_tak_high.abstract)*100.00/110577 from temp_tak_high inner join temp_dict_abstract on temp_dict_abstract.Word = temp_tak_high.word
select sum(temp_tak_high.keywords)*100.00/15002 from temp_tak_high inner join temp_dict_keywords on temp_dict_keywords.Word = temp_tak_high.word
--mid
select sum(temp_tak_mid.title)*100.00/18277 from temp_tak_mid inner join temp_dict_title on temp_dict_title.Word = temp_tak_mid.word
select sum(temp_tak_mid.abstract)*100.00/110577 from temp_tak_mid inner join temp_dict_abstract on temp_dict_abstract.Word = temp_tak_mid.word
select sum(temp_tak_mid.keywords)*100.00/15002 from temp_tak_mid inner join temp_dict_keywords on temp_dict_keywords.Word = temp_tak_mid.word
--low
select sum(temp_tak_low.title)*100.00/18277 from temp_tak_low inner join temp_dict_title on temp_dict_title.Word = temp_tak_low.word
select sum(temp_tak_low.abstract)*100.00/110577  from temp_tak_low inner join temp_dict_abstract on temp_dict_abstract.Word = temp_tak_low.word
select sum(temp_tak_low.keywords)*100.00/15002  from temp_tak_low inner join temp_dict_keywords on temp_dict_keywords.Word = temp_tak_low.word

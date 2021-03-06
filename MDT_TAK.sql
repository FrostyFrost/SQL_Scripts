use TextCat	
declare @name as nvarchar(12)
,@sh_name as nvarchar(8)
set @name = ''

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_MDT_TAK]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
	drop table temp_MDT_TAK


CREATE TABLE [dbo].[temp_MDT_TAK](
	[Word] [nvarchar](80) NOT NULL,
	[Title] [int] NULL,
	[Abstract] [int] NULL,
	[Keywords] [int] NULL
) ON [PRIMARY]


declare  cur_names cursor for								
	SELECT name FROM dbo.sysobjects WHERE name like 'q_[er]%' and xtype = 'U' order by name 
open cur_names
fetch next from cur_names into @name	
While @@FETCH_STATUS = 0
begin
	set @sh_name = RIGHT(@name, len(@name)-2)
	exec( 'insert into temp_MDT_TAK (Word, Title, Abstract, Keywords )  select word, '+ @sh_name +'_t as ''title'',  '+ @sh_name +'_a as ''abstract'',  '+ @sh_name +'_K as ''keywords'' from '+@name )
	--print (@name)
	--exec('select * from ' +  @name)		64-
	Fetch next from cur_names into @name
end
close cur_names
Deallocate cur_names	
delete from temp_MDT_TAK where LEN (word) <= 1

select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll' from temp_MDT_TAK  group by word order by   SUM (Title + abstract + Keywords) desc

--- общенаучные термины, единые для различных предметных областей  (метод, процедура…….),
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll'  from temp_MDT_TAK  group by word having  SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) > 0.95 and SUM (Title + abstract + Keywords) > 100 and   order by  SUM (Title + abstract + Keywords) desc

--- междисциплинарные понятия (обучение, выборка……),  характерные для нескольких предметных областей,
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll'  from temp_MDT_TAK group by word having  ( SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) > 0.7  and SUM (Title + abstract + Keywords) <= 100 and SUM (Title + abstract + Keywords) > 10) 
																																																												or (SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) > 0.7 and SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) <= 0.8 and SUM (Title + abstract + Keywords) > 10 )  
																																																												or (SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) > 0.6 and SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) <= 0.8 and SUM (Title + abstract + Keywords) > 250 )  order by  SUM (Title + abstract + Keywords) desc  -- and SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) <= 0.8  order by all1 desc --and SUM (Title + abstract + Keywords) < 300 and SUM (Title + abstract + Keywords) >100 
--- узкоспециализированные понятия, соответствующие конкретному научному направлению (нейросети, генетические алгоритмы……),
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll'  from temp_MDT_TAK group by word having (SUM (Title + abstract + Keywords) > 10 and SUM (Title + abstract + Keywords) <= 250 and SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) <= 0.7)
																																																												or (SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) <= 0.6  and SUM (Title + abstract + Keywords) > 10 )  order by  SUM (Title + abstract + Keywords) desc  -- and SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) <= 0.8  order by all1 desc --and SUM (Title + abstract + Keywords) < 300 and SUM (Title + abstract + Keywords) >100 
--- редкие термины, отражающие предпочтения и литературный стиль автора (критерий Уилкоксона или критерий Вилкоксона ….).
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords)as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll'  from temp_MDT_TAK group by word having (SUM (Title + abstract + Keywords) <= 10)    order by  SUM (Title + abstract + Keywords) desc  


-- Высокочастотные термины (tf > 220)
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll'  into temp_TAK_HIGH from temp_MDT_TAK  group by word having SUM (Title + abstract + Keywords) >= 150  order by   SUM (Title + abstract + Keywords) desc

--Среднечастотные
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll'  into temp_TAK_MID from temp_MDT_TAK  group by word having (SUM (Title + abstract + Keywords) < 150 and SUM (Title + abstract + Keywords) >= 35)  order by   SUM (Title + abstract + Keywords) desc

--Низкочастотные
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll' into temp_TAK_LOW from temp_MDT_TAK  group by word having (SUM (Title + abstract + Keywords) < 35 )  order by   SUM (Title + abstract + Keywords) desc


select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll' into temp_dict_title from temp_MDT_TAK  group by word having (sum(Title ) > 0 and sum(title+abstract++keywords)>=5) order by    (sum(Title )) desc
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll' into temp_dict_abstract from temp_MDT_TAK  group by word having (sum(abstract ) > 0 and sum(title+abstract++keywords)>=5)  order by    (sum(abstract )) desc
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll' into temp_dict_keywords from temp_MDT_TAK  group by word having (sum(keywords ) > 0 and  sum(title+abstract++keywords)>=5)   order by    (sum(keywords )) desc
select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll', SUM (keywords + title ) 'title+keywords' into temp_dict_titlekeywords from temp_MDT_TAK  group by word having (SUM (keywords + title )* 1.000 > 0 and sum(title+abstract++keywords)>=5 ) order by    (SUM (keywords + title )* 1.000) desc

--drop table temp_TAK_high
--drop table temp_dict_keywords
--drop table temp_dict_keywords
--drop table temp_dict_keywords
--drop table temp_dict_keywords
select * from temp_dict_title
select * from temp_dict_abstract
select * from temp_dict_keywords
select * from temp_dict_titlekeywords
select Word, SUM(title), SUM(abstract), SUM (keywords) from temp_MDT_TAK where LEN(word) <=1 group by word


select * from temp_TAK_HIGH
select * from temp_TAK_MID
select * from temp_TAK_low
--select Word, sum(Title ) as 'title', SUM(abstract) as 'abstract', SUM(Keywords ) as 'keywords', SUM (Title + abstract + Keywords) as 'SumAll', SUM (abstract )* 1.000 / SUM (Title + abstract + Keywords) as 'Abstract/SumAll', SUM (title )* 1.000 / SUM (Title + abstract + Keywords) as 'Title/SumAll', SUM (keywords )* 1.000 / SUM (Title + abstract + Keywords) as 'keywords/SumAll', SUM (keywords + title ) 'title+keywords' into temp_dict_keywordstitle from temp_MDT_TAK  group by word having (SUM (keywords+ title ) > 0 )  order by    (SUM (keywords + title)) desc
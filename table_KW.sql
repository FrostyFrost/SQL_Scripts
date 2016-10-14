use textcat
declare @str as nvarchar(max)
,@i as integer
,@cl as nvarchar(2)
exec('delete from table_KW')
exec('delete from table_t')
--
 DECLARE curs CURSOR
     FOR   SELECT class FROM classes
     OPEN curs
     FETCH NEXT FROM curs into @cl
     WHILE @@FETCH_STATUS = 0 BEGIN
		set @i = 1
		while @i < 81 
			begin
			set @str = 'insert into Table_kw(doc, sum_kw) select ''r' + @cl + ltrim(str(@i ))+''' , sum(r' + @cl + ltrim(str(@i ))+ '_k)   from q_r' + @cl + ltrim(str(@i ))
			exec (@str)
			
			
			set @i = @i + 1
		end
	 FETCH NEXT FROM curs into @cl	
	 end
	 
	  CLOSE curs
      DEALLOCATE curs

 DECLARE curs CURSOR
     FOR   SELECT class FROM classes
     OPEN curs
     FETCH NEXT FROM curs into @cl
     WHILE @@FETCH_STATUS = 0 BEGIN
		set @i = 1
		while @i < 81 
			begin
			set @str = 'insert into Table_kw(doc, sum_kw) select ''e' + @cl + ltrim(str(@i ))+''' , sum(e' + @cl + ltrim(str(@i ))+ '_k)   from q_e' + @cl + ltrim(str(@i ))
			exec (@str)
			
			
			set @i = @i + 1
		end
	 FETCH NEXT FROM curs into @cl	
	 end

-----------
close curs
deallocate curs

DECLARE curs CURSOR
     FOR   SELECT class FROM classes
     OPEN curs
     FETCH NEXT FROM curs into @cl
     WHILE @@FETCH_STATUS = 0 BEGIN
		set @i = 1
		while @i < 81 
			begin
			set @str = 'insert into Table_t(doc, sum_t) select ''r' + @cl + ltrim(str(@i ))+''' , sum(r' + @cl + ltrim(str(@i ))+ '_t)   from q_r' + @cl + ltrim(str(@i ))
			exec (@str)
			
			
			set @i = @i + 1
		end
	 FETCH NEXT FROM curs into @cl	
	 end
	 
	  CLOSE curs
      DEALLOCATE curs

 DECLARE curs CURSOR
     FOR   SELECT class FROM classes
     OPEN curs
     FETCH NEXT FROM curs into @cl
     WHILE @@FETCH_STATUS = 0 BEGIN
		set @i = 1
		while @i < 81 
			begin
			set @str = 'insert into Table_t(doc, sum_t) select ''e' + @cl + ltrim(str(@i ))+''' , sum(e' + @cl + ltrim(str(@i ))+ '_t)   from q_e' + @cl + ltrim(str(@i ))
			exec (@str)
			
			
			set @i = @i + 1
		end
	 FETCH NEXT FROM curs into @cl	
	 end
	 
close curs	 
deallocate curs

select * from table_KW where doc not like '%cr%' and  doc not like '%sl%' and  doc not like '%ac%' and  doc not like '%im%' and  doc not like '%ec%' and  doc not like '%md%' and sum_kw <=0 order by doc 
select * from table_T where doc not like '%cr%' and  doc not like '%sl%' and  doc not like '%ac%' and  doc not like '%im%' and  doc not like '%ec%' and  doc not like '%md%' and sum_t <=0 order by doc 
--select * into table_t from TAble_KW 

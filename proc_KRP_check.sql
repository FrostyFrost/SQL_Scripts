USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[KRP_check]    Script Date: 04/24/2013 17:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery33.sql|7|0|C:\Users\А\AppData\Local\Temp\~vsC5C1.sql


ALTER  PROCEDURE [dbo].[KRP_check]

AS

declare @z1 as nvarchar(2)
,@z2 as nvarchar(2)
,@z3 as nvarchar(2)
,@z4 as nvarchar(2)
,@z5 as nvarchar(2)
,@result as nvarchar(2)
,@i as integer = 0 --по классам
,@j as integer = 0 --по документам
,@name as nvarchar(2)
,@sqlstr  as nvarchar(max)
,@KRP_num as integer

BEGIN
	------PARAMETERS
set @KRP_num = 5	--количество классификаторов
	------parameters
	
	
update tblCHI2_KRP set  TM=0, SC=0, NM=0, EO=0, SA=0, CO=0, MC=0, RO=0, DB=0, AU=0, CD=0, [IS]=0, PR=0, ST=0, OS=0
set @sqlstr = ''
set @i = 1
while @i < 7 +1
	begin
	set @sqlstr = @sqlstr + rtrim((select class from classes where num = (select cl_num from MDT_current where num = @i)))+ ', '

	set @j = 56
	while @j < 67 +1
		begin
			drop table temp_KRP
			set @name = rtrim((select class from Classes where num = (select cl_num from MDT_current where num = @i) ))
			
			if @KRP_num = 3 
			begin
				exec ('Select ['+@name+'] as t1 , ''1'' as num into temp_KRP from tblCHI2_1 where num = '+@j+'
						insert INTO [TextCat].[dbo].[temp_KRP] (t1, num) select ['+@name+'], 2  from tblCHI2_2 where num = '+@j+'
						insert INTO [TextCat].[dbo].[temp_KRP] (t1, num) select ['+@name+'], 3  from tblCHI2_3 where num = '+@j)
				
				set @z1 = (select t1 from temp_KRP  where num  = '1')
				print @z1
				set @z2 = (select t1 from temp_KRP where num  = '2')
				print @z2
				set @z3 = (select t1 from temp_KRP where num  = '3')
				print @z3


				if @z1 =@z2 or @z1 = @z3	
						set @result =  @z1
				else if @z2 = @z3	
						set @result =  @z2
				else if @z1 <> @z2 and @z1 <> @z3 and @z2<>@z3
						set @result =  'XX'
			end
			else if @KRP_num = 5
			begin	
					exec ('Select ['+@name+'] as t1 , ''1'' as num into temp_KRP from tblCHI2_1 where num = '+@j+'
						insert INTO [TextCat].[dbo].[temp_KRP] (t1, num) select ['+@name+'], 2  from tblCHI2_2 where num = '+@j+'
						insert INTO [TextCat].[dbo].[temp_KRP] (t1, num) select ['+@name+'], 3  from tblCHI2_3 where num = '+@j+'
						insert INTO [TextCat].[dbo].[temp_KRP] (t1, num) select ['+@name+'], 4  from NB_results where num = '+@j+'
						insert INTO [TextCat].[dbo].[temp_KRP] (t1, num) select ['+@name+'], 5  from tblCHI2_5 where num = '+@j)
				
				set @z1 = (select t1 from temp_KRP  where num  = '1')
				print @z1
				set @z2 = (select t1 from temp_KRP where num  = '2')
				print @z2
				set @z3 = (select t1 from temp_KRP where num  = '3')
				print @z3
				set @z4 = (select t1 from temp_KRP where num  = '4')
				print @z4
				set @z5 = (select t1 from temp_KRP where num  = '5')
				print @z5

				if (@z1 = @z2 and @z1 = @z3) or (@z1 = @z2 and @z1 = @z4) or (@z1 = @z2 and @z1 = @z5) or (@z1 = @z3 and @z1 = @z4) or (@z1 = @z3 and @z1 = @z5) or (@z1 = @z4 and @z1 = @z5 )
						set @result =  @z1
				else if (@z2 = @z3 and @z2 = @z4) or (@z2 = @z3 and @z2 = @z5)  
						set @result =  @z2
				else if (@z3 = @z4 and @z3 = @z5)  
						set @result =  @z3
				else if @z1 = @z2 and  (@z3 <> @z4 or @z3 <> @z5 or @z4 <> @z5)
						set @result =  @z1						
				else if @z1 = @z3 and  (@z2 <> @z4 or @z2 <> @z5 or @z4 <> @z5)
						set @result =  @z1						
				else if @z1 = @z4 and  (@z2 <> @z3 or @z2 <> @z5 or @z3 <> @z5)
						set @result =  @z1						
				else if @z1 = @z5 and  (@z2 <> @z3 or @z2 <> @z4 or @z3 <> @z4)
						set @result =  @z1
				else if @z2 = @z3 and  (@z1 <> @z4 or @z1 <> @z5 or @z4 <> @z5)
						set @result =  @z2						
				else if @z2 = @z4 and  (@z1 <> @z3 or @z1 <> @z5 or @z3 <> @z5)
						set @result =  @z2
				else if @z2 = @z5 and  (@z1 <> @z3 or @z1 <> @z4 or @z3 <> @z4)
						set @result =  @z2	
				else if @z3 = @z4 and  (@z1 <> @z2 or @z1 <> @z3 or @z2 <> @z3)
						set @result =  @z3											
				else if @z3 = @z5 and  (@z1 <> @z2 or @z1 <> @z4 or @z2 <> @z4)
						set @result =  @z3
				else if @z4 = @z5 and  (@z1 <> @z2 or @z1 <> @z3 or @z1 <> @z3)
						set @result =  @z4																			
				else set @result =  'XX'
			end
 				
			exec('update tblCHI2_KRP set ['+@name+'] = '''+@result+''' where num = '+@j )

			Set @j = @j+1
		end
	Set @i = @i+1
	end


set @sqlstr = left(@sqlstr, len(@sqlstr )- 1)
exec('select '+@sqlstr+'  from tblCHI2_KRP')
END

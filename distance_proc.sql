USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].['+ @col1 +'_raschet]    Script Date: 08/10/2015 14:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--выводит значение расстояния:
--DECLARE	@returnn float

--EXEC	 [dbo].[distance]
--		@obj1 = N'cent_eAU',
--		@obj2 = N'q_eAU67',
--		@method = N'evkl',
--		@ret = @returnn OUTPUT

--SELECT	@returnn as 'Расстояние'

alter  procedure [dbo].[distance] (@obj1 as nvarchar(20), @obj2 as nvarchar(20), @method as nvarchar(10) = 'evkl', @ret as float output) 
								--@obj1,2 -названия таблиц

AS
BEGIN
declare 

--@ret as float
@sqlstr1 as nvarchar (max)= ''
,@col1 as nvarchar(20)
,@col2 as nvarchar(20)


if @obj1 like 'q_%' set @col1 = RIGHT(@obj1, LEN(@obj1) - 2) 
if @obj2 like 'q_%' set @col2 = RIGHT(@obj2, LEN(@obj2) - 2) 

if @obj1 like 'cent_%' set @col1 = 'count_words'
if @obj2 like 'cent_%' set @col2 = 'count_words'

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[temp_dist]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table temp_dist


if @method = 'evkl' 
	begin
	exec ('Select sum (z1.dist) as DISTANCE into temp_dist from
				(SELECT     dbo.'+ @obj1 +'.word, square(dbo.'+ @obj1 +'.'+ @col1 +' - dbo.'+ @obj2 +'.'+ @col2 +') AS Dist
				FROM         dbo.'+ @obj1 +' INNER JOIN
									  dbo.'+ @obj2 +' ON dbo.'+ @obj1 +'.word = dbo.'+ @obj2 +'.word
				union 
				SELECT     dbo.'+ @obj1 +'.word, square(dbo.'+ @obj1 +'.'+ @col1 +') AS Dist
				FROM         dbo.'+ @obj1 +' LEFT OUTER JOIN
									  dbo.'+ @obj2 +' ON dbo.'+ @obj1 +'.word = dbo.'+ @obj2 +'.word
				WHERE     (dbo.'+ @obj2 +'.'+ @col2 +' IS NULL)
				union 
				SELECT     dbo.'+ @obj2 +'.word, square(dbo.'+ @obj2 +'.'+ @col2 +') AS Dist
				FROM         dbo.'+ @obj1 +' RIGHT OUTER JOIN
									  dbo.'+ @obj2 +' ON dbo.'+ @obj1 +'.word = dbo.'+ @obj2 +'.word
				WHERE     (dbo.'+ @obj1 +'.'+ @col1 +' IS NULL)) as Z1 ')
							
		  
							
	end
--else if @method = 'cos'
--	begin
--		set @i=2
--	end
	
select @ret = distance from temp_dist	


END


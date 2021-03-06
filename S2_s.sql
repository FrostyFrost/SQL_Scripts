USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[S2_s]    Script Date: 01/26/2016 21:34:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE [dbo].[S2_S](  @name as varchar (10) = 'TM')
							--@Vol - объем обучающей выборки;  @N - общее количество документов в обучающей выборке


------ОБУЧЕНИЕ
AS
declare 
@sql as nvarchar(max)
,@i as integer
,@tf as float -- вес термина 
,@exam_word as nvarchar(max)
,@lang as nvarchar(1)

--рус
set @lang = 'r'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_s_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_s_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_S2 as max_S2_s  into S2_s_'+@lang+@name + ' from S2_'+@lang+@name )
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.00010 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.00009 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.00008 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--engl
set @lang = 'e'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_s_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_s_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_S2 as max_S2_s  into S2_s_'+@lang+@name + ' from S2_'+@lang+@name )
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.00007 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.00006 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.00005 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')


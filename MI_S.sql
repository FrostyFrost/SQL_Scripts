USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[MI_S]    Script Date: 01/26/2016 21:33:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
alter PROCEDURE [dbo].[MI_S](  @name as varchar (10) = 'TM')
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
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MI_S_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table MI_S_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_MI_I as max_MI_S  into MI_S_'+@lang+@name + ' from MI_I_'+@lang+@name )
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.00010 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.00009 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.00008 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--engl
set @lang = 'e'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MI_S_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table MI_S_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_MI_I as max_MI_S  into MI_S_'+@lang+@name + ' from MI_I_'+@lang+@name )
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.00007 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.00006 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.00005 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')


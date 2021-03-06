USE [TextCat]
GO
/****** Object:  StoredProcedure [dbo].[RO_S]    Script Date: 01/26/2016 22:26:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[RO_S](  @name as varchar (10) = 'TM')
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
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_S_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table RO_S_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_ro as max_RO_S  into RO_S_'+@lang+@name + ' from ro_'+@lang+@name )
exec ('update RO_S_'+@lang+@name + ' set  max_RO_S = max_RO_S + 0.000010 from   mdt_tak_'+@lang+@name + ' right join RO_S_'+@lang+@name + ' on RO_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update RO_S_'+@lang+@name + ' set  max_RO_S = max_RO_S + 0.000009 from   mdt_tak_'+@lang+@name + ' right join RO_S_'+@lang+@name + ' on RO_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update RO_S_'+@lang+@name + ' set  max_RO_S = max_RO_S + 0.000008 from   mdt_tak_'+@lang+@name + ' right join RO_S_'+@lang+@name + ' on RO_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--engl
set @lang = 'e'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RO_S_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table RO_S_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_ro as max_RO_S  into RO_S_'+@lang+@name + ' from ro_'+@lang+@name )
exec ('update RO_S_'+@lang+@name + ' set  max_RO_S = max_RO_S + 0.000007 from   mdt_tak_'+@lang+@name + ' right join RO_S_'+@lang+@name + ' on RO_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update RO_S_'+@lang+@name + ' set  max_RO_S = max_RO_S + 0.000006 from   mdt_tak_'+@lang+@name + ' right join RO_S_'+@lang+@name + ' on RO_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update RO_S_'+@lang+@name + ' set  max_RO_S = max_RO_S + 0.000005 from   mdt_tak_'+@lang+@name + ' right join RO_S_'+@lang+@name + ' on RO_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--рус
set @lang = 'r'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_s_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_s_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_S2 as max_S2_s  into S2_s_'+@lang+@name + ' from S2_'+@lang+@name )
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.000010 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.000009 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.000008 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--engl
set @lang = 'e'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[S2_s_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table S2_s_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_S2 as max_S2_s  into S2_s_'+@lang+@name + ' from S2_'+@lang+@name )
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.000007 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.000006 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update S2_s_'+@lang+@name + ' set  max_S2_s = max_S2_s + 0.000005 from   mdt_tak_'+@lang+@name + ' right join S2_s_'+@lang+@name + ' on S2_s_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--рус
set @lang = 'r'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MI_S_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table MI_S_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_MI_I as max_MI_S  into MI_S_'+@lang+@name + ' from MI_I_'+@lang+@name )
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.000010 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.000009 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.000008 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')

--engl
set @lang = 'e'
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[MI_S_'+@lang+@name+']') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec ('drop table MI_S_'+@lang+@name)

exec( 'select max_num, word, sum_countdocs, max_MI_I as max_MI_S  into MI_S_'+@lang+@name + ' from MI_I_'+@lang+@name )
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.000007 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K>0 -- where T>0 and A>0 and K>0   ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.000006 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A=0 and K>0 ')
exec ('update MI_S_'+@lang+@name + ' set  max_MI_S = max_MI_S + 0.000005 from   mdt_tak_'+@lang+@name + ' right join MI_S_'+@lang+@name + ' on MI_S_'+@lang+@name + '.word = mdt_tak_'+@lang+@name + '.word where T>0 and A>0 and K=0 ')



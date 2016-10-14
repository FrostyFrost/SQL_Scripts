alter procedure TblRes_Create (@method as nvarchar(4))
AS

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblRes_'+@method+']') )
exec('DROP TABLE [dbo].[tblRes_'+@method+']')



/****** Object:  Table [dbo].[tblRes_MI_I]    Script Date: 02/25/2014 09:52:08 ******/

exec('
CREATE TABLE [dbo].[tblRes_'+@method+'](
	[num] [int] NULL,
	[TM] [nchar](10) NULL,
	[SC] [nchar](10) NULL,
	[NM] [nchar](10) NULL,
	[EO] [nchar](10) NULL,
	[SA] [nchar](10) NULL,
	[CO] [nchar](10) NULL,
	[MC] [nchar](10) NULL,
	[RO] [nchar](10) NULL,
	[DB] [nchar](10) NULL,
	[AU] [nchar](10) NULL,
	[CD] [nchar](10) NULL,
	[IS] [nchar](10) NULL,
	[PR] [nchar](10) NULL,
	[ST] [nchar](10) NULL,
	[OS] [nchar](10) NULL,
	[TV] [nchar](10) NULL,
	[DM] [nchar](10) NULL,
	[TI] [nchar](10) NULL,
	[FR] [nchar](10) NULL
) ON [PRIMARY]



insert into [dbo].[tblRes_'+@method+'] ([num]) values (66),(67),(68),(69),(70),(71),(72),(73),(74),(75),(76),(77),(78),(79),(80)
select * from [dbo].[tblRes_'+@method+']

')

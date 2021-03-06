/****** Сценарий для команды SelectTopNRows среды SSMS  ******/
declare @p1 as bit
 ,@p2 as bit
,@TM as nvarchar(2)
,@SC as nvarchar(2)
,@NM as nvarchar(2)
,@EO as nvarchar(2)
,@SA as nvarchar(2)
,@CO as nvarchar(2)
,@MC as nvarchar(2)
,@RO as nvarchar(2)
,@DB as nvarchar(2)
,@AU as nvarchar(2)
,@CD as nvarchar(2)
,@IS as nvarchar(2)
,@PR as nvarchar(2)
,@ST as nvarchar(2)
,@OS as nvarchar(2)

,@TM2 as nvarchar(2)
,@SC2 as nvarchar(2)
,@NM2 as nvarchar(2)
,@EO2 as nvarchar(2)
,@SA2 as nvarchar(2)
,@CO2 as nvarchar(2)
,@MC2 as nvarchar(2)
,@RO2 as nvarchar(2)
,@DB2 as nvarchar(2)
,@AU2 as nvarchar(2)
,@CD2 as nvarchar(2)
,@IS2 as nvarchar(2)
,@PR2 as nvarchar(2)
,@ST2 as nvarchar(2)
,@OS2 as nvarchar(2)

,@CURSOR CURSOR
,@CURSOR2 CURSOR
,@a as int = 0
,@b as int = 0
,@c as int = 0
,@d as int= 0
,@resQ as float
,@resCor as float
,@resZ as float


SELECT *
  FROM [TextCat].[dbo].[tblRes_RO1a]

SELECT *
  FROM [TextCat].[dbo].[tblRes_MI_I1a]
  
 SET @CURSOR  = CURSOR 
	FOR
	SELECT  tm, sc, nm, EO, SA, CO, MC, RO, DB, AU, CD, [IS], PR, ST, OS FROM [TextCat].[dbo].[tblRes_uni11a] 
 
 SET @CURSOR2  = CURSOR 
	FOR
	SELECT  tm, sc, nm , EO, SA, CO, MC, RO, DB, AU, CD, [IS], PR, ST, OS FROM [TextCat].[dbo].[tblRes_uni51a] 	
	
OPEN @CURSOR;
open @cursor2
/*Выбираем первую строку*/
FETCH NEXT FROM @CURSOR INTO  @TM, @SC, @NM,  @EO,@SA, @CO, @MC, @RO,@DB,@AU,@CD, @IS, @PR, @ST, @OS
FETCH NEXT FROM @CURSOR2 INTO  @TM2, @SC2, @NM2, @EO2, @SA2, @CO2, @MC2, @RO2,@DB2,@AU2,@CD2, @IS2, @PR2, @ST2, @OS2
/*Выполняем в цикле перебор строк*/
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @TM <> '0'
	begin
		if @TM = 'TM' and @TM2= 'TM'  set @a = @a +1
		if @TM = 'TM' and @TM2<> 'TM'  set @b = @b +1
		if @TM <> 'TM' and @TM2= 'TM'  set @c = @c +1
		if @TM <> 'TM' and @TM2<> 'TM'  set @d = @d +1
	end
	IF @sc <> '0'
	begin
		if @SC = 'sc' and @SC2= 'sc'  set @a = @a +1
		if @SC = 'sc' and @SC2<> 'sc'  set @b = @b +1
		if @SC <> 'sc' and @SC2= 'sc'  set @c = @c +1
		if @SC <> 'sc' and @SC2<> 'sc'  set @d = @d +1
	end
	
		IF @nm <> '0'
		begin
			if @NM = 'NM' and @NM2= 'NM'  set @a = @a +1
			if @NM = 'NM' and @NM2<> 'NM'  set @b = @b +1
			if @NM <> 'NM' and @NM2= 'NM'  set @c = @c +1
			if @NM <> 'NM' and @NM2<> 'NM'  set @d = @d +1
		end

		IF @eo <> '0'
		begin
			if @EO = 'EO' and @EO2= 'EO'  set @a = @a +1
			if @EO = 'EO' and @EO2<> 'EO'  set @b = @b +1
			if @EO <> 'EO' and @EO2= 'EO'  set @c = @c +1
			if @EO <> 'EO' and @EO2<> 'EO'  set @d = @d +1
		end
		
		IF @sa <> '0'
		begin			
			if @SA = 'SA' and @SA2= 'SA'  set @a = @a +1
			if @SA = 'SA' and @SA2<> 'SA'  set @b = @b +1
			if @SA <> 'SA' and @SA2= 'SA'  set @c = @c +1
			if @SA <> 'SA' and @SA2<> 'SA'  set @d = @d +1
		end
		
		
	IF @CO <> '0'
		begin	
			if @CO = 'CO' and @CO2= 'CO'  set @a = @a +1
			if @CO = 'CO' and @CO2<> 'CO'  set @b = @b +1
			if @CO <> 'CO' and @CO2= 'CO'  set @c = @c +1
			if @CO <> 'CO' and @CO2<> 'CO'  set @d = @d +1
		end
	
	IF @MC <> '0'
		begin
			if @MC = 'MC' and @MC2= 'MC'  set @a = @a +1
			if @MC = 'MC' and @MC2<> 'MC'  set @b = @b +1
			if @MC <> 'MC' and @MC2= 'MC'  set @c = @c +1
			if @MC <> 'MC' and @MC2<> 'MC'  set @d = @d +1
		end
		
	IF @ro <> '0'
		begin		
			if @RO = 'RO' and @RO2= 'RO'  set @a = @a +1
			if @RO = 'RO' and @RO2<> 'RO'  set @b = @b +1
			if @RO <> 'RO' and @RO2= 'RO'  set @c = @c +1
			if @RO <> 'RO' and @RO2<> 'RO'  set @d = @d +1
		end
		
	IF @db <> '0'
		begin
			if @DB = 'DB' and @DB2= 'DB'  set @a = @a +1
			if @DB = 'DB' and @DB2<> 'DB'  set @b = @b +1
			if @DB <> 'DB' and @DB2= 'DB'  set @c = @c +1
			if @DB <> 'DB' and @DB2<> 'DB'  set @d = @d +1
		end	
		
		
	IF @au <> '0'
		begin
			if @AU = 'AU' and @AU2= 'AU'  set @a = @a +1
			if @AU = 'AU' and @AU2<> 'AU'  set @b = @b +1
			if @AU <> 'AU' and @AU2= 'AU'  set @c = @c +1
			if @AU <> 'AU' and @AU2<> 'AU'  set @d = @d +1		
		end


	IF @cd <> '0'
		begin
			if @CD = 'CD' and @CD2= 'CD'  set @a = @a +1
			if @CD = 'CD' and @CD2<> 'CD'  set @b = @b +1
			if @CD <> 'CD' and @CD2= 'CD'  set @c = @c +1
			if @CD <> 'CD' and @CD2<> 'CD'  set @d = @d +1
		end
		
	IF @is <> '0'
		begin
			if @IS = 'IS' and @IS2= 'IS'  set @a = @a +1
			if @IS = 'IS' and @IS2<> 'IS'  set @b = @b +1
			if @IS <> 'IS' and @IS2= 'IS'  set @c = @c +1
			if @IS <> 'IS' and @IS2<> 'IS'  set @d = @d +1	
		end
		
	IF @pr <> '0'
		begin		
			if @PR = 'PR' and @PR2= 'PR'  set @a = @a +1
			if @PR = 'PR' and @PR2<> 'PR'  set @b = @b +1
			if @PR <> 'PR' and @PR2= 'PR'  set @c = @c +1
			if @PR <> 'PR' and @PR2<> 'PR'  set @d = @d +1
		end
		
	IF @st <> '0'
		begin	
			if @ST = 'ST' and @ST2= 'ST'  set @a = @a +1
			if @ST = 'ST' and @ST2<> 'ST'  set @b = @b +1
			if @ST <> 'ST' and @ST2= 'ST'  set @c = @c +1
			if @ST <> 'ST' and @ST2<> 'ST'  set @d = @d +1
		end
		
	IF @os <> '0'
		begin		
			if @OS = 'OS' and @OS2= 'OS'  set @a = @a +1
			if @OS = 'OS' and @OS2<> 'OS'  set @b = @b +1
			if @OS <> 'OS' and @OS2= 'OS'  set @c = @c +1
			if @OS <> 'OS' and @OS2<> 'OS'  set @d = @d +1
		end

	FETCH NEXT FROM @CURSOR INTO  @TM, @SC, @NM,  @EO,@SA, @CO, @MC, @RO,@DB,@AU,@CD, @IS, @PR, @ST, @OS
	FETCH NEXT FROM @CURSOR2 INTO  @TM2, @SC2, @NM2, @EO2, @SA2, @CO2, @MC2, @RO2,@DB2,@AU2,@CD2, @IS2, @PR2, @ST2, @OS2

end
close @cursor

set @resQ = 1.00*(@a*@d - @b*@c)/(1.00*(@a*@d + @b*@c))
set @resCor = 1.00*(@a*@d - @b*@c)/sqrt(1.00*(@a+@c)*(@b+@d)*(@a+@b)*(@c+@d))
set @resZ = 1.00*( @b+@c)/(@a+@b+@c+@d)

select @a as a, @b as b, @c as c, @d as d, @resQ as resQ, @resCor as resCor, @resZ as resZ, (@a+@b+@c+@d)
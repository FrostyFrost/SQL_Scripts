USE [TextCat]
GO
/****** Object:  UserDefinedFunction [dbo].[Viborka_Check]    Script Date: 05/27/2016 19:35:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER function [dbo].[Viborka_Check] () 
returns int 
as

BEGIN
	declare @viborka as int

 
	If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 1 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 1
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 1 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 2
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 3
	else if (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 4
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 5
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 6
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 1 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 7
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 8		
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 1 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 9
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 10
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 11
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 1 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 12
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 1 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 13
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 14
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 15
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 16
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 1 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 1 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 17
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 1 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 18
	else If (Select cur from Classes where Class = 'SA') = 0 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 1 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 1 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 0
		set @viborka  = 19
	else If (Select cur from Classes where Class = 'SA') = 1 and (Select cur from Classes where Class = 'CO') = 0 and (Select cur from Classes where Class = 'MC') = 0 and  (Select cur from Classes where Class = 'RO') = 0 and (Select cur from Classes where Class = 'DB') = 0 and (Select cur from Classes where Class = 'AU') = 0 and (Select cur from Classes where Class = 'CD') = 0 and (Select cur from Classes where Class = 'IS') = 1
		set @viborka  = 20
					
	else if (Select cur from Classes where Class = 'CL') = 1  and (Select cur from Classes where Class = 'PL') = 0 and (Select cur from Classes where Class = 'ML') = 1 and (Select cur from Classes where Class = 'FL') = 1 and (Select cur from Classes where Class = 'WS') = 1
		set @viborka  = 21
	else if (Select cur from Classes where Class = 'CL') = 0  and (Select cur from Classes where Class = 'PL') = 0 and (Select cur from Classes where Class = 'ML') = 1 and (Select cur from Classes where Class = 'FL') = 1 and (Select cur from Classes where Class = 'WS') = 1
		set @viborka  = 22
	else if (Select cur from Classes where Class = 'CL') = 1  and (Select cur from Classes where Class = 'PL') = 1 and (Select cur from Classes where Class = 'ML') = 0 and (Select cur from Classes where Class = 'FL') = 0 and (Select cur from Classes where Class = 'WS') = 0
		set @viborka  = 23		
	else if (Select cur from Classes where Class = 'CL') = 1  and (Select cur from Classes where Class = 'PL') = 1 and (Select cur from Classes where Class = 'ML') = 0 and (Select cur from Classes where Class = 'FL') = 0 and (Select cur from Classes where Class = 'WS') = 1
		set @viborka  = 24		
	else if (Select cur from Classes where Class = 'CL') = 0  and (Select cur from Classes where Class = 'PL') = 1 and (Select cur from Classes where Class = 'ML') = 1 and (Select cur from Classes where Class = 'FL') = 1 and (Select cur from Classes where Class = 'WS') = 0
		set @viborka  = 25
	else if (Select cur from Classes where Class = 'PS') = 1  and (Select cur from Classes where Class = 'CP') = 1 and (Select cur from Classes where Class = 'NL') = 1  and (Select cur from Classes where Class = 'NV') = 0
		set @viborka  = 26
	else if (Select cur from Classes where Class = 'PS') = 0  and (Select cur from Classes where Class = 'CP') = 0 and (Select cur from Classes where Class = 'NL') = 1  and (Select cur from Classes where Class = 'NV') = 1
		set @viborka  = 27
	else if (Select cur from Classes where Class = 'PS') = 1  and (Select cur from Classes where Class = 'CP') = 1 and (Select cur from Classes where Class = 'NL') = 1  and (Select cur from Classes where Class = 'NV') = 1
		set @viborka  = 28
	else if (Select cur from Classes where Class = 'PS') = 0  and (Select cur from Classes where Class = 'CP') = 1 and (Select cur from Classes where Class = 'NL') = 1  and (Select cur from Classes where Class = 'NV') = 1
		set @viborka  = 29
	ELSE if (Select cur from Classes where Class = 'CL') = 1  and (Select cur from Classes where Class = 'PL') = 0 and (Select cur from Classes where Class = 'ML') = 1 and (Select cur from Classes where Class = 'FL') = 1 and (Select cur from Classes where Class = 'WS') = 0
		SET @VIBORKA = 30
	ELSE if (Select cur from Classes where Class = 'CL') = 1  and (Select cur from Classes where Class = 'PL') = 0 and (Select cur from Classes where Class = 'ML') = 1 and (Select cur from Classes where Class = 'FL') = 0 and (Select cur from Classes where Class = 'WS') = 1
		SET @VIBORKA = 31
	ELSE if (Select cur from Classes where Class = 'CL') = 1  and (Select cur from Classes where Class = 'PL') = 1 and (Select cur from Classes where Class = 'ML') = 0 and (Select cur from Classes where Class = 'FL') = 1 and (Select cur from Classes where Class = 'WS') = 1
		SET @VIBORKA = 32
	ELSE if (Select cur from Classes where Class = 'CL') = 0  and (Select cur from Classes where Class = 'PL') = 1 and (Select cur from Classes where Class = 'ML') = 0 and (Select cur from Classes where Class = 'FL') = 1 and (Select cur from Classes where Class = 'WS') = 1
		SET @VIBORKA = 33
	else if (Select cur from Classes where Class = 'PS') = 1  and (Select cur from Classes where Class = 'CP') = 1 and (Select cur from Classes where Class = 'NL') = 0  and (Select cur from Classes where Class = 'NV') = 1
		set @viborka = 34
	else if (Select cur from Classes where Class = 'PS') = 1  and (Select cur from Classes where Class = 'CP') = 1 and (Select cur from Classes where Class = 'NL') = 0  and (Select cur from Classes where Class = 'NV') = 0
		set @viborka = 35
		
	else if (Select cur from Classes where Class = 'SV') = 1  and (Select cur from Classes where Class = 'AL') = 0
		set @viborka = 101	
	else if (Select cur from Classes where Class = 'SV') = 0  and (Select cur from Classes where Class = 'AL') = 1 and (Select cur from Classes where Class = 'NO') = 0
		set @viborka = 102		
	else if (Select cur from Classes where Class = 'SV') = 1  and (Select cur from Classes where Class = 'AL') = 1 and (Select cur from Classes where Class = 'NO') = 1 and (Select cur from Classes where Class = 'le') = 0
		set @viborka = 103	
	else if (Select cur from Classes where Class = 'SV') = 0  and (Select cur from Classes where Class = 'AL') = 0
		set @viborka = 104	
	else if (Select cur from Classes where Class = 'SV') = 0  and (Select cur from Classes where Class = 'AL') = 1 and (Select cur from Classes where Class = 'NO') = 1
		set @viborka = 105	
	else if (Select cur from Classes where Class = 'SV') = 1  and (Select cur from Classes where Class = 'AL') = 1 and (Select cur from Classes where Class = 'NO') = 1 and (Select cur from Classes where Class = 'le') = 1
		set @viborka = 106	
		
		
		
			else set @viborka = 0


	Return (@viborka);
end


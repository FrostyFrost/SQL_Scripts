alter FUNCTION [dbo].[_Min]
   (@value1 float,
    @value2 float)
RETURNS float 
AS
BEGIN
  declare @res float
   if @value1 is null set @res=@value2
   else if @value2 is null set @res=@value1
   else if @value1<@value2 set @res=@value1
   else set @res=@value2
   RETURN(@res)
END
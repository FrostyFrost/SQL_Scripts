/*
Copyright (c)2006 , Keith Lubell
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. 
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. 
Neither the name of the <ORGANIZATION> nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission. 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/****** Object:  Table [dbo].[tblPorterStemming]    Script Date: 5/16/2006 3:52:41 PM ******/
CREATE TABLE [dbo].[tblPorterStemming] (
	[Step] [int] NOT NULL ,
	[Ordering] [int] NOT NULL ,
	[phrase1] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL ,
	[phrase2] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
) ON [PRIMARY]
GO
-- INSERT THE DATA
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,0,'sses','ss')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,1,'ies','i')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,2,'ss','ss')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,3,'s','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,0,'ational','ate')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,1,'tional','tion')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,2,'enci','ence')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,3,'anci','ance')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,4,'izer','ize')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,5,'bli','ble')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,6,'alli','al')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,7,'entli','ent')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,8,'eli','e')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,9,'ousli','ous')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,10,'ization','ize')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,11,'ation','ate')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,12,'ator','ate')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,13,'alism','al')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,14,'iveness','ive')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,15,'fulness','ful')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,16,'ousness','ous')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,17,'aliti','al')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,18,'iviti','ive')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,19,'biliti','ble')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,20,'logi','log')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,0,'icate','ic')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,1,'ative','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,2,'alize','al')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,3,'iciti','ic')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,4,'ical','ic')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,5,'ful','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,6,'ness','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,0,'al','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,1,'ance','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,2,'ence','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,3,'er','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,4,'ic','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,5,'able','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,6,'ible','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,7,'ant','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,8,'ement','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,9,'ment','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,10,'ent','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,11,'ion','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,12,'ou','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,13,'ism','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,14,'ate','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,15,'iti','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,16,'ous','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,17,'ive','')
INSERT INTO [tblPorterStemming]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,18,'ize','')
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterAlgorithm
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN
    DECLARE @Ret nvarchar(4000), @Temp nvarchar(4000)

    -- DO some initial cleanup
    SELECT @Ret = LOWER(ISNULL(RTRIM(LTRIM(@InWord)),N''))

    -- only strings greater than 2 are stemmed
    IF LEN(@Ret) > 2
	BEGIN
	    SELECT @Ret = dbo.fnPorterStep1(@Ret)
	    SELECT @Ret = dbo.fnPorterStep2(@Ret)
	    SELECT @Ret = dbo.fnPorterStep3(@Ret)
	    SELECT @Ret = dbo.fnPorterStep4(@Ret)
	    SELECT @Ret = dbo.fnPorterStep5(@Ret)
	END

--End of Porter's algorithm.........returning the word
    RETURN @Ret
 
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterCVCpattern
	(
		@Word nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN

--local variables
    DECLARE @Ret nvarchar(4000), @i int

--checking each character to see if it is a consonent or a vowel. also inputs the information in const_vowel
SELECT @i = 1, @Ret = N''
WHILE @i <= LEN(@Word)
    BEGIN
	IF CHARINDEX(SUBSTRING(@Word,@i,1), N'aeiou') > 0
	    BEGIN
		SELECT @Ret = @Ret + N'v'
	    END
	-- if y is not the first character, only then check the previous character
	ELSE IF SUBSTRING(@Word,@i,1) = N'y' AND @i > 1
	    BEGIN
            	--check to see if previous character is a consonent
		IF CHARINDEX(SUBSTRING(@Word,@i-1,1), N'aeiou') = 0
		     SELECT @Ret = @Ret + N'v'
		ELSE
		     SELECT @Ret = @Ret + N'c'
	    END
        Else
	    BEGIN
	     SELECT @Ret = @Ret + N'c'
	    END
	SELECT @i = @i + 1
    END
    RETURN @Ret
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterContainsVowel
	(
		@Word nvarchar(4000)
	)
RETURNS bit
AS
BEGIN

--checking word to see if vowels are present
DECLARE @pattern nvarchar(4000), @ret bit

SET @ret = 0

IF LEN(@Word) > 0
    BEGIN
    	--find out the CVC pattern
    	SELECT @pattern = dbo.fnPorterCVCpattern(@Word)
	--check to see if the return pattern contains a vowel
    	IF CHARINDEX( N'v',@pattern) > 0
	  SELECT @ret = 1
    END
RETURN @Ret
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterCountm
	(
		@Word nvarchar(4000)
	)
RETURNS tinyint
AS
BEGIN

--A \consonant\ in a word is a letter other than A, E, I, O or U, and other
--than Y preceded by a consonant. (The fact that the term `consonant' is
--defined to some extent in terms of itself does not make it ambiguous.) So in
--TOY the consonants are T and Y, and in SYZYGY they are S, Z and G. If a
--letter is not a consonant it is a \vowel\.

--declaring local variables
DECLARE @pattern nvarchar(4000), @ret tinyint, @i int, @flag bit

--initializing
SELECT @ret = 0, @flag = 0,  @i = 1

If Len(@Word) > 0
    BEGIN
	--find out the CVC pattern
	SELECT @pattern = dbo.fnPorterCVCpattern(@Word)
	--counting the number of m's...
	WHILE @i <= LEN(@pattern)
	    BEGIN
        	IF SUBSTRING(@pattern,@i,1) = N'v' OR @flag = 1
		    BEGIN
			SELECT @flag = 1
		        IF SUBSTRING(@pattern,@i,1) = N'c'
			    SELECT @ret = @ret + 1, @flag = 0
		    END
		SELECT @i = @i + 1
	    END
    END

    RETURN @Ret
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterEndsCVC
	(
		@Word nvarchar(4000)
	)
RETURNS bit
AS
BEGIN
--*o  - the stem ends cvc, where the second c is not W, X or Y (e.g. -WIL, -HOP).

--declaring local variables
DECLARE @pattern NVARCHAR(3), @ret bit


SELECT @ret = 0

--'check to see if atleast 3 characters are present
If LEN(@Word) >= 3
    BEGIN
	-- find out the CVC pattern
	-- we need to check only the last three characters
	SELECT @pattern = RIGHT(dbo.fnPorterCVCpattern(@Word),3)
	-- check to see if the letters in str match the sequence cvc
	IF @pattern = N'cvc' AND CHARINDEX(RIGHT(@Word,1), N'wxy') = 0
		SELECT @ret = 1
    END
RETURN @Ret
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterEndsDoubleCVC
	(
		@Word nvarchar(4000)
	)
RETURNS bit
AS
BEGIN

--*o  - the stem ends cvc, where the second c is not W, X or Y (e.g. -WIL, -HOP).

--declaring local variables
DECLARE @pattern NVARCHAR(3), @ret bit

SET @ret = 0

--check to see if atleast 3 characters are present
IF Len(@Word) >= 3 
    BEGIN    
  	-- find out the CVC pattern
    	-- we need to check only the last three characters
	SELECT @pattern = RIGHT(dbo.fnPorterCVCpattern(@Word),3)
	-- check to see if the letters in str match the sequence cvc
    	IF @pattern = N'cvc' AND 
	   CHARINDEX(RIGHT(@Word,1), N'wxy') = 0
		SELECT @ret = 1
    END
RETURN @Ret
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterEndsDoubleConsonant
	(
		@Word nvarchar(4000)
	)
RETURNS bit
AS
BEGIN

--checking whether word ends with a double consonant (e.g. -TT, -SS).

--declaring local variables
DECLARE @holds_ends NVARCHAR(2), @ret bit, @hold_third_last NCHAR(1)

SET @ret = 0
--first check whether the size of the word is >= 2
If Len(@Word) >= 2
    BEGIN
	-- extract 2 characters from right of str
	SELECT @holds_ends = Right(@Word, 2)
	-- checking if both the characters are same and not double vowel
    	IF SUBSTRING(@holds_ends,1,1) = SUBSTRING(@holds_ends,2,1) AND
	   CHARINDEX(@holds_ends, N'aaeeiioouu') = 0
	    BEGIN
            	--if the second last character is y, and there are atleast three letters in str
            	If @holds_ends = N'yy' AND Len(@Word) > 2 
		    BEGIN
			-- extracting the third last character
			SELECT @hold_third_last = LEFT(Right(@Word, 3),1)
                	IF CHARINDEX(@hold_third_last, N'aaeeiioouu') > 0
			    SET @ret = 1
		    END            
            	ELSE
		    SET @ret = 1
	    END            
    END            
            
RETURN @Ret
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterStep1
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN

    DECLARE @Ret nvarchar(4000)
    DECLARE @Phrase1 NVARCHAR(15), @Phrase2 NVARCHAR(15)
    DECLARE @CursorName CURSOR

    -- DO some initial cleanup
    SELECT @Ret = @InWord

/*STEP 1A

    SSES -> SS                         caresses  ->  caress
    IES  -> I                          ponies    ->  poni
                                       ties      ->  ti
    SS   -> SS                         caress    ->  caress
    S    ->                            cats      ->  cat
*/
    -- Create Cursor for Porter Step 1
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming WHERE Step = 1 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
		ORDER BY Ordering
    OPEN @CursorName

    -- Do Step 1
    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    --IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2
		    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END
    -- Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName

--STEP 1B
--
--   If
--       (m>0) EED -> EE                     feed      ->  feed
--                                           agreed    ->  agree
--   Else
--       (*v*) ED  ->                        plastered ->  plaster
--                                           bled      ->  bled
--       (*v*) ING ->                        motoring  ->  motor
--                                           sing      ->  sing
--
--If the second or third of the rules in Step 1b is successful, the following
--is done:
--
--    AT -> ATE                       conflat(ed)  ->  conflate
--    BL -> BLE                       troubl(ed)   ->  trouble
--    IZ -> IZE                       siz(ed)      ->  size
--    (*d and not (*L or *S or *Z))
--       -> single letter
--                                    hopp(ing)    ->  hop
--                                    tann(ed)     ->  tan
--                                    fall(ing)    ->  fall
--                                    hiss(ing)    ->  hiss
--                                    fizz(ed)     ->  fizz
--    (m=1 and *o) -> E               fail(ing)    ->  fail
--                                    fil(ing)     ->  file
--
--The rule to map to a single letter causes the removal of one of the double
--letter pair. The -E is put back on -AT, -BL and -IZ, so that the suffixes
---ATE, -BLE and -IZE can be recognised later. This E may be removed in step
--4.

--declaring local variables
DECLARE @m tinyint, @Temp nvarchar(4000),@second_third_success bit

--initializing 
SELECT @second_third_success = 0

--(m>0) EED -> EE..else..(*v*) ED  ->(*v*) ING  ->
    IF RIGHT(@Ret ,LEN(N'eed')) = N'eed'
	BEGIN
	    --counting the number of m--s
	    SELECT @temp = LEFT(@Ret, LEN(@Ret) - LEN(N'eed'))
	    SELECT @m = dbo.fnPorterCountm(@temp)

    	    If @m > 0
                SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(N'eed')) + N'ee' 
	END
    ELSE IF RIGHT(@Ret ,LEN(N'ed')) = N'ed'
	BEGIN
	    --trim and check for vowel
	    SELECT @temp = LEFT(@Ret, LEN(@Ret) - LEN(N'ed'))
	    If dbo.fnPorterContainsVowel(@temp) = 1
		SELECT @ret = LEFT(@Ret, LEN(@Ret) - LEN(N'ed')), @second_third_success = 1
	END
    ELSE IF RIGHT(@Ret ,LEN(N'ing')) = N'ing'
	BEGIN
	    --trim and check for vowel
	    SELECT @temp = LEFT(@Ret, LEN(@Ret) - LEN(N'ing'))
	    If dbo.fnPorterContainsVowel(@temp) = 1
		SELECT @ret = LEFT(@Ret, LEN(@Ret) - LEN(N'ing')), @second_third_success = 1
	END

--If the second or third of the rules in Step 1b is SUCCESSFUL, the following
--is done:
--
--    AT -> ATE                       conflat(ed)  ->  conflate
--    BL -> BLE                       troubl(ed)   ->  trouble
--    IZ -> IZE                       siz(ed)      ->  size
--    (*d and not (*L or *S or *Z))
--       -> single letter
--                                    hopp(ing)    ->  hop
--                                    tann(ed)     ->  tan
--                                    fall(ing)    ->  fall
--                                    hiss(ing)    ->  hiss
--                                    fizz(ed)     ->  fizz
--    (m=1 and *o) -> E               fail(ing)    ->  fail
--                                    fil(ing)     ->  file


IF @second_third_success = 1              --If the second or third of the rules in Step 1b is SUCCESSFUL
    BEGIN        
    	IF RIGHT(@Ret ,LEN(N'at')) = N'at'	--AT -> ATE
	    SELECT @ret = LEFT(@Ret, LEN(@Ret) - LEN(N'at')) + N'ate'
    	ELSE IF RIGHT(@Ret ,LEN(N'bl')) = N'bl'	--BL -> BLE
	    SELECT @ret = LEFT(@Ret, LEN(@Ret) - LEN(N'bl')) + N'ble'
    	ELSE IF RIGHT(@Ret ,LEN(N'iz')) = N'iz'	--IZ -> IZE
	    SELECT @ret = LEFT(@Ret, LEN(@Ret) - LEN(N'iz')) + N'ize'
    	ELSE IF dbo.fnPorterEndsDoubleConsonant(@Ret) = 1  /*(*d and not (*L or *S or *Z))-> single letter*/
	    BEGIN
		IF CHARINDEX(RIGHT(@Ret,1), N'lsz') = 0
		    SELECT @ret = LEFT(@Ret, LEN(@Ret) - 1)
            END
	ELSE IF dbo.fnPorterCountm(@Ret) = 1        /*(m=1 and *o) -> E */
	    BEGIN
	       	IF dbo.fnPorterEndsDoubleCVC(@Ret) = 1
                   SELECT @ret = @Ret + N'e'
            END
    END
    
----------------------------------------------------------------------------------------------------------
--
--STEP 1C
--
--    (*v*) Y -> I                    happy        ->  happi
--                                    sky          ->  sky
IF RIGHT(@Ret ,LEN(N'y')) = N'y'
    BEGIN        
        --trim and check for vowel
        SELECT @temp = LEFT(@Ret, LEN(@Ret)-1)
        IF dbo.fnPorterContainsVowel(@temp) = 1
	    SELECT @ret = LEFT(@Ret, LEN(@Ret) - 1) + N'i'
    END

    RETURN @Ret
 
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterStep2
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN

/*STEP 2

    (m>0) ATIONAL ->  ATE           relational     ->  relate
    (m>0) TIONAL  ->  TION          conditional    ->  condition
                                    rational       ->  rational
    (m>0) ENCI    ->  ENCE          valenci        ->  valence
    (m>0) ANCI    ->  ANCE          hesitanci      ->  hesitance
    (m>0) IZER    ->  IZE           digitizer      ->  digitize
Also,
    (m>0) BLI    ->   BLE           conformabli    ->  conformable

    (m>0) ALLI    ->  AL            radicalli      ->  radical
    (m>0) ENTLI   ->  ENT           differentli    ->  different
    (m>0) ELI     ->  E             vileli        - >  vile
    (m>0) OUSLI   ->  OUS           analogousli    ->  analogous
    (m>0) IZATION ->  IZE           vietnamization ->  vietnamize
    (m>0) ATION   ->  ATE           predication    ->  predicate
    (m>0) ATOR    ->  ATE           operator       ->  operate
    (m>0) ALISM   ->  AL            feudalism      ->  feudal
    (m>0) IVENESS ->  IVE           decisiveness   ->  decisive
    (m>0) FULNESS ->  FUL           hopefulness    ->  hopeful
    (m>0) OUSNESS ->  OUS           callousness    ->  callous
    (m>0) ALITI   ->  AL            formaliti      ->  formal
    (m>0) IVITI   ->  IVE           sensitiviti    ->  sensitive
    (m>0) BILITI  ->  BLE           sensibiliti    ->  sensible
Also,
    (m>0) LOGI    ->  LOG           apologi        -> apolog

The test for the string S1 can be made fast by doing a program switch on
the penultimate letter of the word being tested. This gives a fairly even
breakdown of the possible values of the string S1. It will be seen in fact
that the S1-strings in step 2 are presented here in the alphabetical order
of their penultimate letter. Similar techniques may be applied in the other
steps.
*/

--declaring local variables
    DECLARE @Ret nvarchar(4000), @Temp nvarchar(4000)
    DECLARE @Phrase1 NVARCHAR(15), @Phrase2 NVARCHAR(15)
    DECLARE @CursorName CURSOR --, @i int

--checking word
    SET @Ret = @InWord
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming WHERE Step = 2 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
		ORDER BY Ordering
    OPEN @CursorName

    -- Do Step 2
    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    --IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @temp = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1))
            	    IF dbo.fnPorterCountm(@temp) > 0
			SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2
            	    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END
    -- Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName


--retuning the word
    RETURN @Ret
 
END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterStep3
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN

/*STEP 3
    (m>0) ICATE ->  IC              triplicate     ->  triplic
    (m>0) ATIVE ->                  formative      ->  form
    (m>0) ALIZE ->  AL              formalize      ->  formal
    (m>0) ICITI ->  IC              electriciti    ->  electric
    (m>0) ICAL  ->  IC              electrical     ->  electric
    (m>0) FUL   ->                  hopeful        ->  hope
    (m>0) NESS  ->                  goodness       ->  good
*/

--declaring local variables
    DECLARE @Ret nvarchar(4000), @Temp nvarchar(4000)
    DECLARE @Phrase1 NVARCHAR(15), @Phrase2 NVARCHAR(15)
    DECLARE @CursorName CURSOR, @i int

--checking word
    SET @Ret = @InWord
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming WHERE Step = 3 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
		ORDER BY Ordering
    OPEN @CursorName

    -- Do Step 2
    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    --IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @temp = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1))
            	    IF dbo.fnPorterCountm(@temp) > 0
			SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2
            	    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END


    -- Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName

    --retuning the word
    RETURN @Ret
 
END





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterStep4
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN
--STEP 4
--
--    (m>1) AL    ->                  revival        ->  reviv
--    (m>1) ANCE  ->                  allowance      ->  allow
--    (m>1) ENCE  ->                  inference      ->  infer
--    (m>1) ER    ->                  airliner       ->  airlin
--    (m>1) IC    ->                  gyroscopic     ->  gyroscop
--    (m>1) ABLE  ->                  adjustable     ->  adjust
--    (m>1) IBLE  ->                  defensible     ->  defens
--    (m>1) ANT   ->                  irritant       ->  irrit
--    (m>1) EMENT ->                  replacement    ->  replac
--    (m>1) MENT  ->                  adjustment     ->  adjust
--    (m>1) ENT   ->                  dependent      ->  depend
--    (m>1 and (*S or *T)) ION ->     adoption       ->  adopt
--    (m>1) OU    ->                  homologou      ->  homolog
--    (m>1) ISM   ->                  communism      ->  commun
--    (m>1) ATE   ->                  activate       ->  activ
--    (m>1) ITI   ->                  angulariti     ->  angular
--    (m>1) OUS   ->                  homologous     ->  homolog
--    (m>1) IVE   ->                  effective      ->  effect
--    (m>1) IZE   ->                  bowdlerize     ->  bowdler
--
--The suffixes are now removed. All that remains is a little tidying up.

    DECLARE @Ret nvarchar(4000), @Temp nvarchar(4000)
    DECLARE @Phrase1 NVARCHAR(15)
    DECLARE @CursorName CURSOR

--checking word
    SELECT @Ret = @InWord
    SET @CursorName = CURSOR FOR 
	SELECT phrase1 FROM tblPorterStemming WHERE Step = 4 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
		ORDER BY Ordering
    OPEN @CursorName

    -- Do Step 4
    FETCH NEXT FROM @CursorName INTO @Phrase1
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    --IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @temp = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1))
            	    IF dbo.fnPorterCountm(@temp) > 1
			BEGIN
			    IF RIGHT(@Ret ,LEN(N'ion')) = N'ion'
				BEGIN
				    IF RIGHT(@temp ,1) = N's' OR RIGHT(@temp ,1) = N't'
					SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1))
				END
			    ELSE
				SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1))
			END
            	    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1
        END

    -- Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName

    --retuning the word
    RETURN @Ret
 
END




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE FUNCTION fnPorterStep5
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN
--STEP 5a
--
--    (m>1) E     ->                  probate        ->  probat
--                                    rate           ->  rate
--    (m=1 and not *o) E ->           cease          ->  ceas
--
--STEP 5b
--
--    (m>1 and *d and *L) -> single letter
--                                    controll       ->  control
--                                    roll           ->  roll

--declaring local variables
    DECLARE @Ret nvarchar(4000), @Temp nvarchar(4000), @m tinyint
    SET @Ret = @InWord

--Step5a
    IF RIGHT(@Ret , 1) = N'e'	            --word ends with e
	BEGIN
	    SELECT @temp = LEFT(@Ret, LEN(@Ret) - 1)
	    SELECT @m = dbo.fnPorterCountm(@temp)
	    IF @m > 1						--m>1
		SELECT @Ret = LEFT(@Ret, LEN(@Ret) - 1)
	    ELSE IF @m = 1					--m=1
		BEGIN
		    IF dbo.fnPorterEndsCVC(@temp) = 0		--not *o
			SELECT @Ret = LEFT(@Ret, LEN(@Ret) - 1)
		END
	END
----------------------------------------------------------------------------------------------------------
--
--Step5b
IF dbo.fnPorterCountm(@Ret) > 1
    BEGIN
	IF dbo.fnPorterEndsDoubleConsonant(@Ret) = 1 AND RIGHT(@Ret, 1) = N'l'
	    SELECT @Ret = LEFT(@Ret, LEN(@Ret) - 1)
    END
--retuning the word
RETURN @Ret
 
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

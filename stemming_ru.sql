drop table tblporterstemming_ru
CREATE TABLE [dbo].[tblPorterStemming_ru] (
	[Step] [int] NOT NULL ,
	[Ordering] [int] NOT NULL ,
	[phrase1] [nvarchar] (15) ,
	[phrase2] [nvarchar] (15)  
) ON [PRIMARY]
GO
delete from tblPorterStemming_ru 
-- INSERT THE DATA -
--PERFECTIVE GERUND:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,0,'ав','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,1,'€в','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,2,'авши','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,3,'€вши','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,4,'авшись','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,5,'€вшись','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,6,'ив','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,7,'ивши','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,8,'ившись','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,9,'ыв','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,10,'ывши','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,11,'ывшись','')

--REFLEXIVE:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,12,'с€','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,13,'сь','')

--ADJECTIVAL = PARTICIPLE + ADJECTIVE

--ADJECTIVE
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,14,'ее','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,15,'ие','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,16,'ые','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,17,'ое','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,18,'ими','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,19,'ыми','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,20,'ей','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,21,'ий','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,22,'ый','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,23,'ой','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,24,'ем','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,25,'им','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,26,'ым','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,27,'ом','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,28,'его','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,29,'ого','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,30,'ему','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,31,'ому','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,32,'их','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,33,'ых','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,34,'ую','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,35,'юю','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,36,'а€','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,37,'€€','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,38,'ою','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,39,'ею','')

--PARTICIPLE
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,40,'ивш','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,41,'ывш','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,42,'ующ','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,43,'аем','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,44,'анн','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,45,'авш','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,46,'ающ','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,47,'ащ','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,48,'€ем','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,49,'€нн','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,50,'€вш','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,51,'€ющ','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,52,'€щ','€')

--VERB:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,53,'ила','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,54,'ыла','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,55,'ена','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,56,'ейте','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,57,'уйте','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,58,'ите','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,59,'или','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,60,'ыли','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,62,'ей','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,63,'уй','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,64,'ил','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,65,'ыл','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,66,'им','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,67,'ым','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,68,'ен','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,69,'ило','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,70,'ыло','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,71,'ено','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,72,'€т','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,73,'ует','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,74,'уют','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,75,'ит','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,76,'ыт','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,77,'ены','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,78,'ить','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,79,'ыть','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,80,'ишь','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,81,'ую','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,82,'ю','')

INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,83,'ала','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,84,'ана','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,85,'аете','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,86,'айте','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,87,'али','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,88,'ай','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,89,'ал','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,90,'аем','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,91,'ан','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,92,'ало','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,93,'ано','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,94,'ает','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,95,'ают','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,96,'аны','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,97,'ать','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,98,'аешь','а')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,99,'анно','а')

INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,100,'€ла','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,101,'€на','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,102,'€ете','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,103,'€йте','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,104,'€ли','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,105,'€й','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,106,'€л','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,107,'€ем','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,108,'€н','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,109,'€ло','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,110,'€но','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,111,'€ет','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,112,'€ют','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,113,'€ны','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,114,'€ть','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,115,'€ешь','€')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,116,'€нно','€')

--NOUN:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,117,'а','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,118,'ев','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,119,'ов','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,120,'ие','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,121,'ье','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,122,'е','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,123,'и€ми','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,124,'€ми','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,125,'ами','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,126,'еи','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,127,'ии','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,128,'и','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,129,'ией','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,130,'ей','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,130,'ой','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,132,'ий','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,133,'й','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,134,'и€м','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,135,'€м','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,136,'ием','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,137,'ем','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,138,'ам','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,139,'ом','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,140,'о','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,141,'у','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,142,'ах','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,143,'и€х','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,144,'€х','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,145,'ы','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,146,'ь','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,147,'ию','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,148,'ью','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,149,'ю','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,150,'и€','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,151,'ь€','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,152,'€','')



--STEP 2
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,0,'и','')

--STEP 3
--DERIVATIONAL
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,0,'ост','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,1,'ость','')


--STEP 4
--SUPERLATIVE
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,0,'ейшеств','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,1,'ельств','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,2,'ейш','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,3,'ейше','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,4,'нн','н')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,5,'ь','')
GO


Alter FUNCTION fnPorterAlgorithm_ru
	(
		@InWord nvarchar(4000)
	)
	RETURNS nvarchar(4000)
AS
BEGIN
    DECLARE @Ret nvarchar(4000), @Temp nvarchar(4000)

    -- DO some initial cleanup
    SELECT @Ret = LOWER(ISNULL(RTRIM(LTRIM(@InWord)),N''))

    -- only strings greater than 3 are stemmed
    IF LEN(@Ret) > 3
	BEGIN
	    SELECT @Ret = dbo.fnPorterStep1_ru(@Ret)
	    SELECT @Ret = dbo.fnPorterStep2_ru(@Ret)
		SELECT @Ret = dbo.fnPorterStep3_ru(@Ret)
	    SELECT @Ret = dbo.fnPorterStep4_ru(@Ret)
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

------------------------------------------ STEP 1
Alter FUNCTION fnPorterStep1_ru
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN

    DECLARE @Ret nvarchar(4000)
    DECLARE @Phrase1 NVARCHAR(15), @Phrase2 NVARCHAR(15)
    DECLARE @CursorName CURSOR

    SELECT @Ret = @InWord
    
    
         -- Do Step 1a
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 1 and ordering <=11 
		ORDER BY Ordering
    OPEN @cursorname

    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 
		    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END
        
    -- Do Step 1
    
    --REFLEXIVE
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 1 and ordering >=12 And ordering <=13 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
		ORDER BY Ordering
    OPEN @cursorname
    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 --”брали Reflexive, провер€ем ADJECTIVAL VERB NOUN
		END
		FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
	END		

	--ADJECTIVAL:	
		--ADJECTIVE:
		SET @CursorName = CURSOR FOR 
		SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 1 and ordering >=14 And ordering <=39 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
			ORDER BY Ordering
		OPEN @cursorname
		FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
		WHILE @@FETCH_STATUS = 0 
		BEGIN
			IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
			BEGIN
				SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 --”брали Reflexive, провер€ем ADJECTIVAL VERB NOUN
			END
			FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
		END		
		--PARTICIPLE:
		SET @CursorName = CURSOR FOR 
		SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 1 and ordering >=40 And ordering <=52 AND RIGHT(@Ret ,LEN(Phrase1)) = Phrase1
			ORDER BY Ordering
		OPEN @cursorname
		FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
		WHILE @@FETCH_STATUS = 0 
		BEGIN
			IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
			BEGIN
				SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 --”брали Reflexive, провер€ем ADJECTIVAL VERB NOUN
			END
			FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
		END				
	
	
	
	
	--VERB				
	SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 1 and ordering >=53 and ordering <= 116
		ORDER BY Ordering
	OPEN @cursorname

	FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
			SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 
			BREAK
		END
		FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
		END
		
   --NOUN				
	SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 1 and ordering >=117 and ordering <= 152
		ORDER BY Ordering
	OPEN @cursorname

	FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
			SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 
			BREAK
		END
		FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
		END     
		    
		    
	
        
    --Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName
    return @ret
    end
    
    
    
    
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

------------------------------------------ STEP 2
Alter FUNCTION fnPorterStep2_ru
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN
 DECLARE @Ret nvarchar(4000)
 ,@CursorName as cursor
 ,@phrase1 as nvarchar (15)
 ,@phrase2 as nvarchar (15)

 Set @ret = @inword
 
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 2 and ordering =0 
		ORDER BY Ordering
    OPEN @cursorname
    

    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 
		    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END

    --Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName
    return @ret

end
GO

------------------------------------------ STEP 3: -ост, -ость

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


Alter FUNCTION fnPorterStep3_ru
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN
 DECLARE @Ret nvarchar(4000)
 ,@CursorName as cursor
 ,@phrase1 as nvarchar (15)
 ,@phrase2 as nvarchar (15)
 ,@RV as nvarchar (4000)
 ,@R1 as nvarchar (4000)
 ,@R2 as nvarchar (4000)
 
 
 Set @ret = @InWord
 
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 3 and ordering >= 0 
		ORDER BY Ordering
    OPEN @cursorname
    

    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
		    IF LEN(LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2) > 4 
		    begin
				SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 
		    end
		    BREAK
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END

 
    --Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName
    
    return @ret
END
GO


------------------------------------------ STEP 4

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


Alter FUNCTION fnPorterStep4_ru
	(
		@InWord nvarchar(4000)
	)
RETURNS nvarchar(4000)
AS
BEGIN
 DECLARE @Ret nvarchar(4000)
 ,@CursorName as cursor
 ,@phrase1 as nvarchar (15)
 ,@phrase2 as nvarchar (15)
 ,@RV as nvarchar (4000)
 ,@R1 as nvarchar (4000)
 ,@R2 as nvarchar (4000)
 
 
 Set @ret = @InWord
 
    SET @CursorName = CURSOR FOR 
	SELECT phrase1, phrase2 FROM tblPorterStemming_ru WHERE Step = 4 and ordering >= 0 
		ORDER BY Ordering
    OPEN @cursorname
    
--
    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
    WHILE @@FETCH_STATUS = 0 
	BEGIN
	    IF RIGHT(@Ret ,LEN(@Phrase1)) = @Phrase1
		BEGIN
			SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 
		END
	    FETCH NEXT FROM @CursorName INTO @Phrase1, @Phrase2
        END

     --Free Resources
    CLOSE @CursorName
    DEALLOCATE @CursorName
    
    return @ret
 END
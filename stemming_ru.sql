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
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,0,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,1,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,2,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,3,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,4,'������','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,5,'������','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,6,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,7,'����','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,8,'������','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,9,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,10,'����','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,11,'������','')

--REFLEXIVE:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,12,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,13,'��','')

--ADJECTIVAL = PARTICIPLE + ADJECTIVE

--ADJECTIVE
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,14,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,15,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,16,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,17,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,18,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,19,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,20,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,21,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,22,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,23,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,24,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,25,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,26,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,27,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,28,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,29,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,30,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,31,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,32,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,33,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,34,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,35,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,36,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,37,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,38,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,39,'��','')

--PARTICIPLE
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,40,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,41,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,42,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,43,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,44,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,45,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,46,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,47,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,48,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,49,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,50,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,51,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,52,'��','�')

--VERB:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,53,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,54,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,55,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,56,'����','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,57,'����','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,58,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,59,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,60,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,62,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,63,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,64,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,65,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,66,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,67,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,68,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,69,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,70,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,71,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,72,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,73,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,74,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,75,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,76,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,77,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,78,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,79,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,80,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,81,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,82,'�','')

INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,83,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,84,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,85,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,86,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,87,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,88,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,89,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,90,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,91,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,92,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,93,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,94,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,95,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,96,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,97,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,98,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,99,'����','�')

INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,100,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,101,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,102,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,103,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,104,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,105,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,106,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,107,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,108,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,109,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,110,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,111,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,112,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,113,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,114,'���','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,115,'����','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,116,'����','�')

--NOUN:
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,117,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,118,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,119,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,120,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,121,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,122,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,123,'����','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,124,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,125,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,126,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,127,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,128,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,129,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,130,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,130,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,132,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,133,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,134,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,135,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,136,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,137,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,138,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,139,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,140,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,141,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,142,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,143,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,144,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,145,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,146,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,147,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,148,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,149,'�','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,150,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,151,'��','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(1,152,'�','')



--STEP 2
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(2,0,'�','')

--STEP 3
--DERIVATIONAL
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,0,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(3,1,'����','')


--STEP 4
--SUPERLATIVE
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,0,'�������','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,1,'������','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,2,'���','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,3,'����','')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,4,'��','�')
INSERT INTO [tblPorterStemming_ru]([Step], [Ordering], [phrase1], [phrase2]) VALUES(4,5,'�','')
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
		    SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 --������ Reflexive, ��������� ADJECTIVAL VERB NOUN
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
				SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 --������ Reflexive, ��������� ADJECTIVAL VERB NOUN
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
				SELECT @Ret = LEFT(@Ret, LEN(@Ret) - LEN(@Phrase1)) + @Phrase2 --������ Reflexive, ��������� ADJECTIVAL VERB NOUN
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

------------------------------------------ STEP 3: -���, -����

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
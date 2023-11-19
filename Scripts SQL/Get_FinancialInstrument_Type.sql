CREATE PROCEDURE [dbo].[Get_FinancialInstrument_Type]

AS
	declare @MarketValue decimal
	DECLARE @FINANCIAL_TYPE table (Id INT, Name VARCHAR(20))


	SELECT FinancialInstrumentID,MarketValue
	INTO #TEMP_FINANCIAL
	FROM FinancialInstrument
	
	WHILE (exists (select top 1 * from #TEMP_FINANCIAL))
	begin
		SET @MarketValue = (SELECT TOP 1 MarketValue FROM #TEMP_FINANCIAL)

		IF (@MarketValue < 1000000)
		BEGIN 
			INSERT INTO @FINANCIAL_TYPE (Name)
			SELECT Name 
			FROM FinancialInstrumentType
			WHERE FinancialInstrumentTypeID =1;
		END

		ELSE IF (@MarketValue >=1000000 AND @MarketValue>=1000000)
		BEGIN 
			INSERT INTO @FINANCIAL_TYPE (Name)
			SELECT Name 
			FROM FinancialInstrumentType
			WHERE FinancialInstrumentTypeID =2;
		END

		ELSE 
		BEGIN 
			INSERT INTO @FINANCIAL_TYPE (Name)
			SELECT Name 
			FROM FinancialInstrumentType
			WHERE FinancialInstrumentTypeID =3;
		END

	    DELETE FROM #TEMP_FINANCIAL WHERE MarketValue = @MarketValue
	end

	select * from  @FINANCIAL_TYPE

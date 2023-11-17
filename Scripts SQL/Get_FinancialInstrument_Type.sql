CREATE PROCEDURE [dbo].[Get_FinancialInstrument_Type]

AS
	declare @MarketValue decimal

	DROP TABLE #TEMP_FINANCIAL_TYPE
	DROP TABLE #TEMP_FINANCIAL

	CREATE TABLE #TEMP_FINANCIAL_TYPE
	(
		Name VARCHAR(20)
	);

	SELECT FinancialInstrumentID,MarketValue
	INTO #TEMP_FINANCIAL
	FROM FinancialInstrument
	
	WHILE (exists (select top 1 * from #TEMP_FINANCIAL))
	begin
		SET @MarketValue = (SELECT TOP 1 MarketValue FROM #TEMP_FINANCIAL)

		IF (@MarketValue < 1000000)
		BEGIN 
			SELECT Name 
			INTO #TEMP_FINANCIAL_TYPE 
			FROM FinancialInstrumentType
			WHERE Id =1;
		END

		ELSE IF (@MarketValue >=1000000 AND @MarketValue>=1000000)
		BEGIN 
			INSERT INTO #TEMP_FINANCIAL_TYPE (Name) VALUES ('MEDIUM VALUE');

		END

		ELSE 
		BEGIN 
			INSERT INTO #TEMP_FINANCIAL_TYPE (Name) VALUES ('HIGH VALUE');
		END

	    DELETE FROM #TEMP_FINANCIAL WHERE MarketValue = @MarketValue
	end

	select * from  @FI

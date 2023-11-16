CREATE PROCEDURE [dbo].[Get_FinancialInstrument_Type]

AS
	declare @MarketValue decimal

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
			INSERT INTO #TEMP_FINANCIAL_TYPE (Name) VALUES ('LOW VALUE');
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

	select * from  #TEMP_FINANCIAL_TYPE

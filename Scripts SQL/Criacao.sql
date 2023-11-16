CREATE TABLE FinancialInstrumentType (
  FinancialInstrumentTypeID int IDENTITY(1,1) NOT NULL,
  Name varchar(255) NOT NULL,
  CONSTRAINT PK_TipoMarketValue PRIMARY KEY (TipoMarketValueID)
);

CREATE TABLE FinancialInstrument (
  FinancialInstrumentID int IDENTITY(1,1) NOT NULL,
  MarketValue decimal(18,2) NOT NULL,
  Type varchar(20),
  TipoMarketValueID int NOT NULL,
  CONSTRAINT PK_MarketValue PRIMARY KEY (MarketValueID),
  CONSTRAINT FK_MarketValue_TipoMarketValue FOREIGN KEY (TipoMarketValueID) REFERENCES TipoMarketValue (TipoMarketValueID)
);

Insert into FinancialInstrument(MarketValue, Type)
VALUES (800000,'stock'),
(1500000, 'bond'),
(6000000, 'derivative'),
(300000,'stock');

INSERT INTO FinancialInstrumentType(Name)
VALUES ('LOW VALUW'),('MEDIUM VALUE'),('HIGH VALUE')





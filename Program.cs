// See https://aka.ms/new-console-template for more information
using Teste;
using Teste.Factories;
using Teste.Interfaces;

var inputs = new List<InputDto>{
    new InputDto(800000, "Stock"),
    new InputDto(1500000,"Bond"),
    new InputDto(6000000,"Derivative"),
    new InputDto(300000, "Stock")
};

var financialInstruments = new List<IFinancialInstrument>();

foreach (var input in inputs)
{
    financialInstruments.Add(FinancialInstrumentFactory.Create(input));
}

foreach (var financialInstrument in financialInstruments)
{
    System.Console.WriteLine(financialInstrument.Type);   
}
using System.Text.Json;
using Teste;
using Teste.Factories;
using Teste.Interfaces;
using Teste.Models;

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

var output = new OutputDto();
output.InstrumentCategories = financialInstruments.Select(i=>i.Type).ToList();

Console.WriteLine(JsonSerializer.Serialize(output));
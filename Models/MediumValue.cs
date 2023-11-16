using Teste.Interfaces;

namespace Teste.Models;

public class MediumValue : IFinancialInstrument
{
    public double MarketValue {get; set;}

    public string Type {get;} = "Medium Value";
}

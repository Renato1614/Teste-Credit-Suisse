using Teste.Interfaces;

namespace Teste.Models;

public class HighValue : IFinancialInstrument
{
    public double MarketValue {get; set;}
    public string Type {get;} ="High Value";
}

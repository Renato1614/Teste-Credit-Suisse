using Teste.Interfaces;

namespace Teste.Models;

public class LowValue : IFinancialInstrument
{
    public double MarketValue {get; set;}
    public string Type {get;} ="Low Value";
}

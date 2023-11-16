using Teste.Interfaces;
using Teste.Models;

namespace Teste.Factories;

public static class FinancialInstrumentFactory
{
    public static IFinancialInstrument Create(InputDto inputDto)
    {
        if (inputDto.MarketValue < 1000000)
        {
            return new LowValue();
        }
        else if (inputDto.MarketValue >= 1000000 && inputDto.MarketValue <= 500000)
        {
            return new MediumValue();
        }
        else
        {
            return new HighValue();
        }
    }
}

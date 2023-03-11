using Microsoft.AspNetCore.Mvc;

namespace MyFirstAPI1.Controllers;

[ApiController]
[Route("weather")]
public class WeatherForecastController : ControllerBase
{
    private static readonly string[] Summaries = new[]
    {
        "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
    };

    private readonly ILogger<WeatherForecastController> _logger;

    public WeatherForecastController(ILogger<WeatherForecastController> logger)
    {
        _logger = logger;
    }

    [HttpGet(Name = "GetWeatherForecast")]
    public IEnumerable<WeatherForecast> Get()
    {
        return Enumerable.Range(1, 5).Select(index => new WeatherForecast
        {
            Date = DateTime.Now.AddDays(index),
            TemperatureC = Random.Shared.Next(-20, 55),
            Summary = Summaries[Random.Shared.Next(Summaries.Length)]
        })
        .ToArray();
    }

    /*
    [HttpGet("{city}")]
    public WeatherForecast Get(string city)
    {
        if (!string.Equals(city?.TrimEnd(), "Vizag", StringComparison.OrdinalIgnoreCase))
        {
            throw new ArgumentException(
                $"We don't offer a weather forecast for {city}.", nameof(city));
        }

        //return GetWeather().First();
        return Get().First();
    }
    */
}

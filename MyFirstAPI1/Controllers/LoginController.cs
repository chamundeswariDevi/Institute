using Microsoft.AspNetCore.Mvc;
using MyFirstAPI1.Models;

namespace MyFirstAPI1.Controllers;

[ApiController]
[Route("login")]
public class LoginController : ControllerBase
{
    static string securityKey = "";
    private readonly ILogger<WeatherForecastController> _logger;

    public LoginController(ILogger<WeatherForecastController> logger)
    {
        _logger = logger;
    }

    public static string? SecurityKey { get; internal set; }

    [Route("")]
    [Route("index")]
    public IActionResult Index()
    {
        return BadRequest();
    }

    [HttpPost]
    [Route("process")]
    public IActionResult Process([FromForm] User user)
    {
        if (user.Username != null && user.Password != null)
        {
            if (user.Username.Equals("admin") && user.Password.Equals("nkxgen"))
            {
                SecurityKey = "XYZABC";
                Response.WriteAsync(SecurityKey);
                return Ok();
            }
            else
            {
                return BadRequest();
            }

        }
        else
        {
            return BadRequest();
        }
    }
}


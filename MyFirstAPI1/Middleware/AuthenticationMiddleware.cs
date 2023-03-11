using Microsoft.AspNetCore.Http;
using MyFirstAPI1.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace MyFirstAPI1.Middleware
{
    public class AuthenticationMiddleware
    {
        private readonly RequestDelegate _next;

        public AuthenticationMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext httpContext)
        {
            var path = httpContext.Request.Path;
          
            if (path.HasValue && path.Value.StartsWith("/weather"))
            {
                if (httpContext.Request.Headers["SecurityKey"].ToString()  == "")
                {
                    throw new Exception("Blank Security Key");
                    Console.WriteLine("No Access");
                }
                else
                {
                    Console.WriteLine(httpContext.Request.Headers["SecurityKey"].ToString());
                    if (!httpContext.Request.Headers["SecurityKey"].ToString().Equals(LoginController.SecurityKey))
                    {
                        Console.WriteLine(httpContext.Request.Headers["SecurityKey"].ToString());
                        throw new Exception("No Access");
                    }
                }
            }
        
            await _next(httpContext);
        }
    }

    // Extension method used to add the middleware to the HTTP request pipeline.
    public static class AuthenticationMiddlewareExtensions
    {
        public static IApplicationBuilder UseAuthenticationMiddleware(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<AuthenticationMiddleware>();
        }
    }
}

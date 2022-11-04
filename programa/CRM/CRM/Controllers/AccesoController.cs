using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using System.Web.Mvc;


using CRM.Models;
//using System.Web.security;
using CRM.Models;
using CRM.Logica;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.Security.Claims;

namespace CRM.Controllers
{
    
    public class AccesoController : Controller
    {

        // GET: Acceso
        public ActionResult Index()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> IndexAsync(string cedula, string clave)
        {
            Usuario objeto = new LO_Usuario().EncontrarUsuario(cedula, clave);

            if (objeto.Nombre != null)
            {

                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, objeto.Cedula),
                    new Claim("username", objeto.Clave),
                    new Claim(ClaimTypes.Role, objeto.IdDepartamento.ToString())
                    //new Claim(ClaimTypes.Role, objeto.Rol.ToString())

                };

                //var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                //await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));



                return RedirectToAction("Index", "Home");


            }

            return View();

        }


        public async Task<IActionResult> Salir()
        {

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);


            return RedirectToAction("Index");

        }

    }
}
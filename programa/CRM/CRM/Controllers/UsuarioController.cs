using Microsoft.AspNetCore.Mvc;

namespace CRM.Controllers
{
    public class UsuarioController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IConfiguration Configuration { get; }

        public UsuarioController(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        //[HttpPost]
        //public IActionResult IniciarSesion(UsuarioModel usario)
        //{

        //}
    }
}

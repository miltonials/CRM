using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CRM.Controllers
{
    public class ValorPresenteCotizacionesController : Controller
    {
        private readonly CRMContext _context;

        public ValorPresenteCotizacionesController(CRMContext context)
        {
            _context = context;
        }

        // GET: ValorPresenteCotizaciones
        public async Task<IActionResult> Index()
        {
            var cRMContext = _context.ValorPresenteCotizaciones.Include(v => v.NumeroCotizacionNavigation);
            return View(await cRMContext.ToListAsync());
        }
        
        /// <summary>
        /// Metodo que permite calcular el valor presente de todas las cotizaciones de la base de datos.
        /// </summary>
        /// <returns>La vista index</returns>
        [HttpGet]
        public IActionResult calcularInflacion()
        {
            var cRMContext = _context.ValorPresenteCotizaciones.FromSqlRaw("procCalcularValorPresenteCotizaciones").ToList();
            return View("Index", cRMContext);
        }

        /// <summary>
        /// Método que permite borrar todos los registros actuales de la tabla ValorPresenteCotizacion
        /// </summary>
        /// <returns>La vista index</returns>
        [HttpGet]
        public IActionResult borrarRegistros()
        {
            var cRMContext = _context.ValorPresenteCotizaciones.FromSqlRaw("procBorrarValorPresenteCotizaciones").ToList();
            return View("Index", cRMContext);
        }
    }
}

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

        // GET: ValorPresenteCotizaciones/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.ValorPresenteCotizaciones == null)
            {
                return NotFound();
            }

            var valorPresenteCotizacione = await _context.ValorPresenteCotizaciones
                .Include(v => v.NumeroCotizacionNavigation)
                .FirstOrDefaultAsync(m => m.NumeroCotizacion == id);
            if (valorPresenteCotizacione == null)
            {
                return NotFound();
            }

            return View(valorPresenteCotizacione);
        }

        [HttpGet]
        public IActionResult calcularInflacion()
        {
            var cRMContext = _context.ValorPresenteCotizaciones.FromSqlRaw("procCalcularValorPresenteCotizaciones").ToList();
            return View("Index", cRMContext);
        }

        [HttpGet]
        public IActionResult borrarRegistros()
        {
            var cRMContext = _context.ValorPresenteCotizaciones.FromSqlRaw("procBorrarValorPresenteCotizaciones").ToList();
            return View("Index", cRMContext);
        }
    }
}

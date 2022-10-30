using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;

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

        // GET: ValorPresenteCotizaciones/Create
        public IActionResult Create()
        {
            ViewData["NumeroCotizacion"] = new SelectList(_context.Cotizacions, "NumeroCotizacion", "NombreCuenta");
            return View();
        }

        // POST: ValorPresenteCotizaciones/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("NumeroCotizacion,NumeroContacto,NombreOportunidad,FechaCotizacion,NombreCuenta,TotalCotizacion,TotalAValorPresente")] ValorPresenteCotizacione valorPresenteCotizacione)
        {
            if (ModelState.IsValid)
            {
                _context.Add(valorPresenteCotizacione);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["NumeroCotizacion"] = new SelectList(_context.Cotizacions, "NumeroCotizacion", "NombreCuenta", valorPresenteCotizacione.NumeroCotizacion);
            return View(valorPresenteCotizacione);
        }

        // GET: ValorPresenteCotizaciones/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.ValorPresenteCotizaciones == null)
            {
                return NotFound();
            }

            var valorPresenteCotizacione = await _context.ValorPresenteCotizaciones.FindAsync(id);
            if (valorPresenteCotizacione == null)
            {
                return NotFound();
            }
            ViewData["NumeroCotizacion"] = new SelectList(_context.Cotizacions, "NumeroCotizacion", "NombreCuenta", valorPresenteCotizacione.NumeroCotizacion);
            return View(valorPresenteCotizacione);
        }

        // POST: ValorPresenteCotizaciones/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("NumeroCotizacion,NumeroContacto,NombreOportunidad,FechaCotizacion,NombreCuenta,TotalCotizacion,TotalAValorPresente")] ValorPresenteCotizacione valorPresenteCotizacione)
        {
            if (id != valorPresenteCotizacione.NumeroCotizacion)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(valorPresenteCotizacione);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ValorPresenteCotizacioneExists(valorPresenteCotizacione.NumeroCotizacion))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["NumeroCotizacion"] = new SelectList(_context.Cotizacions, "NumeroCotizacion", "NombreCuenta", valorPresenteCotizacione.NumeroCotizacion);
            return View(valorPresenteCotizacione);
        }

        // GET: ValorPresenteCotizaciones/Delete/5
        public async Task<IActionResult> Delete(int? id)
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

        // POST: ValorPresenteCotizaciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.ValorPresenteCotizaciones == null)
            {
                return Problem("Entity set 'CRMContext.ValorPresenteCotizaciones'  is null.");
            }
            var valorPresenteCotizacione = await _context.ValorPresenteCotizaciones.FindAsync(id);
            if (valorPresenteCotizacione != null)
            {
                _context.ValorPresenteCotizaciones.Remove(valorPresenteCotizacione);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ValorPresenteCotizacioneExists(int id)
        {
          return _context.ValorPresenteCotizaciones.Any(e => e.NumeroCotizacion == id);
        }
    }
}

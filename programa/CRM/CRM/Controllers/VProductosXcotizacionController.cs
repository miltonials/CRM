using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;
using Microsoft.Data.SqlClient;

namespace CRM.Controllers
{
    public class VProductosXcotizacionController : Controller
    {
        private readonly CRMContext _context;

        public VProductosXcotizacionController(CRMContext context)
        {
            _context = context;
        }

        // GET: VProductosXcotizacion
        public async Task<IActionResult> Index()
        {
              return View(await _context.VProductosXcotizacions.ToListAsync());
        }

        // GET: VProductosXcotizacion/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.VProductosXcotizacions == null)
            {
                return NotFound();
            }

            var vProductosXcotizacion = await _context.VProductosXcotizacions
                .FirstOrDefaultAsync(m => m.NumeroCotizacion == id);
            if (vProductosXcotizacion == null)
            {
                return NotFound();
            }

            return View(vProductosXcotizacion);
        }

        // GET: VProductosXcotizacion/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: VProductosXcotizacion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("NumeroCotizacion,Codigo,Familia,Nombre,PrecioEstandar,Estado,Descripcion,Cantidad")] VProductosXcotizacion vProductosXcotizacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(vProductosXcotizacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(vProductosXcotizacion);
        }

        // GET: VProductosXcotizacion/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.VProductosXcotizacions == null)
            {
                return NotFound();
            }

            var vProductosXcotizacion = await _context.VProductosXcotizacions.FindAsync(id);
            if (vProductosXcotizacion == null)
            {
                return NotFound();
            }
            return View(vProductosXcotizacion);
        }

        // POST: VProductosXcotizacion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("NumeroCotizacion,Codigo,Familia,Nombre,PrecioEstandar,Estado,Descripcion,Cantidad")] VProductosXcotizacion vProductosXcotizacion)
        {
            if (id != vProductosXcotizacion.NumeroCotizacion)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(vProductosXcotizacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VProductosXcotizacionExists(vProductosXcotizacion.NumeroCotizacion))
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
            return View(vProductosXcotizacion);
        }

        // GET: VProductosXcotizacion/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.VProductosXcotizacions == null)
            {
                return NotFound();
            }

            var vProductosXcotizacion = await _context.VProductosXcotizacions
                .FirstOrDefaultAsync(m => m.NumeroCotizacion == id);
            if (vProductosXcotizacion == null)
            {
                return NotFound();
            }

            return View(vProductosXcotizacion);
        }

        // POST: VProductosXcotizacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.VProductosXcotizacions == null)
            {
                return Problem("Entity set 'CRMContext.VProductosXcotizacions'  is null.");
            }
            var vProductosXcotizacion = await _context.VProductosXcotizacions.FindAsync(id);
            if (vProductosXcotizacion != null)
            {
                _context.VProductosXcotizacions.Remove(vProductosXcotizacion);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VProductosXcotizacionExists(int id)
        {
          return _context.VProductosXcotizacions.Any(e => e.NumeroCotizacion == id);
        }


        [HttpGet("VProductosXcotizacion/Filtrar/{cotizacion}")]
        public IActionResult Filtrar(int cotizacion)
        {
            var pCotizacion = new SqlParameter("numero_cotizacion", cotizacion);
            var ret = new SqlParameter("ret", 2);
            var res = _context
            .VProductosXcotizacions
            .FromSqlInterpolated($"procObtenerProductoPorCotizacion @numero_cotizacion = {pCotizacion}, @ret = {ret}").ToList();

            return View("Index", res);
        }
    }
}

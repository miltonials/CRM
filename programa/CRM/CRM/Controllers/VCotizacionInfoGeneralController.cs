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
    public class VCotizacionInfoGeneralController : Controller
    {
        private readonly CRMContext _context;

        public VCotizacionInfoGeneralController(CRMContext context)
        {
            _context = context;
        }

        // GET: VCotizacionInfoGeneral
        public async Task<IActionResult> Index()
        {
              return View(await _context.VCotizacionInfoGenerals.ToListAsync());
        }

        // GET: VCotizacionInfoGeneral/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.VCotizacionInfoGenerals == null)
            {
                return NotFound();
            }

            var vCotizacionInfoGeneral = await _context.VCotizacionInfoGenerals
                .FirstOrDefaultAsync(m => m.IdFactura == id);
            if (vCotizacionInfoGeneral == null)
            {
                return NotFound();
            }

            return View(vCotizacionInfoGeneral);
        }

        // GET: VCotizacionInfoGeneral/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: VCotizacionInfoGeneral/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,NombreCuenta,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,Zona,Sector,Nombre,Etapa,Asesor,Probabilidad,Motivo,Competidor")] VCotizacionInfoGeneral vCotizacionInfoGeneral)
        {
            if (ModelState.IsValid)
            {
                _context.Add(vCotizacionInfoGeneral);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(vCotizacionInfoGeneral);
        }

        // GET: VCotizacionInfoGeneral/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.VCotizacionInfoGenerals == null)
            {
                return NotFound();
            }

            var vCotizacionInfoGeneral = await _context.VCotizacionInfoGenerals.FindAsync(id);
            if (vCotizacionInfoGeneral == null)
            {
                return NotFound();
            }
            return View(vCotizacionInfoGeneral);
        }

        // POST: VCotizacionInfoGeneral/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int? id, [Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,NombreCuenta,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,Zona,Sector,Nombre,Etapa,Asesor,Probabilidad,Motivo,Competidor")] VCotizacionInfoGeneral vCotizacionInfoGeneral)
        {
            if (id != vCotizacionInfoGeneral.IdFactura)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(vCotizacionInfoGeneral);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VCotizacionInfoGeneralExists(vCotizacionInfoGeneral.IdFactura))
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
            return View(vCotizacionInfoGeneral);
        }

        // GET: VCotizacionInfoGeneral/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.VCotizacionInfoGenerals == null)
            {
                return NotFound();
            }

            var vCotizacionInfoGeneral = await _context.VCotizacionInfoGenerals
                .FirstOrDefaultAsync(m => m.IdFactura == id);
            if (vCotizacionInfoGeneral == null)
            {
                return NotFound();
            }

            return View(vCotizacionInfoGeneral);
        }

        // POST: VCotizacionInfoGeneral/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int? id)
        {
            if (_context.VCotizacionInfoGenerals == null)
            {
                return Problem("Entity set 'CRMContext.VCotizacionInfoGenerals'  is null.");
            }
            var vCotizacionInfoGeneral = await _context.VCotizacionInfoGenerals.FindAsync(id);
            if (vCotizacionInfoGeneral != null)
            {
                _context.VCotizacionInfoGenerals.Remove(vCotizacionInfoGeneral);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VCotizacionInfoGeneralExists(int? id)
        {
          return _context.VCotizacionInfoGenerals.Any(e => e.IdFactura == id);
        }
    }
}

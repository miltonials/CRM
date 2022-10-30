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
    public class CotizacionController : Controller
    {
        private readonly CRMContext _context;

        public CotizacionController(CRMContext context)
        {
            _context = context;
        }

        // GET: Cotizacion
        public async Task<IActionResult> Index()
        {
            var cRMContext = _context.Cotizacions.Include(c => c.IdAsesorNavigation).Include(c => c.IdCompetidorNavigation).Include(c => c.IdContactoNavigation).Include(c => c.IdEtapaNavigation).Include(c => c.IdMonedaNavigation).Include(c => c.IdSectorNavigation).Include(c => c.IdZonaNavigation).Include(c => c.MotivoDenegacionNavigation).Include(c => c.NombreCuentaNavigation).Include(c => c.ProbabilidadNavigation);
            return View(await cRMContext.ToListAsync());
        }

        // GET: Cotizacion/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Cotizacions == null)
            {
                return NotFound();
            }

            var cotizacion = await _context.Cotizacions
                .Include(c => c.IdAsesorNavigation)
                .Include(c => c.IdCompetidorNavigation)
                .Include(c => c.IdContactoNavigation)
                .Include(c => c.IdEtapaNavigation)
                .Include(c => c.IdMonedaNavigation)
                .Include(c => c.IdSectorNavigation)
                .Include(c => c.IdZonaNavigation)
                .Include(c => c.MotivoDenegacionNavigation)
                .Include(c => c.NombreCuentaNavigation)
                .Include(c => c.ProbabilidadNavigation)
                .FirstOrDefaultAsync(m => m.NumeroCotizacion == id);
            if (cotizacion == null)
            {
                return NotFound();
            }

            return View(cotizacion);
        }

        // GET: Cotizacion/Create
        public IActionResult Create()
        {
            ViewData["IdAsesor"] = new SelectList(_context.Usuarios, "Cedula", "Cedula");
            ViewData["IdCompetidor"] = new SelectList(_context.Competidors, "Nombre", "Nombre");
            ViewData["IdContacto"] = new SelectList(_context.Contactos, "Id", "CedulaCliente");
            ViewData["IdEtapa"] = new SelectList(_context.Etapas, "Nombre", "Nombre");
            ViewData["IdMoneda"] = new SelectList(_context.Moneda, "Id", "Id");
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id");
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id");
            ViewData["MotivoDenegacion"] = new SelectList(_context.Motivos, "Id", "Id");
            ViewData["NombreCuenta"] = new SelectList(_context.CuentaClientes, "NombreCuenta", "CedulaCliente");
            ViewData["Probabilidad"] = new SelectList(_context.Probabilidads, "Porcentaje", "Porcentaje");
            return View();
        }

        // POST: Cotizacion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,NombreCuenta,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,IdZona,IdSector,IdMoneda,IdEtapa,IdAsesor,Probabilidad,MotivoDenegacion,IdCompetidor")] Cotizacion cotizacion)
        {
            if (ModelState.IsValid)
            {
                _context.Add(cotizacion);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdAsesor"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", cotizacion.IdAsesor);
            ViewData["IdCompetidor"] = new SelectList(_context.Competidors, "Nombre", "Nombre", cotizacion.IdCompetidor);
            ViewData["IdContacto"] = new SelectList(_context.Contactos, "Id", "CedulaCliente", cotizacion.IdContacto);
            ViewData["IdEtapa"] = new SelectList(_context.Etapas, "Nombre", "Nombre", cotizacion.IdEtapa);
            ViewData["IdMoneda"] = new SelectList(_context.Moneda, "Id", "Id", cotizacion.IdMoneda);
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id", cotizacion.IdSector);
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id", cotizacion.IdZona);
            ViewData["MotivoDenegacion"] = new SelectList(_context.Motivos, "Id", "Id", cotizacion.MotivoDenegacion);
            ViewData["NombreCuenta"] = new SelectList(_context.CuentaClientes, "NombreCuenta", "CedulaCliente", cotizacion.NombreCuenta);
            ViewData["Probabilidad"] = new SelectList(_context.Probabilidads, "Porcentaje", "Porcentaje", cotizacion.Probabilidad);
            return View(cotizacion);
        }

        // GET: Cotizacion/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Cotizacions == null)
            {
                return NotFound();
            }

            var cotizacion = await _context.Cotizacions.FindAsync(id);
            if (cotizacion == null)
            {
                return NotFound();
            }
            ViewData["IdAsesor"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", cotizacion.IdAsesor);
            ViewData["IdCompetidor"] = new SelectList(_context.Competidors, "Nombre", "Nombre", cotizacion.IdCompetidor);
            ViewData["IdContacto"] = new SelectList(_context.Contactos, "Id", "CedulaCliente", cotizacion.IdContacto);
            ViewData["IdEtapa"] = new SelectList(_context.Etapas, "Nombre", "Nombre", cotizacion.IdEtapa);
            ViewData["IdMoneda"] = new SelectList(_context.Moneda, "Id", "Id", cotizacion.IdMoneda);
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id", cotizacion.IdSector);
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id", cotizacion.IdZona);
            ViewData["MotivoDenegacion"] = new SelectList(_context.Motivos, "Id", "Id", cotizacion.MotivoDenegacion);
            ViewData["NombreCuenta"] = new SelectList(_context.CuentaClientes, "NombreCuenta", "CedulaCliente", cotizacion.NombreCuenta);
            ViewData["Probabilidad"] = new SelectList(_context.Probabilidads, "Porcentaje", "Porcentaje", cotizacion.Probabilidad);
            return View(cotizacion);
        }

        // POST: Cotizacion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,NombreCuenta,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,IdZona,IdSector,IdMoneda,IdEtapa,IdAsesor,Probabilidad,MotivoDenegacion,IdCompetidor")] Cotizacion cotizacion)
        {
            if (id != cotizacion.NumeroCotizacion)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cotizacion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CotizacionExists(cotizacion.NumeroCotizacion))
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
            ViewData["IdAsesor"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", cotizacion.IdAsesor);
            ViewData["IdCompetidor"] = new SelectList(_context.Competidors, "Nombre", "Nombre", cotizacion.IdCompetidor);
            ViewData["IdContacto"] = new SelectList(_context.Contactos, "Id", "CedulaCliente", cotizacion.IdContacto);
            ViewData["IdEtapa"] = new SelectList(_context.Etapas, "Nombre", "Nombre", cotizacion.IdEtapa);
            ViewData["IdMoneda"] = new SelectList(_context.Moneda, "Id", "Id", cotizacion.IdMoneda);
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id", cotizacion.IdSector);
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id", cotizacion.IdZona);
            ViewData["MotivoDenegacion"] = new SelectList(_context.Motivos, "Id", "Id", cotizacion.MotivoDenegacion);
            ViewData["NombreCuenta"] = new SelectList(_context.CuentaClientes, "NombreCuenta", "CedulaCliente", cotizacion.NombreCuenta);
            ViewData["Probabilidad"] = new SelectList(_context.Probabilidads, "Porcentaje", "Porcentaje", cotizacion.Probabilidad);
            return View(cotizacion);
        }

        // GET: Cotizacion/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Cotizacions == null)
            {
                return NotFound();
            }

            var cotizacion = await _context.Cotizacions
                .Include(c => c.IdAsesorNavigation)
                .Include(c => c.IdCompetidorNavigation)
                .Include(c => c.IdContactoNavigation)
                .Include(c => c.IdEtapaNavigation)
                .Include(c => c.IdMonedaNavigation)
                .Include(c => c.IdSectorNavigation)
                .Include(c => c.IdZonaNavigation)
                .Include(c => c.MotivoDenegacionNavigation)
                .Include(c => c.NombreCuentaNavigation)
                .Include(c => c.ProbabilidadNavigation)
                .FirstOrDefaultAsync(m => m.NumeroCotizacion == id);
            if (cotizacion == null)
            {
                return NotFound();
            }

            return View(cotizacion);
        }

        // POST: Cotizacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Cotizacions == null)
            {
                return Problem("Entity set 'CRMContext.Cotizacions'  is null.");
            }
            var cotizacion = await _context.Cotizacions.FindAsync(id);
            if (cotizacion != null)
            {
                _context.Cotizacions.Remove(cotizacion);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CotizacionExists(int id)
        {
          return _context.Cotizacions.Any(e => e.NumeroCotizacion == id);
        }
    }
}

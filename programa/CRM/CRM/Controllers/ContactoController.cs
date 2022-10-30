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
    public class ContactoController : Controller
    {
        private readonly CRMContext _context;

        public ContactoController(CRMContext context)
        {
            _context = context;
        }

        // GET: Contacto
        public async Task<IActionResult> Index()
        {
            var cRMContext = _context.Contactos.Include(c => c.CedulaCliente1).Include(c => c.CedulaClienteNavigation).Include(c => c.CedulaUsuarioNavigation).Include(c => c.DireccionNavigation).Include(c => c.EstadoNavigation).Include(c => c.IdSectorNavigation).Include(c => c.IdZonaNavigation).Include(c => c.TipoContactoNavigation);
            return View(await cRMContext.ToListAsync());
        }

        // GET: Contacto/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Contactos == null)
            {
                return NotFound();
            }

            var contacto = await _context.Contactos
                .Include(c => c.CedulaCliente1)
                .Include(c => c.CedulaClienteNavigation)
                .Include(c => c.CedulaUsuarioNavigation)
                .Include(c => c.DireccionNavigation)
                .Include(c => c.EstadoNavigation)
                .Include(c => c.IdSectorNavigation)
                .Include(c => c.IdZonaNavigation)
                .Include(c => c.TipoContactoNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (contacto == null)
            {
                return NotFound();
            }

            return View(contacto);
        }

        // GET: Contacto/Create
        public IActionResult Create()
        {
            ViewData["CedulaCliente"] = new SelectList(_context.CuentaClientes, "CedulaCliente", "CedulaCliente");
            ViewData["CedulaCliente"] = new SelectList(_context.Clientes, "Cedula", "Cedula");
            ViewData["CedulaUsuario"] = new SelectList(_context.Usuarios, "Cedula", "Cedula");
            ViewData["Direccion"] = new SelectList(_context.Direccions, "Id", "Id");
            ViewData["Estado"] = new SelectList(_context.Estados, "Id", "Id");
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id");
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id");
            ViewData["TipoContacto"] = new SelectList(_context.TipoContactos, "Id", "Id");
            return View();
        }

        // POST: Contacto/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,CedulaCliente,CedulaUsuario,TipoContacto,Motivo,Nombre,Telefono,CorreoElectronico,Estado,Direccion,Descripcion,IdZona,IdSector")] Contacto contacto)
        {
            if (ModelState.IsValid)
            {
                _context.Add(contacto);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CedulaCliente"] = new SelectList(_context.CuentaClientes, "CedulaCliente", "CedulaCliente", contacto.CedulaCliente);
            ViewData["CedulaCliente"] = new SelectList(_context.Clientes, "Cedula", "Cedula", contacto.CedulaCliente);
            ViewData["CedulaUsuario"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", contacto.CedulaUsuario);
            ViewData["Direccion"] = new SelectList(_context.Direccions, "Id", "Id", contacto.Direccion);
            ViewData["Estado"] = new SelectList(_context.Estados, "Id", "Id", contacto.Estado);
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id", contacto.IdSector);
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id", contacto.IdZona);
            ViewData["TipoContacto"] = new SelectList(_context.TipoContactos, "Id", "Id", contacto.TipoContacto);
            return View(contacto);
        }

        // GET: Contacto/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Contactos == null)
            {
                return NotFound();
            }

            var contacto = await _context.Contactos.FindAsync(id);
            if (contacto == null)
            {
                return NotFound();
            }
            ViewData["CedulaCliente"] = new SelectList(_context.CuentaClientes, "CedulaCliente", "CedulaCliente", contacto.CedulaCliente);
            ViewData["CedulaCliente"] = new SelectList(_context.Clientes, "Cedula", "Cedula", contacto.CedulaCliente);
            ViewData["CedulaUsuario"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", contacto.CedulaUsuario);
            ViewData["Direccion"] = new SelectList(_context.Direccions, "Id", "Id", contacto.Direccion);
            ViewData["Estado"] = new SelectList(_context.Estados, "Id", "Id", contacto.Estado);
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id", contacto.IdSector);
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id", contacto.IdZona);
            ViewData["TipoContacto"] = new SelectList(_context.TipoContactos, "Id", "Id", contacto.TipoContacto);
            return View(contacto);
        }

        // POST: Contacto/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,CedulaCliente,CedulaUsuario,TipoContacto,Motivo,Nombre,Telefono,CorreoElectronico,Estado,Direccion,Descripcion,IdZona,IdSector")] Contacto contacto)
        {
            if (id != contacto.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(contacto);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ContactoExists(contacto.Id))
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
            ViewData["CedulaCliente"] = new SelectList(_context.CuentaClientes, "CedulaCliente", "CedulaCliente", contacto.CedulaCliente);
            ViewData["CedulaCliente"] = new SelectList(_context.Clientes, "Cedula", "Cedula", contacto.CedulaCliente);
            ViewData["CedulaUsuario"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", contacto.CedulaUsuario);
            ViewData["Direccion"] = new SelectList(_context.Direccions, "Id", "Id", contacto.Direccion);
            ViewData["Estado"] = new SelectList(_context.Estados, "Id", "Id", contacto.Estado);
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id", contacto.IdSector);
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id", contacto.IdZona);
            ViewData["TipoContacto"] = new SelectList(_context.TipoContactos, "Id", "Id", contacto.TipoContacto);
            return View(contacto);
        }

        // GET: Contacto/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Contactos == null)
            {
                return NotFound();
            }

            var contacto = await _context.Contactos
                .Include(c => c.CedulaCliente1)
                .Include(c => c.CedulaClienteNavigation)
                .Include(c => c.CedulaUsuarioNavigation)
                .Include(c => c.DireccionNavigation)
                .Include(c => c.EstadoNavigation)
                .Include(c => c.IdSectorNavigation)
                .Include(c => c.IdZonaNavigation)
                .Include(c => c.TipoContactoNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (contacto == null)
            {
                return NotFound();
            }

            return View(contacto);
        }

        // POST: Contacto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Contactos == null)
            {
                return Problem("Entity set 'CRMContext.Contactos'  is null.");
            }
            var contacto = await _context.Contactos.FindAsync(id);
            if (contacto != null)
            {
                _context.Contactos.Remove(contacto);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ContactoExists(int id)
        {
          return _context.Contactos.Any(e => e.Id == id);
        }
    }
}

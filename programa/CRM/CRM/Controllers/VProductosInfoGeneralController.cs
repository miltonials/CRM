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
    public class VProductosInfoGeneralController : Controller
    {
        private readonly CRMContext _context;

        public VProductosInfoGeneralController(CRMContext context)
        {
            _context = context;
        }

        // GET: VProductosInfoGeneral
        public async Task<IActionResult> Index()
        {
              return View(await _context.VProductosInfoGenerals.ToListAsync());
        }

        // GET: VProductosInfoGeneral/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.VProductosInfoGenerals == null)
            {
                return NotFound();
            }

            var vProductosInfoGeneral = await _context.VProductosInfoGenerals
                .FirstOrDefaultAsync(m => m.Codigo == id);
            if (vProductosInfoGeneral == null)
            {
                return NotFound();
            }

            return View(vProductosInfoGeneral);
        }

        // GET: VProductosInfoGeneral/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: VProductosInfoGeneral/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Codigo,Familia,Nombre,PrecioEstandar,Estado,Descripcion")] VProductosInfoGeneral vProductosInfoGeneral)
        {
            if (ModelState.IsValid)
            {
                _context.Add(vProductosInfoGeneral);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(vProductosInfoGeneral);
        }

        // GET: VProductosInfoGeneral/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.VProductosInfoGenerals == null)
            {
                return NotFound();
            }

            var vProductosInfoGeneral = await _context.VProductosInfoGenerals.FindAsync(id);
            if (vProductosInfoGeneral == null)
            {
                return NotFound();
            }
            return View(vProductosInfoGeneral);
        }

        // POST: VProductosInfoGeneral/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Codigo,Familia,Nombre,PrecioEstandar,Estado,Descripcion")] VProductosInfoGeneral vProductosInfoGeneral)
        {
            if (id != vProductosInfoGeneral.Codigo)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(vProductosInfoGeneral);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!VProductosInfoGeneralExists(vProductosInfoGeneral.Codigo))
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
            return View(vProductosInfoGeneral);
        }

        // GET: VProductosInfoGeneral/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.VProductosInfoGenerals == null)
            {
                return NotFound();
            }

            var vProductosInfoGeneral = await _context.VProductosInfoGenerals
                .FirstOrDefaultAsync(m => m.Codigo == id);
            if (vProductosInfoGeneral == null)
            {
                return NotFound();
            }

            return View(vProductosInfoGeneral);
        }

        // POST: VProductosInfoGeneral/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.VProductosInfoGenerals == null)
            {
                return Problem("Entity set 'CRMContext.VProductosInfoGenerals'  is null.");
            }
            var vProductosInfoGeneral = await _context.VProductosInfoGenerals.FindAsync(id);
            if (vProductosInfoGeneral != null)
            {
                _context.VProductosInfoGenerals.Remove(vProductosInfoGeneral);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool VProductosInfoGeneralExists(int id)
        {
          return _context.VProductosInfoGenerals.Any(e => e.Codigo == id);
        }
    }
}

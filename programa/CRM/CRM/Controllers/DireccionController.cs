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
    public class DireccionController : Controller
    {
        private readonly CRMContext _context;

        public DireccionController(CRMContext context)
        {
            _context = context;
        }

        // GET: Direccion
        public async Task<IActionResult> Index()
        {
            var cRMContext = _context.Direccions.Include(d => d.IdCantonNavigation).Include(d => d.IdDistritoNavigation).Include(d => d.IdProvinciaNavigation);

            return View(await cRMContext.ToListAsync());
        }
    }
}

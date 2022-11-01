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
    public class VContactosInfoGeneralController : Controller
    {
        private readonly CRMContext _context;

        public VContactosInfoGeneralController(CRMContext context)
        {
            _context = context;
        }

        // GET: VContactosInfoGeneral
        public async Task<IActionResult> Index()
        {
              return View(await _context.VContactosInfoGenerals.ToListAsync());
        }

        // GET: VContactosInfoGeneral/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.VContactosInfoGenerals == null)
            {
                return NotFound();
            }

            var vContactosInfoGeneral = await _context.VContactosInfoGenerals
                .FirstOrDefaultAsync(m => m.Id == id);
            if (vContactosInfoGeneral == null)
            {
                return NotFound();
            }

            return View(vContactosInfoGeneral);
        }

        [HttpGet("VContactosInfoGeneral/Filtrar/{cedula}")]
        public IActionResult Filtrar(string cedula)
        {
            var cedulaCl = new SqlParameter("cedula_cliente", cedula);
            var ret = new SqlParameter("ret", 2);
            var res = _context
            .VContactosInfoGenerals
            .FromSqlInterpolated($"procObtenerContactosPorCliente @cedula_cliente = {cedulaCl}, @ret = {ret}").ToList();
            
            return View("Index", res);
        }
    }
}

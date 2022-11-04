using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace CRM.Controllers
{
    public class CuentaClientesController : Controller
    {
        private readonly CRMContext _context;

        public CuentaClientesController(CRMContext context)
        {
            _context = context;
        }

        // GET: CuentaClientes
        public async Task<IActionResult> Index()
        {
            var cRMContext = _context.CuentaClientes.Include(c => c.CedulaClienteNavigation).Include(c => c.IdSectorNavigation).Include(c => c.IdZonaNavigation).Include(c => c.MonedaNavigation);
            return View(await cRMContext.ToListAsync());
        }

        // GET: CuentaClientes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.CuentaClientes == null)
            {
                return NotFound();
            }

            var cuentaCliente = await _context.CuentaClientes
                .Include(c => c.CedulaClienteNavigation)
                .Include(c => c.IdSectorNavigation)
                .Include(c => c.IdZonaNavigation)
                .Include(c => c.MonedaNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (cuentaCliente == null)
            {
                return NotFound();
            }

            return View(cuentaCliente);
        }

        // GET: CuentaClientes/Create
        public IActionResult Create()
        {
            ViewData["CedulaCliente"] = new SelectList(_context.Clientes, "Cedula", "Cedula");
            ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id");
            ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id");
            ViewData["Moneda"] = new SelectList(_context.Moneda, "Id", "Id");
            return View();
        }

        // POST: CuentaClientes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,CedulaCliente,NombreCuenta,Moneda,ContactoPrincipal,SitioWeb,InformacionAdicional,CorreoElectronico,IdZona,IdSector")] CuentaCliente cuentaCliente)
        {
            using (SqlConnection conexion = new SqlConnection("server=Localhost; database=CRM; User ID=sa; Password=1234;"))
            {
                conexion.Open();

                SqlCommand cmd = new SqlCommand("CuentaCliente_Insert", conexion);


                cmd.Parameters.AddWithValue("@id", cuentaCliente.Id);
                cmd.Parameters.AddWithValue("@cedula_cliente", cuentaCliente.CedulaCliente);
                cmd.Parameters.AddWithValue("@nombre_cuenta", cuentaCliente.NombreCuenta);
                cmd.Parameters.AddWithValue("@moneda", cuentaCliente.Moneda);
                cmd.Parameters.AddWithValue("@contacto_principal", cuentaCliente.ContactoPrincipal);
                cmd.Parameters.AddWithValue("@sitio_web", cuentaCliente.SitioWeb);
                cmd.Parameters.AddWithValue("@informacion_adicional", cuentaCliente.InformacionAdicional);
                cmd.Parameters.AddWithValue("@correo_electronico", cuentaCliente.CorreoElectronico);
                cmd.Parameters.AddWithValue("@id_zona", cuentaCliente.IdZona);
                cmd.Parameters.AddWithValue("@id_sector", cuentaCliente.IdSector);
                cmd.Parameters.AddWithValue("@ret", 1);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    // mensaje de error, no se pudo eliminar la cuentaCliente
                    return RedirectToAction("Create");
                }

            }


        }

        // GET: CuentaClientes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.CuentaClientes == null)
            {
                return NotFound();
            }

            var cuentaCliente = await _context.CuentaClientes
                .Include(c => c.CedulaClienteNavigation)
                .Include(c => c.IdSectorNavigation)
                .Include(c => c.IdZonaNavigation)
                .Include(c => c.MonedaNavigation)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (cuentaCliente == null)
            {
                return NotFound();
            }

            return View(cuentaCliente);
        }

        // POST: CuentaClientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            using (SqlConnection conexion = new SqlConnection("server=Localhost; database=CRM; User ID=sa; Password=1234;"))
            {


                conexion.Open();

                SqlCommand cmd = new SqlCommand("CuentaCliente_Delete", conexion);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@ret", 1);
                cmd.CommandType = CommandType.Text;

                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                int resultado = cmd.ExecuteNonQuery();

                if (resultado == 1)
                {
                    return RedirectToAction("Index");
                }
                else{
                    // mensaje de error, no se pudo eliminar la cuentaCliente
                    return RedirectToAction("Delete");
                }

            }
            return RedirectToAction(actionName: "Index");
        }

        private bool CuentaClienteExists(int id)
        {
          return _context.CuentaClientes.Any(e => e.Id == id);
        }
    }
}

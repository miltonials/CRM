using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;
using Microsoft.CodeAnalysis.Differencing;
using Microsoft.Data.SqlClient;

namespace CRM.Controllers
{
    public class ClienteController : Controller
    {
        private readonly CRMContext _context;

        public ClienteController(CRMContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Método que retorna la vista principal de los clientes.
        /// </summary>
        /// <returns></returns>
        public async Task<IActionResult> Index()
        {
              return View(await _context.Clientes.ToListAsync());
        }

        /// <summary>
        /// Metodo que permite ver los detalles de un cliente especifico.
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<IActionResult> Details(string id)
        {
            Cliente cliente = _context
                .Clientes
                .FromSqlInterpolated($"procBuscarCliente {id}, {0}")
                .ToList()
                .First();

            return View(cliente);
        }

        // GET: Cliente/Create
        /// <summary>
        /// Metodo que permite acceder a la vista de creacion de un nuevo cliente.
        /// <returns>
        ///    Vista de creación de cliente.
        /// </returns>
        /// </summary>
        public IActionResult Create()
        {
            return View();
        }

        /// <summary>
        /// Metodo que permite registrar un nuevo cliente dentro de la base de datos
        /// </summary>
        /// <param name="cliente"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Cedula,Telefono,Celular,Nombre,Apellido1,Apellido2")] Cliente cliente)
        {
            //@cedula VARCHAR(30),
            SqlParameter pCedula = new SqlParameter
            {
                ParameterName = "@cedula",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = cliente.Cedula
            };
            //@telefono varchar(30),
            SqlParameter pTelefono = new SqlParameter
            {
                ParameterName = "@telefono",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = cliente.Telefono
            };
            //@celular varchar(30),
            SqlParameter pCelular = new SqlParameter
            {
                ParameterName = "@celular",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = cliente.Celular
            };
            //@nombre varchar(30),
            SqlParameter pNombre = new SqlParameter
            {
                ParameterName = "nombre",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cliente.Nombre,
            };
            //@apellido1 varchar(30),
            SqlParameter pApellido1 = new SqlParameter
            {
                ParameterName = "@apellido1",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = cliente.Apellido1
            };
            //@apellido2 varchar(30),
            SqlParameter pApellido2 = new SqlParameter
            {
                ParameterName = "@apellido2",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = cliente.Apellido2
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Cliente_Insert @cedula, @telefono, @celular, @nombre, @apellido1, @apellido2, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pCedula, pTelefono, pCelular, pNombre, pApellido1, pApellido2, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {
                TempData["exito"] = -1;
                return RedirectToAction(nameof(Create));
            }
            else
                return RedirectToAction(nameof(Index));
        }

        /// <summary>
        /// Metodo que rotorna la vista para eliminacion del registro de un cliente
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Vista cliente Delete.cshtm</returns>
        public async Task<IActionResult> Delete(string id)
        {
            var pCedula = new SqlParameter
            {
                ParameterName = "cedula",
                Value = id,
                SqlDbType = System.Data.SqlDbType.Int
            };
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            //var sql = "EXECUTE procBuscarCliente @cedula, @ret OUT";
            Cliente cliente = _context
                .Clientes
                .FromSqlInterpolated($"procBuscarCliente {pCedula}, {pRetorno}")
                .ToList()
                .First();
                return View(cliente);

        }

        /// <summary>
        /// Metodo que permite eliminar el registro de un cliente de la base de datos.
        /// </summary>
        /// <param name="id"></param>
        /// <returns>
        ///     Index view si el registro del cliente fue eliminado correctamente.
        ///     Delete view si el registro del cliente no fue borrado.
        /// </returns>
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            var pCedula = new SqlParameter
            {
                ParameterName = "cedula",
                Value = id,
                SqlDbType = System.Data.SqlDbType.Int
            };
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Cliente_Delete @cedula, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pCedula, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {
                TempData["exito"] = -1;
                return RedirectToAction(nameof(Delete));
            }
            else
            {
                return RedirectToAction(nameof(Index));
            }
        }
    }
}

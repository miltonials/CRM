using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;
using Microsoft.Data.SqlClient;
using System.Diagnostics.Contracts;
using Microsoft.CodeAnalysis.Differencing;
using System.IO.Pipelines;

namespace CRM.Controllers
{
    public class InflacionController : Controller
    {
        private readonly CRMContext _context;

        /// <summary>
        /// Constructor 
        /// </summary>
        /// <param name="context"></param>
        public InflacionController(CRMContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Metodo que permite ingresar a la vista index de la tabla inflacion.
        /// </summary>
        /// <returns>La vista Index</returns>
        public async Task<IActionResult> Index()
        {
            ViewData["exito"] = 0;
            var lista = _context
                        .Inflacions
                        .FromSqlInterpolated($"procSelectInflacion")
                        .ToListAsync();
            return View(await lista);
        }
        

        /// <summary>
        /// Metodo que permite acceder a la vista create para registrar nuevas inflaciones.
        /// </summary>
        /// <returns></returns>
        public IActionResult Create()
        {
            Inflacion inflacion = new Inflacion();
            inflacion.Anno = 0;
            return View(inflacion);
        }

        /// <summary>
        /// Metodo que permite registrar una nueva inflacion a la base de datos.
        /// </summary>
        /// <param name="inflacion"> Objeto de tipo inflacion</param>
        /// <returns>La vista index si la nueva inflacion se registro correctamente. La vista create si hubo algun error.</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Anno,Porcentaje")] Inflacion inflacion)
        {
            //@anno
            SqlParameter pAnno = new SqlParameter
            {
                ParameterName = "anno",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = inflacion.Anno
            };
            //@porcentaje
            SqlParameter pPorcentaje = new SqlParameter
            {
                ParameterName = "porcentaje",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = inflacion.Porcentaje
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Inflacion_Insert @anno, @porcentaje, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pAnno, pPorcentaje, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {
                inflacion.Anno = -1;
                return View("Create", inflacion);
            }
            else
            {
                ViewData["exito"] = 2;
                var lista = _context
                        .Inflacions
                        .FromSqlInterpolated($"procSelectInflacion")
                        .ToListAsync();

                return View("Index", await lista);
            }
        }
        

        /// <summary>
        /// Método que permite eliminar el registro de una inflacion.
        /// </summary>
        /// <param name="id">Anno de la inflacion a eliminar</param>
        /// <returns>La vista index</returns>
        public async Task<IActionResult> Delete(int? id)
        {
            var pId = new SqlParameter
            {
                ParameterName = "id",
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
            var sql = "EXECUTE Inflacion_Delete @id, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pId, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {
                ViewData["exito"] = -1;
            }
            else
            {
                ViewData["exito"] = 1;
            }

            var lista = _context
                        .Inflacions
                        .FromSqlInterpolated($"procSelectInflacion")
                        .ToListAsync();

            return View("Index", await lista);
        }
    }
}

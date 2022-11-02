using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CRM.Models;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json.Linq;
using System.Data;
using System.ComponentModel.DataAnnotations;

namespace CRM.Controllers
{
    public class ProductoController : Controller
    {
        private readonly CRMContext _context;

        public ProductoController(CRMContext context)
        {
            _context = context;
        }


        /// <summary>
        /// Metodo que muestra la totalidad de los productos que han sido registrados en la base de datos
        /// </summary>
        public async Task<IActionResult> Index()
        {
            var cRMContext = _context.Productos.Include(p => p.CodigoFamiliaNavigation).Include(p => p.EstadoNavigation);
            return View(await cRMContext.ToListAsync());
        }

        /// <summary>
        /// Metodo que lista los detalles de un producto especifico
        /// <paramref name="id"/>
        /// </summary>
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Productos == null)
            {
                return NotFound();
            }

            Producto producto = _context.Productos
                .FromSqlInterpolated($"procBuscarProducto {id}, {0}")
                .ToList()
                .First();

            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);
        }

        /// <summary>
        /// Metodo que retorna la vista que posibilita registrar un nueo producto a la base de datos
        /// </summary>
        public IActionResult Create()
        {
            ViewData["CodigoFamilia"] = new SelectList(_context.Familia, "Codigo", "Codigo");
            ViewData["NombreFamilias"] = new SelectList(_context.Familia, "Nombre", "Nombre");
            ViewData["Estado"] = new SelectList(_context.EstadoProductos, "Id", "Id");
            ViewData["NombreEstados"] = new SelectList(_context.EstadoProductos, "Nombre", "Nombre");
            return View();
        }

        /// <summary>
        /// Método que permite registrar un nuevo producto a la base de datos mediante método post.
        /// </summary>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Codigo,CodigoFamilia,Nombre,PrecioEstandar,Estado,Descripcion")] Producto producto)
        {
            //@codigo INT,
            SqlParameter pCodigo = new SqlParameter
            {
                ParameterName = "Codigo",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.Codigo,
            };
            //@codigo_familia INT,
            SqlParameter pCodigo_familia = new SqlParameter
            {
                ParameterName = "codigo_familia",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.CodigoFamilia,
            };
            //@nombre VARCHAR(30),
            SqlParameter pNombre = new SqlParameter
            {
                ParameterName = "nombre",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = producto.Nombre,
            };
            //@precioEstandar INT,
            SqlParameter pPrecioEstandar = new SqlParameter
            {
                ParameterName = "precioEstandar",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.PrecioEstandar,
            };
            //@estado INT,
            SqlParameter pEstado = new SqlParameter
            {
                ParameterName = "estado",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.Estado,
            };
            //@descripcion VARCHAR(30),
            SqlParameter pDescripcion = new SqlParameter
            {
                ParameterName = "descripcion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = producto.Descripcion,
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Producto_Insert @codigo, @codigo_familia, @nombre, @precioEstandar, @estado, @descripcion, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pCodigo, pCodigo_familia, pNombre, pPrecioEstandar, pEstado, pDescripcion, pRetorno);
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
        /// Método que retorna la vista que permite modificar los campos de un producto específico
        /// <paramref name="id"/>
        /// <returns>Vista Producto Edit</returns>
        /// </summary>
        public async Task<IActionResult> Edit(int? id)
        {
            //var producto = await _context.Productos.FindAsync(id);
            Producto producto = _context.Productos
                .FromSqlInterpolated($"procBuscarProducto {id}, {0}")
                .ToList()
                .First();

            ViewData["CodigoFamilia"] = new SelectList(_context.Familia, "Codigo", "Codigo", producto.CodigoFamilia);
            ViewData["Estado"] = new SelectList(_context.EstadoProductos, "Id", "Id", producto.Estado);
            return View(producto);
        }

        // POST: Producto/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Codigo,CodigoFamilia,Nombre,PrecioEstandar,Estado,Descripcion")] Producto producto)
        {
            if (id != producto.Codigo)
            {
                return NotFound();
            }
            //INICIO DE PARAMETROS DEL PROCEDIMIENTO ALMACENADO
            //@codigo INT,
            SqlParameter pCodigo = new SqlParameter
            {
                ParameterName = "Codigo",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.Codigo,
            };
            //@codigo_familia INT,
            SqlParameter pCodigo_familia = new SqlParameter
            {
                ParameterName = "codigo_familia",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.CodigoFamilia,
            };
            //@nombre VARCHAR(30),
            SqlParameter pNombre = new SqlParameter
            {
                ParameterName = "nombre",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = producto.Nombre,
            };
            //@precioEstandar INT,
            SqlParameter pPrecioEstandar = new SqlParameter
            {
                ParameterName = "precioEstandar",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.PrecioEstandar,
            };
            //@estado INT,
            SqlParameter pEstado = new SqlParameter
            {
                ParameterName = "estado",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = producto.Estado,
            };
            //@descripcion VARCHAR(30),
            SqlParameter pDescripcion = new SqlParameter
            {
                ParameterName = "descripcion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = producto.Descripcion,
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Producto_Update @codigo, @codigo_familia, @nombre, @precioEstandar, @estado, @descripcion, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pCodigo, pCodigo_familia, pNombre, pPrecioEstandar, pEstado, pDescripcion, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {
                TempData["exito"] = -1;
                return RedirectToAction(nameof(Edit));
            }
            else
            {
                return RedirectToAction(nameof(Index));
            }
        }

        private bool ProductoExists(int id)
        {
            return _context.Productos.Any(e => e.Codigo == id);
        }
    }
}
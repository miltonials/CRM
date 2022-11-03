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
            //ViewData["IdAsesor"] = new SelectList(_context.Usuarios, "Cedula", "Cedula");
            ViewData["IdCompetidor"] = new SelectList(_context.Competidors, "Nombre", "Nombre");
            ViewData["IdContacto"] = new SelectList(_context.Contactos, "Id", "Id");
            ViewData["IdEtapa"] = new SelectList(_context.Etapas, "Nombre", "Nombre");
            //ViewData["IdMoneda"] = new SelectList(_context.Moneda, "Id", "Id");
            //ViewData["IdSector"] = new SelectList(_context.Sectors, "Id", "Id");
            //ViewData["IdZona"] = new SelectList(_context.Zonas, "Id", "Id");
            ViewData["MotivoDenegacion"] = new SelectList(_context.Motivos, "Id", "Id");
            //ViewData["NombreCuenta"] = new SelectList(_context.CuentaClientes, "NombreCuenta", "CedulaCliente");
            ViewData["Probabilidad"] = new SelectList(_context.Probabilidads, "Porcentaje", "Porcentaje");
            return View();
        }

        // POST: Cotizacion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,IdEtapa,Probabilidad,MotivoDenegacion,IdCompetidor")] Cotizacion cotizacion)
        {
            //if (ModelState.IsValid)
            //{
            //    _context.Add(cotizacion);
            //    await _context.SaveChangesAsync();
            //    return RedirectToAction(nameof(Index));
            //}
            //INICIO DE PARAMETROS DEL PROCEDIMIENTO ALMACENADO
            //@numeroCotizacion INT,
            SqlParameter pNumeroCotizacion = new SqlParameter
            {
                ParameterName = "NumeroCotizacion",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = cotizacion.NumeroCotizacion
            };
            //@idFactura INT,
            SqlParameter pIdFactura = new SqlParameter
            {
                ParameterName = "IdFactura",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = cotizacion.IdFactura
            };
            //@idContacto INT,
            SqlParameter pIdContacto = new SqlParameter
            {
                ParameterName = "IdContacto",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = cotizacion.IdContacto
            };
            //@tipo VARCHAR(50),
            SqlParameter pTipo = new SqlParameter
            {
                ParameterName = "Tipo",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.Tipo
            };
            //@nombreOportunidad VARCHAR(50),
            SqlParameter pNombreOportunidad = new SqlParameter
            {
                ParameterName = "nombre_oportunidad",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.NombreOportunidad
            };
            //@fechaCotizacion DATE,
            SqlParameter pFechaCotizacion = new SqlParameter
            {
                ParameterName = "fechacotizacion",
                SqlDbType = System.Data.SqlDbType.Date,
                Value = cotizacion.FechaCotizacion
            };

            //@fechaProyeccionCierre DATE,
            SqlParameter pFechaProyeccionCierre = new SqlParameter
            {
                ParameterName = "fecha_proyeccion_cierre",
                SqlDbType = System.Data.SqlDbType.Date,
                Value = cotizacion.FechaProyeccionCierre
            };
            //@fechaCierre DATE,
            SqlParameter pFechaCierre = new SqlParameter
            {
                ParameterName = "fecha_cierre",
                SqlDbType = System.Data.SqlDbType.Date,
                Value = cotizacion.FechaCierre
            };
            //@ordenCompra VARCHAR(50),
            SqlParameter pOrdenCompra = new SqlParameter
            {
                ParameterName = "orden_compra",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.OrdenCompra
            };
            //@descripcion VARCHAR(50),
            SqlParameter pDescripcion = new SqlParameter
            {
                ParameterName = "descripcion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.Descripcion
            };
            //@idEtapa INT,
            SqlParameter pIdEtapa = new SqlParameter
            {
                ParameterName = "id_etapa",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.IdEtapa
            };
            //@idAsesor SMALLINT,
            SqlParameter pProbabilidad = new SqlParameter
            {
                ParameterName = "id_probabilidad",
                SqlDbType = System.Data.SqlDbType.SmallInt,
                Value = cotizacion.Probabilidad
            };
            //@motivoDenegacion VARCHAR(50),
            SqlParameter pMotivoDenegacion = new SqlParameter
            {
                ParameterName = "motivo_denegacion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 10,
                Value = cotizacion.MotivoDenegacion
            };
            //@IdCompetidor
            SqlParameter pIdCompetidor = new SqlParameter
            {
                ParameterName = "id_competidor",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.IdCompetidor
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Cotizacion_Update @numeroCotizacion, @idFactura, @idContacto, @tipo, @nombre_oportunidad, @fechaCotizacion, @fecha_proyeccion_cierre, @fecha_cierre,  @orden_compra, @descripcion, @id_etapa, @id_probabilidad, @motivo_denegacion, @id_competidor, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pNumeroCotizacion, pIdFactura, pIdContacto, pTipo, pNombreOportunidad, pFechaCotizacion, pFechaProyeccionCierre, pFechaCierre, pOrdenCompra, pDescripcion, pIdEtapa, pProbabilidad, pMotivoDenegacion, pIdCompetidor, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {
                TempData["exito"] = -1;
                return RedirectToAction(nameof(Edit));
            }
            else
            {
                TempData["exito"] = 2;
                return RedirectToAction(nameof(Index));
            }
        }

        // GET: Cotizacion/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Cotizacions == null)
            {
                return NotFound();
            }

            Cotizacion cotizacion = _context.Cotizacions
                .FromSqlInterpolated($"procBuscarCotizacion {id}, {0}")
                .ToList()
                .First(); ;
            if (cotizacion == null)
            {
                return NotFound();
            }
            ViewData["IdAsesor"] = new SelectList(_context.Usuarios, "Cedula", "Cedula", cotizacion.IdAsesor);
            ViewData["IdCompetidor"] = new SelectList(_context.Competidors, "Nombre", "Nombre", cotizacion.IdCompetidor);
            ViewData["IdContacto"] = new SelectList(_context.Contactos, "Id", "Id", cotizacion.IdContacto);
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
        //public async Task<IActionResult> Edit(int id, [Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,NombreCuenta,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,IdZona,IdSector,IdMoneda,IdEtapa,IdAsesor,Probabilidad,MotivoDenegacion,IdCompetidor")] Cotizacion cotizacion)
        public async Task<IActionResult> Edit(int id, [Bind("NumeroCotizacion,IdFactura,IdContacto,Tipo,NombreOportunidad,FechaCotizacion,FechaProyeccionCierre,FechaCierre,OrdenCompra,Descripcion,IdEtapa,Probabilidad,MotivoDenegacion,IdCompetidor")] Cotizacion cotizacion)
        {
            if (id != cotizacion.NumeroCotizacion)
            {
                return NotFound();
            }
            //INICIO DE PARAMETROS DEL PROCEDIMIENTO ALMACENADO
            //@numeroCotizacion INT,
            SqlParameter pNumeroCotizacion = new SqlParameter
            {
                ParameterName = "NumeroCotizacion",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = cotizacion.NumeroCotizacion
            };
            //@idFactura INT,
            SqlParameter pIdFactura = new SqlParameter
            {
                ParameterName = "IdFactura",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = cotizacion.IdFactura
            };
            //@idContacto INT,
            SqlParameter pIdContacto = new SqlParameter
            {
                ParameterName = "IdContacto",
                SqlDbType = System.Data.SqlDbType.Int,
                Value = cotizacion.IdContacto
            };
            //@tipo VARCHAR(50),
            SqlParameter pTipo = new SqlParameter
            {
                ParameterName = "Tipo",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.Tipo
            };
            //@nombreOportunidad VARCHAR(50),
            SqlParameter pNombreOportunidad = new SqlParameter
            {
                ParameterName = "nombre_oportunidad",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.NombreOportunidad
            };
            //@fechaCotizacion DATE,
            SqlParameter pFechaCotizacion = new SqlParameter
            {
                ParameterName = "fechacotizacion",
                SqlDbType = System.Data.SqlDbType.Date,
                Value = cotizacion.FechaCotizacion
            };
        
            //@fechaProyeccionCierre DATE,
            SqlParameter pFechaProyeccionCierre = new SqlParameter
            {
                ParameterName = "fecha_proyeccion_cierre",
                SqlDbType = System.Data.SqlDbType.Date,
                Value = cotizacion.FechaProyeccionCierre
            };
            //@fechaCierre DATE,
            SqlParameter pFechaCierre = new SqlParameter
            {
                ParameterName = "fecha_cierre",
                SqlDbType = System.Data.SqlDbType.Date,
                Value = cotizacion.FechaCierre
            };
            //@ordenCompra VARCHAR(50),
            SqlParameter pOrdenCompra = new SqlParameter
            {
                ParameterName = "orden_compra",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.OrdenCompra
            };
            //@descripcion VARCHAR(50),
            SqlParameter pDescripcion = new SqlParameter
            {
                ParameterName = "descripcion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.Descripcion
            };
            //@idEtapa INT,
            SqlParameter pIdEtapa = new SqlParameter
            {
                ParameterName = "id_etapa",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.IdEtapa
            };
            //@idAsesor SMALLINT,
            SqlParameter pProbabilidad = new SqlParameter
            {
                ParameterName = "id_probabilidad",
                SqlDbType = System.Data.SqlDbType.SmallInt,
                Value = cotizacion.Probabilidad
            };
            //@motivoDenegacion VARCHAR(50),
            SqlParameter pMotivoDenegacion = new SqlParameter
            {
                ParameterName = "motivo_denegacion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 10,
                Value = cotizacion.MotivoDenegacion
            };
            //@IdCompetidor
            SqlParameter pIdCompetidor = new SqlParameter
            {
                ParameterName = "id_competidor",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Precision = 30,
                Value = cotizacion.IdCompetidor
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE Cotizacion_Insert @numeroCotizacion, @idFactura, @idContacto, @tipo, @nombre_oportunidad, @fechaCotizacion, @fecha_proyeccion_cierre, @fecha_cierre,  @orden_compra, @descripcion, @id_etapa, @id_probabilidad, @motivo_denegacion, @id_competidor, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pNumeroCotizacion, pIdFactura, pIdContacto, pTipo, pNombreOportunidad, pFechaCotizacion, pFechaProyeccionCierre, pFechaCierre, pOrdenCompra, pDescripcion, pIdEtapa, pProbabilidad, pMotivoDenegacion, pIdCompetidor, pRetorno);
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
        
        private bool CotizacionExists(int id)
        {
          return _context.Cotizacions.Any(e => e.NumeroCotizacion == id);
        }
    }
}

using CRM.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Diagnostics;

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
            var contacto = _context
                .Contactos
                .FromSqlInterpolated($"procBuscarContacto {pId}, {pRetorno}")
                .ToList()
                .First();

            ViewData["usuario"] = _context
                .Usuarios
                .FromSqlInterpolated($"procBuscarUsuario {contacto.CedulaUsuario}, {pRetorno}")
                .ToList()
                .First();

            ViewData["cliente"] = _context
                .Clientes
                .FromSqlInterpolated($"procBuscarCliente {contacto.CedulaCliente}, {pRetorno}")
                .ToList()
                .First();

            Direccion dir = _context
                .Direccions
                .FromSqlInterpolated($"procBuscarDireccion {contacto.Direccion}, {pRetorno}")
                .ToList()
                .First();

            dir.IdProvinciaNavigation = _context
                .Provincia
                .FromSqlInterpolated($"procBuscarProvincia {dir.IdProvincia}, {pRetorno}")
                .ToList()
                .First();

            dir.IdCantonNavigation = _context
                .Cantons
                .FromSqlInterpolated($"procBuscarCanton {dir.IdCanton}, {pRetorno}")
                .ToList()
                .First();

            dir.IdDistritoNavigation = _context
                .Distritos
                .FromSqlInterpolated($"procBuscarDistrito {dir.IdDistrito}, {pRetorno}")
                .ToList()
                .First();

            ViewData["Zona"] = _context
                .Zonas
                .FromSqlInterpolated($"procBuscarZona {contacto.IdZona}, {pRetorno}")
                .ToList()
                .First();

            ViewData["Sector"] = _context
                .Sectors
                .FromSqlInterpolated($"procBuscarSector {contacto.IdSector}, {pRetorno}")
                .ToList()
                .First();

            ViewData["TipoContacto"] = _context
                .TipoContactos
                .FromSqlInterpolated($"procBuscarTipoContacto {contacto.TipoContacto}, {pRetorno}")
                .ToList()
                .First();

            ViewData["Estado"] = _context
                .Estados
                .FromSqlInterpolated($"procBuscarEstadoContacto {contacto.Estado}, {pRetorno}")
                .ToList()
                .First();

            return View(contacto);
        }

        // GET: Contacto/Create
        public IActionResult Create()
        {
            IEnumerable<CuentaCliente> objClientes = (IEnumerable<CuentaCliente>)_context
                .CuentaClientes
                .FromSqlInterpolated($"procSelectCuentaCliente")
                .ToList();

            foreach (CuentaCliente cuenta in objClientes)
            {
                cuenta.CedulaClienteNavigation = _context
                .Clientes
                .FromSqlInterpolated($"procBuscarCliente {cuenta.CedulaCliente}, {5}")
                .ToList()
                .First();
            }

            ViewData["CedulaCliente"] = objClientes;

            ViewData["CedulaUsuario"] = (IEnumerable<Usuario>) _context
                .Usuarios
                .FromSqlInterpolated($"procSelectUsuario")
                .ToList();

            IEnumerable<Direccion> objDir = (IEnumerable<Direccion>)_context
                .Direccions
                .FromSqlInterpolated($"procSelectDireccion")
                .ToList();

            foreach (Direccion dir in objDir)
            {
                dir.IdProvinciaNavigation = _context
                .Provincia
                .FromSqlInterpolated($"procBuscarProvincia {dir.IdProvincia}, {5}")
                .ToList()
                .First();

                dir.IdCantonNavigation = _context
                    .Cantons
                    .FromSqlInterpolated($"procBuscarCanton {dir.IdCanton}, {5}")
                    .ToList()
                    .First();

                dir.IdDistritoNavigation = _context
                    .Distritos
                    .FromSqlInterpolated($"procBuscarDistrito {dir.IdDistrito}, {5}")
                    .ToList()
                    .First();
            }

            ViewData["Direccion"] = objDir;
            ViewData["Estado"] = (IEnumerable<Estado>) _context
                .Estados
                .FromSqlInterpolated($"procSelectEstadoContacto")
                .ToList();
            ViewData["IdSector"] = (IEnumerable<Sector>) _context
                .Sectors
                .FromSqlInterpolated($"procSelectSector")
                .ToList();
            ViewData["IdZona"] = (IEnumerable<Zona>) _context
                .Zonas
                .FromSqlInterpolated($"procSelectZona")
                .ToList();
            ViewData["TipoContacto"] = (IEnumerable<TipoContacto>) _context
                .TipoContactos
                .FromSqlInterpolated($"procSelectTipoContacto")
                .ToList();
            ViewData["exito"] = 0;

            return View();
        }

        /// <summary>
        /// Metodo que permite registrar un nuevo contacto.
        /// </summary>
        /// <param name="contacto"></param>
        /// <returns>Vista Index si el contacto fue registrado con éxito</returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,CedulaCliente,CedulaUsuario,TipoContacto,Motivo,Nombre,Telefono,CorreoElectronico,Estado,Direccion,Descripcion,IdZona,IdSector")] Contacto contacto)
        {
            //ejecutar procedimiento almacenado de crear contacto
            //@id INT,
            SqlParameter pId = new SqlParameter
            {
                ParameterName = "@id",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Id
            };
            //@cedula_cliente VARCHAR(30),
            SqlParameter pCliente = new SqlParameter
            {
                ParameterName = "@cedula_cliente",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.CedulaCliente
            };
            //@cedula_usuario VARCHAR(30),
            SqlParameter pUsuario = new SqlParameter
            {
                ParameterName = "@cedula_usuario",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.CedulaUsuario
            };
            //@tipo_contacto INT,
            SqlParameter pTipoContacto = new SqlParameter
            {
                ParameterName = "@tipo_contacto",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.TipoContacto
            };
            //@motivo VARCHAR(30),
            SqlParameter pMotivo = new SqlParameter
            {
                ParameterName = "@motivo",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Motivo
            };
            //@nombre VARCHAR(30),
            SqlParameter pNombre = new SqlParameter
            {
                ParameterName = "@nombre",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Nombre
            };
            //@telefono VARCHAR(255),
            SqlParameter pTelefono = new SqlParameter
            {
                ParameterName = "@telefono",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 255,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Telefono
            };
            //@correo_electronico VARCHAR(30),
            SqlParameter pEmail = new SqlParameter
            {
                ParameterName = "@correo_electronico",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 30,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.CorreoElectronico
            };
            //@estado INT,
            SqlParameter pEstado = new SqlParameter
            {
                ParameterName = "@estado",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Estado
            };
            //@direccion INT,
            SqlParameter pDireccion = new SqlParameter
            {
                ParameterName = "@direccion",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Direccion
            };
            //@descripcion VARCHAR(50),
            SqlParameter pDescripcion = new SqlParameter
            {
                ParameterName = "@descripcion",
                SqlDbType = System.Data.SqlDbType.VarChar,
                Size = 50,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.Descripcion
            };
            //@id_zona INT,
            SqlParameter pZona = new SqlParameter
            {
                ParameterName = "@id_zona",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.IdZona
            };
            //@id_sector INT,
            SqlParameter pSector = new SqlParameter
            {
                ParameterName = "@id_sector",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Input,
                Value = contacto.IdSector
            };
            //@ret int OUTPUT
            var pRetorno = new SqlParameter
            {
                ParameterName = "ret",
                SqlDbType = System.Data.SqlDbType.Int,
                Direction = System.Data.ParameterDirection.Output,
            };

            //Ejecucion de procedimiento almacenado
            var sql = "EXECUTE procInsertarContacto @id, @cedula_cliente, @cedula_usuario, @tipo_contacto, @motivo, @nombre, @telefono, @correo_electronico, @estado, @direccion, @descripcion, @id_zona, @id_sector, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pId, pCliente, pUsuario, pTipoContacto, pMotivo, pNombre, pTelefono, pEmail, pEstado, pDireccion, pDescripcion, pZona, pSector, pRetorno);
            int retorno = (int)pRetorno.Value;

            if (retorno == -1)
            {

                ViewData["CedulaCliente"] = (IEnumerable<Cliente>)_context
                    .Clientes
                    .FromSqlInterpolated($"procSelectCliente")
                    .ToList();
                ViewData["CedulaUsuario"] = (IEnumerable<Usuario>)_context
                    .Usuarios
                    .FromSqlInterpolated($"procSelectUsuario")
                    .ToList();
                ViewData["Direccion"] = (IEnumerable<Direccion>)_context
                    .Direccions
                    .FromSqlInterpolated($"procSelectDireccion")
                    .ToList();
                ViewData["Estado"] = (IEnumerable<Estado>)_context
                    .Estados
                    .FromSqlInterpolated($"procSelectEstadoContacto")
                    .ToList();
                ViewData["IdSector"] = (IEnumerable<Sector>)_context
                    .Sectors
                    .FromSqlInterpolated($"procSelectSector")
                    .ToList();
                ViewData["IdZona"] = (IEnumerable<Zona>)_context
                    .Zonas
                    .FromSqlInterpolated($"procSelectZona")
                    .ToList();
                ViewData["TipoContacto"] = (IEnumerable<TipoContacto>)_context
                    .TipoContactos
                    .FromSqlInterpolated($"procSelectTipoContacto")
                    .ToList();
                ViewData["exito"] = -1;
                //Debug.WriteLine("Answer: " + answer);
                return View("Create", contacto);
            }
            else
                return RedirectToAction(nameof(Index));
        }

        /// <summary>
        /// Método que permite acceder a la vista para elimnar un contacto.
        /// </summary>
        /// <param name="id"></param>
        /// <returns>La vist Delete de contacto.</returns>
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
            var contacto = _context
                .Contactos
                .FromSqlInterpolated($"procBuscarContacto {pId}, {pRetorno}")
                .ToList()
                .First();

            ViewData["usuario"] = _context
                .Usuarios
                .FromSqlInterpolated($"procBuscarUsuario {contacto.CedulaUsuario}, {pRetorno}")
                .ToList()
                .First();

            ViewData["cliente"] = _context
                .Clientes
                .FromSqlInterpolated($"procBuscarCliente {contacto.CedulaCliente}, {pRetorno}")
                .ToList()
                .First();

            Direccion dir = _context
                .Direccions
                .FromSqlInterpolated($"procBuscarDireccion {contacto.Direccion}, {pRetorno}")
                .ToList()
                .First();

            ViewData["provincia"] = _context
                .Provincia
                .FromSqlInterpolated($"procBuscarProvincia {dir.IdProvincia}, {pRetorno}")
                .ToList()
                .First();

            ViewData["canton"] = _context
                .Cantons
                .FromSqlInterpolated($"procBuscarCanton {dir.IdCanton}, {pRetorno}")
                .ToList()
                .First();

            ViewData["distrito"] = _context
                .Distritos
                .FromSqlInterpolated($"procBuscarDistrito {dir.IdDistrito}, {pRetorno}")
                .ToList()
                .First();

            ViewData["Zona"] = _context
                .Zonas
                .FromSqlInterpolated($"procBuscarZona {contacto.IdZona}, {pRetorno}")
                .ToList()
                .First();

            ViewData["Sector"] = _context
                .Sectors
                .FromSqlInterpolated($"procBuscarSector {contacto.IdSector}, {pRetorno}")
                .ToList()
                .First();

            ViewData["TipoContacto"] = _context
                .TipoContactos
                .FromSqlInterpolated($"procBuscarTipoContacto {contacto.TipoContacto}, {pRetorno}")
                .ToList()
                .First();

            ViewData["Estado"] = _context
                .Estados
                .FromSqlInterpolated($"procBuscarEstadoContacto {contacto.Estado}, {pRetorno}")
                .ToList()
                .First();

            return View(contacto);
        }

        /// <summary>
        /// Metodo que permite eliminar un contacto
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> procEliminarContacto(int id)
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
            var sql = "EXECUTE procEliminarContacto @id, @ret OUT";
            _ = _context.Database.ExecuteSqlRaw(sql, pId, pRetorno);
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

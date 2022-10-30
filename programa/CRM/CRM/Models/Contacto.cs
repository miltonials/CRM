using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Contacto
    {
        public Contacto()
        {
            Cotizacions = new HashSet<Cotizacion>();
            IdActividads = new HashSet<Actividad>();
            IdTareas = new HashSet<Tarea>();
        }

        public int Id { get; set; }
        public string CedulaCliente { get; set; } = null!;
        public string? CedulaUsuario { get; set; }
        public int? TipoContacto { get; set; }
        public string? Motivo { get; set; }
        public string? Nombre { get; set; }
        public string? Telefono { get; set; }
        public string? CorreoElectronico { get; set; }
        public int? Estado { get; set; }
        public int? Direccion { get; set; }
        public string? Descripcion { get; set; }
        public int? IdZona { get; set; }
        public int? IdSector { get; set; }

        public virtual CuentaCliente CedulaCliente1 { get; set; } = null!;
        public virtual Cliente CedulaClienteNavigation { get; set; } = null!;
        public virtual Usuario? CedulaUsuarioNavigation { get; set; }
        public virtual Direccion? DireccionNavigation { get; set; }
        public virtual Estado? EstadoNavigation { get; set; }
        public virtual Sector? IdSectorNavigation { get; set; }
        public virtual Zona? IdZonaNavigation { get; set; }
        public virtual TipoContacto? TipoContactoNavigation { get; set; }
        public virtual ICollection<Cotizacion> Cotizacions { get; set; }

        public virtual ICollection<Actividad> IdActividads { get; set; }
        public virtual ICollection<Tarea> IdTareas { get; set; }
    }
}

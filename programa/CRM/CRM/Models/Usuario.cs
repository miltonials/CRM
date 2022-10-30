using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            Casos = new HashSet<Caso>();
            Contactos = new HashSet<Contacto>();
            Cotizacions = new HashSet<Cotizacion>();
            IdRols = new HashSet<Rol>();
        }

        public string Cedula { get; set; } = null!;
        public string Clave { get; set; } = null!;
        public string Nombre { get; set; } = null!;
        public string Apellido1 { get; set; } = null!;
        public string Apellido2 { get; set; } = null!;
        public string IdDepartamento { get; set; } = null!;

        public virtual Departamento IdDepartamentoNavigation { get; set; } = null!;
        public virtual ICollection<Caso> Casos { get; set; }
        public virtual ICollection<Contacto> Contactos { get; set; }
        public virtual ICollection<Cotizacion> Cotizacions { get; set; }

        public virtual ICollection<Rol> IdRols { get; set; }
    }
}

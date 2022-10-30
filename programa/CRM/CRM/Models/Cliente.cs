using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Cliente
    {
        public string Cedula { get; set; } = null!;
        public string Telefono { get; set; } = null!;
        public string Celular { get; set; } = null!;
        public string Nombre { get; set; } = null!;
        public string Apellido1 { get; set; } = null!;
        public string Apellido2 { get; set; } = null!;

        public virtual Contacto? Contacto { get; set; }
        public virtual CuentaCliente? CuentaCliente { get; set; }
    }
}

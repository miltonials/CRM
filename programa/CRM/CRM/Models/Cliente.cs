using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CRM.Models
{
    public partial class Cliente
    {
        [Required]
        public string Cedula { get; set; } = null!;
        [Required]
        public string Telefono { get; set; } = null!;
        [Required]
        public string Celular { get; set; } = null!;
        [Required]
        public string Nombre { get; set; } = null!;
        [Required]
        public string Apellido1 { get; set; } = null!;
        [Required]
        public string Apellido2 { get; set; } = null!;

        public virtual Contacto? Contacto { get; set; }
        public virtual CuentaCliente? CuentaCliente { get; set; }
    }
}

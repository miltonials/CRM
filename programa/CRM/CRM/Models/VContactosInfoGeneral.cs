using System;
using System.ComponentModel.DataAnnotations;

namespace CRM.Models
{
    public partial class VContactosInfoGeneral
    {
        public int Id { get; set; }

        [Display(Name = "Cédula del cliente")]
        public string CedulaCliente { get; set; } = null!;
        public string Cliente { get; set; } = null!;
        public string Asesor { get; set; } = null!;
        public string Tipo { get; set; } = null!;
        public string? Motivo { get; set; }

        [Display(Name = "Nombre del contacto específico")]
        public string? NombreContactoEspecifico { get; set; }

        [Display(Name = "Teléfono del contacto específico")]
        public string? TelefonoContactoEspecifico { get; set; }

        [Display(Name = "Correo electrónico")]
        public string? CorreoElectronico { get; set; }
        public string? Estado { get; set; }
        public string? Direccion { get; set; }
        public string? Descripcion { get; set; }
        public string? Zona { get; set; }
        public string? Sector { get; set; }
    }
}

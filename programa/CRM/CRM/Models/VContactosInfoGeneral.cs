using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class VContactosInfoGeneral
    {
        public int Id { get; set; }
        public string CedulaCliente { get; set; } = null!;
        public string Cliente { get; set; } = null!;
        public string Asesor { get; set; } = null!;
        public string Tipo { get; set; } = null!;
        public string? Motivo { get; set; }
        public string? NombreContactoEspecifico { get; set; }
        public string? TelefonoContactoEspecifico { get; set; }
        public string? CorreoElectronico { get; set; }
        public string? Estado { get; set; }
        public string? Direccion { get; set; }
        public string? Descripcion { get; set; }
        public string? Zona { get; set; }
        public string? Sector { get; set; }
    }
}

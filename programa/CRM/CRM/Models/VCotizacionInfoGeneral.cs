using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class VCotizacionInfoGeneral
    {
        public int NumeroCotizacion { get; set; }
        public int? IdFactura { get; set; }
        public int? IdContacto { get; set; }
        public string? Tipo { get; set; }
        public string? NombreOportunidad { get; set; }
        public string? FechaCotizacion { get; set; }
        public string NombreCuenta { get; set; } = null!;
        public DateTime? FechaProyeccionCierre { get; set; }
        public DateTime? FechaCierre { get; set; }
        public string? OrdenCompra { get; set; }
        public string? Descripcion { get; set; }
        public string? Zona { get; set; }
        public string? Sector { get; set; }
        public string? Nombre { get; set; }
        public string? Etapa { get; set; }
        public string? Asesor { get; set; }
        public short? Probabilidad { get; set; }
        public string? Motivo { get; set; }
        public string? Competidor { get; set; }
    }
}

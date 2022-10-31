using System.ComponentModel.DataAnnotations;

namespace CRM.Models
{
    public partial class VCotizacionInfoGeneral
    {
        [Display(Name = "Número de cotización")]
        public int NumeroCotizacion { get; set; }

        [Display(Name = "Factura")]
        public int? IdFactura { get; set; }

        [Display(Name = "Id de contacto")]
        public int? IdContacto { get; set; }

        [Display(Name = "Tipo de cotización")]
        public string? Tipo { get; set; }

        [Display(Name = "Nombre de la oportunidad")]
        public string? NombreOportunidad { get; set; }

        [Display(Name = "Fecha de cotización")]
        public string? FechaCotizacion { get; set; }

        [Display(Name = "Nombre de la cuenta")]
        public string NombreCuenta { get; set; } = null!;

        [Display(Name = "Fecha proyección de cierre")]
        public DateTime? FechaProyeccionCierre { get; set; }

        [Display(Name = "Fecha de cierre")]
        public DateTime? FechaCierre { get; set; }

        [Display(Name = "Orden de compra")]
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

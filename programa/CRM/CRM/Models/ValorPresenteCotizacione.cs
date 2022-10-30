using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace CRM.Models
{
    [MetadataType(typeof(ValorPresenteCotizacione))]
    public partial class ValorPresenteCotizacione
    {
        [Display(Name = "Número de cottización")]
        public int NumeroCotizacion { get; set; }

        [Display(Name = "Número de contacto")]

        public int NumeroContacto { get; set; }

        [Display(Name = "Nombre de oportunidad")]

        public string NombreOportunidad { get; set; } = null!;

        [Display(Name = "Fecha de cotización")]

        public string FechaCotizacion { get; set; } = null!;

        [Display(Name = "Nombre de la cuenta")]

        public string NombreCuenta { get; set; } = null!;

        [Display(Name = "Valor total de la cotización")]

        public string TotalCotizacion { get; set; } = null!;

        [Display(Name = "Valor presente de la cotización")]
        public string TotalAValorPresente { get; set; } = null!;

        public virtual Cotizacion NumeroCotizacionNavigation { get; set; } = null!;
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CRM.Models
{
    public partial class Cotizacion
    {
        public Cotizacion()
        {
            ProductoCotizacions = new HashSet<ProductoCotizacion>();
            IdActividads = new HashSet<Actividad>();
            IdTareas = new HashSet<Tarea>();
        }

        [Display(Name = "Número de cotización")]
        public int NumeroCotizacion { get; set; }
        [Display(Name = "Factura")]
        public int? IdFactura { get; set; }
        public int? IdContacto { get; set; }

        [Display(Name = "Tipo de cotización")]
        public string? Tipo { get; set; }

        [Display(Name = "Nombre de oportunida")]
        public string? NombreOportunidad { get; set; }

        [Display(Name = "Fecha de la cotización")]
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
        
        [Display(Name = "Zona")]
        public int? IdZona { get; set; }
        
        [Display(Name = "Sector")]
        public int? IdSector { get; set; }
        
        [Display(Name = "Moneda")]
        public int? IdMoneda { get; set; }
        
        [Display(Name = "Etapa")]
        public string? IdEtapa { get; set; }
        
        [Display(Name = "Asesor")]
        public string? IdAsesor { get; set; }
        
        public short? Probabilidad { get; set; }
        
        [Display(Name = "Motivo de denegacion")]
        public string? MotivoDenegacion { get; set; }
        
        [Display(Name = "Competidor")]
        public string? IdCompetidor { get; set; }

        [Display(Name = "Asesor")]
        public virtual Usuario? IdAsesorNavigation { get; set; }

        [Display(Name = "Competidor")]
        public virtual Competidor? IdCompetidorNavigation { get; set; }

        [Display(Name = "Contacto")]
        public virtual Contacto? IdContactoNavigation { get; set; }
        
        [Display(Name = "Etapa")]
        public virtual Etapa? IdEtapaNavigation { get; set; }
        
        [Display(Name = "Moneda")]
        public virtual Monedum? IdMonedaNavigation { get; set; }
        
        [Display(Name = "Sector")]
        public virtual Sector? IdSectorNavigation { get; set; }
        
        [Display(Name = "Zona")]
        public virtual Zona? IdZonaNavigation { get; set; }

        [Display(Name = "Motivo de denegación")]
        public virtual Motivo? MotivoDenegacionNavigation { get; set; }

        [Display(Name = "Cuenta cliente")]
        public virtual CuentaCliente NombreCuentaNavigation { get; set; } = null!;

        [Display(Name = "Probabilidad")]
        public virtual Probabilidad? ProbabilidadNavigation { get; set; }

        [Display(Name = "Ejecuciónes")]
        public virtual Ejecucion? EjecucionNombreCuentaNavigation { get; set; }

        public virtual Ejecucion? EjecucionNumeroCotizacionNavigation { get; set; }

        public virtual ValorPresenteCotizacione? ValorPresenteCotizacione { get; set; }

        [Display(Name = "Cotizaciones")]
        public virtual ICollection<ProductoCotizacion> ProductoCotizacions { get; set; }

        [Display(Name = "Actividades")]

        public virtual ICollection<Actividad> IdActividads { get; set; }

        [Display(Name = "Competidor")]
        public virtual ICollection<Tarea> IdTareas { get; set; }
    }
}

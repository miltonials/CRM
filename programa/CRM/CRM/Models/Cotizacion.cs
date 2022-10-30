using System;
using System.Collections.Generic;

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
        public int? IdZona { get; set; }
        public int? IdSector { get; set; }
        public int? IdMoneda { get; set; }
        public string? IdEtapa { get; set; }
        public string? IdAsesor { get; set; }
        public short? Probabilidad { get; set; }
        public string? MotivoDenegacion { get; set; }
        public string? IdCompetidor { get; set; }

        public virtual Usuario? IdAsesorNavigation { get; set; }
        public virtual Competidor? IdCompetidorNavigation { get; set; }
        public virtual Contacto? IdContactoNavigation { get; set; }
        public virtual Etapa? IdEtapaNavigation { get; set; }
        public virtual Monedum? IdMonedaNavigation { get; set; }
        public virtual Sector? IdSectorNavigation { get; set; }
        public virtual Zona? IdZonaNavigation { get; set; }
        public virtual Motivo? MotivoDenegacionNavigation { get; set; }
        public virtual CuentaCliente NombreCuentaNavigation { get; set; } = null!;
        public virtual Probabilidad? ProbabilidadNavigation { get; set; }
        public virtual Ejecucion? EjecucionNombreCuentaNavigation { get; set; }
        public virtual Ejecucion? EjecucionNumeroCotizacionNavigation { get; set; }
        public virtual ValorPresenteCotizacione? ValorPresenteCotizacione { get; set; }
        public virtual ICollection<ProductoCotizacion> ProductoCotizacions { get; set; }

        public virtual ICollection<Actividad> IdActividads { get; set; }
        public virtual ICollection<Tarea> IdTareas { get; set; }
    }
}

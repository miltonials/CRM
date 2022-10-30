using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Ejecucion
    {
        public Ejecucion()
        {
            CasoNombreCuentaNavigations = new HashSet<Caso>();
            CasoProyectoAsociadoNavigations = new HashSet<Caso>();
            IdActividads = new HashSet<Actividad>();
            IdTareas = new HashSet<Tarea>();
        }

        public int Id { get; set; }
        public int? NumeroCotizacion { get; set; }
        public string? Asesor { get; set; }
        public DateTime? FechaEjecucion { get; set; }
        public string NombreCuenta { get; set; } = null!;
        public string? NombreEjecucion { get; set; }
        public string? PropietarioEjecucion { get; set; }
        public int? AñoProyectadoCierre { get; set; }
        public int? MesProyectadoCierre { get; set; }
        public DateTime? FechaCierre { get; set; }
        public string? IdDepartamento { get; set; }

        public virtual Departamento? IdDepartamentoNavigation { get; set; }
        public virtual Cotizacion NombreCuentaNavigation { get; set; } = null!;
        public virtual Cotizacion? NumeroCotizacionNavigation { get; set; }
        public virtual ICollection<Caso> CasoNombreCuentaNavigations { get; set; }
        public virtual ICollection<Caso> CasoProyectoAsociadoNavigations { get; set; }

        public virtual ICollection<Actividad> IdActividads { get; set; }
        public virtual ICollection<Tarea> IdTareas { get; set; }
    }
}

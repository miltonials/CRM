using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Actividad
    {
        public Actividad()
        {
            IdCasos = new HashSet<Caso>();
            IdContactos = new HashSet<Contacto>();
            IdCotizacions = new HashSet<Cotizacion>();
            IdEjecucions = new HashSet<Ejecucion>();
        }

        public int Id { get; set; }
        public string? Descripcion { get; set; }
        public DateTime? FechaFinalizacion { get; set; }

        public virtual ICollection<Caso> IdCasos { get; set; }
        public virtual ICollection<Contacto> IdContactos { get; set; }
        public virtual ICollection<Cotizacion> IdCotizacions { get; set; }
        public virtual ICollection<Ejecucion> IdEjecucions { get; set; }
    }
}

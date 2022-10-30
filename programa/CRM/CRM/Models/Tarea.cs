using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Tarea
    {
        public Tarea()
        {
            IdCasos = new HashSet<Caso>();
            IdContactos = new HashSet<Contacto>();
            IdCotizacions = new HashSet<Cotizacion>();
            IdEjecucions = new HashSet<Ejecucion>();
        }

        public int Id { get; set; }
        public DateTime? FechaFinalizacion { get; set; }
        public DateTime? FechaCreacion { get; set; }
        public int? Estado { get; set; }
        public string? Descripcion { get; set; }

        public virtual EstadoTarea? EstadoNavigation { get; set; }

        public virtual ICollection<Caso> IdCasos { get; set; }
        public virtual ICollection<Contacto> IdContactos { get; set; }
        public virtual ICollection<Cotizacion> IdCotizacions { get; set; }
        public virtual ICollection<Ejecucion> IdEjecucions { get; set; }
    }
}

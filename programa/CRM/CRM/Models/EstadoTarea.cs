using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class EstadoTarea
    {
        public EstadoTarea()
        {
            Tareas = new HashSet<Tarea>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; } = null!;

        public virtual ICollection<Tarea> Tareas { get; set; }
    }
}

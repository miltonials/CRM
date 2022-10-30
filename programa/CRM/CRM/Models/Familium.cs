using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Familium
    {
        public Familium()
        {
            Productos = new HashSet<Producto>();
        }

        public int Codigo { get; set; }
        public string? Nombre { get; set; }
        public int? Estado { get; set; }
        public string? Descripcion { get; set; }

        public virtual EstadoFamilium? EstadoNavigation { get; set; }
        public virtual ICollection<Producto> Productos { get; set; }
    }
}

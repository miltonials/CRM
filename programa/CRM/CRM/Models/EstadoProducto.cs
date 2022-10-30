using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class EstadoProducto
    {
        public EstadoProducto()
        {
            Productos = new HashSet<Producto>();
        }

        public int Id { get; set; }
        public string? Estado { get; set; }

        public virtual ICollection<Producto> Productos { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Producto
    {
        public Producto()
        {
            ProductoCotizacions = new HashSet<ProductoCotizacion>();
        }

        public int Codigo { get; set; }
        public int CodigoFamilia { get; set; }
        public string? Nombre { get; set; }
        public double? PrecioEstandar { get; set; }
        public int? Estado { get; set; }
        public string? Descripcion { get; set; }

        public virtual Familium CodigoFamiliaNavigation { get; set; } = null!;
        public virtual EstadoProducto? EstadoNavigation { get; set; }
        public virtual ICollection<ProductoCotizacion> ProductoCotizacions { get; set; }
    }
}

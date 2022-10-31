using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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
        [Display(Name = "Precio estandar")]
        public double? PrecioEstandar { get; set; }
        public int? Estado { get; set; }
        public string? Descripcion { get; set; }

        [Display(Name = "Familia")]
        public virtual Familium CodigoFamiliaNavigation { get; set; } = null!;

        [Display(Name = "Estado")]
        public virtual EstadoProducto? EstadoNavigation { get; set; }
        public virtual ICollection<ProductoCotizacion> ProductoCotizacions { get; set; }
    }
}

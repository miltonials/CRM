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

        [Required]
        public int Codigo { get; set; }

        [Required]
        public int CodigoFamilia { get; set; }

        [Required]
        public string? Nombre { get; set; }

        [Required]
        [Display(Name = "Precio estandar")]
        public double? PrecioEstandar { get; set; }

        [Required]
        public int? Estado { get; set; }

        [Required]
        public string? Descripcion { get; set; }

        [Required]

        [Display(Name = "Familia")]
        public virtual Familium CodigoFamiliaNavigation { get; set; } = null!;

        [Display(Name = "Estado")]
        public virtual EstadoProducto? EstadoNavigation { get; set; }
        public virtual ICollection<ProductoCotizacion> ProductoCotizacions { get; set; }
    }
}

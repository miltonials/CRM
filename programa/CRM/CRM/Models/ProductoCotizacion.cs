using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class ProductoCotizacion
    {
        public int CodigoProducto { get; set; }
        public int NumeroCotizacion { get; set; }
        public double? PrecioNegociado { get; set; }
        public int? Cantidad { get; set; }

        public virtual Producto CodigoProductoNavigation { get; set; } = null!;
        public virtual Cotizacion NumeroCotizacionNavigation { get; set; } = null!;
    }
}

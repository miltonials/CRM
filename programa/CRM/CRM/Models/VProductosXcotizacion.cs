using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class VProductosXcotizacion
    {
        public int NumeroCotizacion { get; set; }
        public int Codigo { get; set; }
        public string Familia { get; set; } = null!;
        public string Nombre { get; set; } = null!;
        public double? PrecioEstandar { get; set; }
        public string? Estado { get; set; }
        public string Descripcion { get; set; } = null!;
        public int? Cantidad { get; set; }
    }
}

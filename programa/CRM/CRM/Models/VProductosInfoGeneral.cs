using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class VProductosInfoGeneral
    {
        public int Codigo { get; set; }
        public string? Familia { get; set; }
        public string? Nombre { get; set; }
        public double? PrecioEstandar { get; set; }
        public string? Estado { get; set; }
        public string? Descripcion { get; set; }
    }
}

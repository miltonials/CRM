using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Probabilidad
    {
        public Probabilidad()
        {
            Cotizacions = new HashSet<Cotizacion>();
        }

        public short Porcentaje { get; set; }

        public virtual ICollection<Cotizacion> Cotizacions { get; set; }
    }
}

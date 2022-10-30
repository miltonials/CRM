using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Competidor
    {
        public Competidor()
        {
            Cotizacions = new HashSet<Cotizacion>();
        }

        public string Nombre { get; set; } = null!;

        public virtual ICollection<Cotizacion> Cotizacions { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Motivo
    {
        public Motivo()
        {
            Cotizacions = new HashSet<Cotizacion>();
        }

        public string Id { get; set; } = null!;
        public string? Descripcion { get; set; }

        public virtual ICollection<Cotizacion> Cotizacions { get; set; }
    }
}

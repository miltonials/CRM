using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Prioridad
    {
        public Prioridad()
        {
            Casos = new HashSet<Caso>();
        }

        public string Id { get; set; } = null!;
        public string? Prioridad1 { get; set; }

        public virtual ICollection<Caso> Casos { get; set; }
    }
}

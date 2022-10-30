using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class EstadoCaso
    {
        public EstadoCaso()
        {
            Casos = new HashSet<Caso>();
        }

        public string Id { get; set; } = null!;
        public string? Estado { get; set; }

        public virtual ICollection<Caso> Casos { get; set; }
    }
}

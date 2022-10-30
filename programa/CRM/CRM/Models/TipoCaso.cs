using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class TipoCaso
    {
        public TipoCaso()
        {
            Casos = new HashSet<Caso>();
        }

        public string Id { get; set; } = null!;
        public string? Tipo { get; set; }

        public virtual ICollection<Caso> Casos { get; set; }
    }
}

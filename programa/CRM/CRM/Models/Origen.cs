using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Origen
    {
        public Origen()
        {
            Casos = new HashSet<Caso>();
        }

        public string Id { get; set; } = null!;
        public string? Origen1 { get; set; }

        public virtual ICollection<Caso> Casos { get; set; }
    }
}

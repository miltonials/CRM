using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class EstadoFamilium
    {
        public EstadoFamilium()
        {
            Familia = new HashSet<Familium>();
        }

        public int Id { get; set; }
        public string? Estado { get; set; }

        public virtual ICollection<Familium> Familia { get; set; }
    }
}

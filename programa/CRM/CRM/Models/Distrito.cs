using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Distrito
    {
        public Distrito()
        {
            Direccions = new HashSet<Direccion>();
        }

        public int Id { get; set; }
        public string? Nombre { get; set; }

        public virtual ICollection<Direccion> Direccions { get; set; }
    }
}

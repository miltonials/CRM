using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Estado
    {
        public Estado()
        {
            Contactos = new HashSet<Contacto>();
        }

        public int Id { get; set; }
        public string? Nombre { get; set; }

        public virtual ICollection<Contacto> Contactos { get; set; }
    }
}

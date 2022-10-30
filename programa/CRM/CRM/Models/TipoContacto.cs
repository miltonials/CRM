using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class TipoContacto
    {
        public TipoContacto()
        {
            Contactos = new HashSet<Contacto>();
        }

        public int Id { get; set; }
        public string Tipo { get; set; } = null!;

        public virtual ICollection<Contacto> Contactos { get; set; }
    }
}

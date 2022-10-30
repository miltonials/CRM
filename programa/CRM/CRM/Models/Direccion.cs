using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Direccion
    {
        public Direccion()
        {
            Casos = new HashSet<Caso>();
            Contactos = new HashSet<Contacto>();
        }

        public int Id { get; set; }
        public int? IdProvincia { get; set; }
        public int? IdCanton { get; set; }
        public int? IdDistrito { get; set; }

        public virtual Canton? IdCantonNavigation { get; set; }
        public virtual Distrito? IdDistritoNavigation { get; set; }
        public virtual Provincium? IdProvinciaNavigation { get; set; }
        public virtual ICollection<Caso> Casos { get; set; }
        public virtual ICollection<Contacto> Contactos { get; set; }
    }
}

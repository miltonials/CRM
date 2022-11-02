using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

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

        [Display(Name = "Cantón")]
        public virtual Canton? IdCantonNavigation { get; set; }
        [Display(Name = "Distrito")]
        public virtual Distrito? IdDistritoNavigation { get; set; }
        [Display(Name = "Provincia")]
        public virtual Provincium? IdProvinciaNavigation { get; set; }
        public virtual ICollection<Caso> Casos { get; set; }
        public virtual ICollection<Contacto> Contactos { get; set; }
    }
}

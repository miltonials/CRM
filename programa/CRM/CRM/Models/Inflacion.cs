using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace CRM.Models
{
    public partial class Inflacion
    {
        [Display(Name = "Año")]
        [Required(ErrorMessage = "Debe ingresar un año")]
        public int Anno { get; set; }
        
        [Display(Name = "Porcentaje de Inflación")]
        [Required(ErrorMessage = "Es obligatorio registrar el porcentaje de inflación")]
        public double? Porcentaje { get; set; }
    }
}

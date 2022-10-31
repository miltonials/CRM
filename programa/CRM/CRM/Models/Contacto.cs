﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Xml.Linq;

namespace CRM.Models
{
    public partial class Contacto
    {
        public Contacto()
        {
            Cotizacions = new HashSet<Cotizacion>();
            IdActividads = new HashSet<Actividad>();
            IdTareas = new HashSet<Tarea>();
        }

        public int Id { get; set; }

        [Display(Name = "Cédula del cliente")]
        public string CedulaCliente { get; set; } = null!;

        [Display(Name = "Cédula del asesor")]
        public string? CedulaUsuario { get; set; }

        [Display(Name = "Tipo de contacto")]
        public int? TipoContacto { get; set; }
        public string? Motivo { get; set; }
        public string? Nombre { get; set; }
        public string? Telefono { get; set; }
        
        [Display(Name = "Correo electrónico")]
        public string? CorreoElectronico { get; set; }
        public int? Estado { get; set; }
        public int? Direccion { get; set; }
        public string? Descripcion { get; set; }
        public int? IdZona { get; set; }
        public int? IdSector { get; set; }

        [Display(Name = "Cédula del cliente")]
        public virtual CuentaCliente CedulaCliente1 { get; set; } = null!;
        public virtual Cliente CedulaClienteNavigation { get; set; } = null!;

        [Display(Name = "Cédula de asesor/a")]
        public virtual Usuario? CedulaUsuarioNavigation { get; set; }


        [Display(Name = "Dirección")]
        public virtual Direccion? DireccionNavigation { get; set; }

        [Display(Name = "Estado")]
        public virtual Estado? EstadoNavigation { get; set; }

        [Display(Name = "Sector")]
        public virtual Sector? IdSectorNavigation { get; set; }

        [Display(Name = "Zona")]
        public virtual Zona? IdZonaNavigation { get; set; }

        [Display(Name = "Tipo de contacto")]
        public virtual TipoContacto? TipoContactoNavigation { get; set; }
        public virtual ICollection<Cotizacion> Cotizacions { get; set; }

        public virtual ICollection<Actividad> IdActividads { get; set; }
        public virtual ICollection<Tarea> IdTareas { get; set; }
    }
}

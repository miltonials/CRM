using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class CuentaCliente
    {
        public int Id { get; set; }
        public string CedulaCliente { get; set; } = null!;
        public string NombreCuenta { get; set; } = null!;
        public int Moneda { get; set; }
        public string ContactoPrincipal { get; set; } = null!;
        public string SitioWeb { get; set; } = null!;
        public string InformacionAdicional { get; set; } = null!;
        public string CorreoElectronico { get; set; } = null!;
        public int? IdZona { get; set; }
        public int? IdSector { get; set; }

        public virtual Cliente CedulaClienteNavigation { get; set; } = null!;
        public virtual Sector? IdSectorNavigation { get; set; }
        public virtual Zona? IdZonaNavigation { get; set; }
        public virtual Monedum MonedaNavigation { get; set; } = null!;
        public virtual Contacto? Contacto { get; set; }
        public virtual Cotizacion? Cotizacion { get; set; }
    }
}

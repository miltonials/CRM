using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Monedum
    {
        public Monedum()
        {
            Cotizacions = new HashSet<Cotizacion>();
            CuentaClientes = new HashSet<CuentaCliente>();
        }

        public int Id { get; set; }
        public string? Nombre { get; set; }

        public virtual ICollection<Cotizacion> Cotizacions { get; set; }
        public virtual ICollection<CuentaCliente> CuentaClientes { get; set; }
    }
}

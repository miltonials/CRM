using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class TipoPrivilegio
    {
        public TipoPrivilegio()
        {
            IdRols = new HashSet<Rol>();
        }

        public int Id { get; set; }
        public string? Tipo { get; set; }

        public virtual ICollection<Rol> IdRols { get; set; }
    }
}

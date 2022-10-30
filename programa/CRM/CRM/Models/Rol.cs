using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Rol
    {
        public Rol()
        {
            CedulaUsuarios = new HashSet<Usuario>();
            IdPrivilegios = new HashSet<TipoPrivilegio>();
        }

        public int Id { get; set; }
        public string Tipo { get; set; } = null!;

        public virtual ICollection<Usuario> CedulaUsuarios { get; set; }
        public virtual ICollection<TipoPrivilegio> IdPrivilegios { get; set; }
    }
}

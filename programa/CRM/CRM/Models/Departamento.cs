using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Departamento
    {
        public Departamento()
        {
            Ejecucions = new HashSet<Ejecucion>();
            Usuarios = new HashSet<Usuario>();
        }

        public string Id { get; set; } = null!;
        public string? Nombre { get; set; }

        public virtual ICollection<Ejecucion> Ejecucions { get; set; }
        public virtual ICollection<Usuario> Usuarios { get; set; }
    }
}

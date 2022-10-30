using System;
using System.Collections.Generic;

namespace CRM.Models
{
    public partial class Caso
    {
        public Caso()
        {
            IdActividads = new HashSet<Actividad>();
            IdTareas = new HashSet<Tarea>();
        }

        public int Id { get; set; }
        public int ProyectoAsociado { get; set; }
        public string PropietarioCaso { get; set; } = null!;
        public string Asunto { get; set; } = null!;
        public string NombreCuenta { get; set; } = null!;
        public string NombreContacto { get; set; } = null!;
        public string Descripcion { get; set; } = null!;
        public int IdDireccion { get; set; }
        public string IdOrigen { get; set; } = null!;
        public string IdEstado { get; set; } = null!;
        public string IdTipo { get; set; } = null!;
        public string IdPrioridad { get; set; } = null!;

        public virtual Direccion IdDireccionNavigation { get; set; } = null!;
        public virtual EstadoCaso IdEstadoNavigation { get; set; } = null!;
        public virtual Origen IdOrigenNavigation { get; set; } = null!;
        public virtual Prioridad IdPrioridadNavigation { get; set; } = null!;
        public virtual TipoCaso IdTipoNavigation { get; set; } = null!;
        public virtual Ejecucion NombreCuentaNavigation { get; set; } = null!;
        public virtual Usuario PropietarioCasoNavigation { get; set; } = null!;
        public virtual Ejecucion ProyectoAsociadoNavigation { get; set; } = null!;

        public virtual ICollection<Actividad> IdActividads { get; set; }
        public virtual ICollection<Tarea> IdTareas { get; set; }
    }
}

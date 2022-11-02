using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace CRM.Models
{
    public partial class CRMContext : DbContext
    {
        public CRMContext()
        {
        }

        public CRMContext(DbContextOptions<CRMContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Actividad> Actividads { get; set; } = null!;
        public virtual DbSet<Canton> Cantons { get; set; } = null!;
        public virtual DbSet<Caso> Casos { get; set; } = null!;
        public virtual DbSet<Cliente> Clientes { get; set; } = null!;
        public virtual DbSet<Competidor> Competidors { get; set; } = null!;
        public virtual DbSet<Contacto> Contactos { get; set; } = null!;
        public virtual DbSet<Cotizacion> Cotizacions { get; set; } = null!;
        public virtual DbSet<CuentaCliente> CuentaClientes { get; set; } = null!;
        public virtual DbSet<Departamento> Departamentos { get; set; } = null!;
        public virtual DbSet<Direccion> Direccions { get; set; } = null!;
        public virtual DbSet<Distrito> Distritos { get; set; } = null!;
        public virtual DbSet<Ejecucion> Ejecucions { get; set; } = null!;
        public virtual DbSet<Estado> Estados { get; set; } = null!;
        public virtual DbSet<EstadoCaso> EstadoCasos { get; set; } = null!;
        public virtual DbSet<EstadoFamilium> EstadoFamilia { get; set; } = null!;
        public virtual DbSet<EstadoProducto> EstadoProductos { get; set; } = null!;
        public virtual DbSet<EstadoTarea> EstadoTareas { get; set; } = null!;
        public virtual DbSet<Etapa> Etapas { get; set; } = null!;
        public virtual DbSet<Familium> Familia { get; set; } = null!;
        public virtual DbSet<Inflacion> Inflacions { get; set; } = null!;
        public virtual DbSet<Monedum> Moneda { get; set; } = null!;
        public virtual DbSet<Motivo> Motivos { get; set; } = null!;
        public virtual DbSet<Origen> Origens { get; set; } = null!;
        public virtual DbSet<Prioridad> Prioridads { get; set; } = null!;
        public virtual DbSet<Probabilidad> Probabilidads { get; set; } = null!;
        public virtual DbSet<Producto> Productos { get; set; } = null!;
        public virtual DbSet<ProductoCotizacion> ProductoCotizacions { get; set; } = null!;
        public virtual DbSet<Provincium> Provincia { get; set; } = null!;
        public virtual DbSet<Rol> Rols { get; set; } = null!;
        public virtual DbSet<Sector> Sectors { get; set; } = null!;
        public virtual DbSet<Tarea> Tareas { get; set; } = null!;
        public virtual DbSet<TipoCaso> TipoCasos { get; set; } = null!;
        public virtual DbSet<TipoContacto> TipoContactos { get; set; } = null!;
        public virtual DbSet<TipoPrivilegio> TipoPrivilegios { get; set; } = null!;
        public virtual DbSet<Usuario> Usuarios { get; set; } = null!;
        public virtual DbSet<VClienteInfoGeneral> VClienteInfoGenerals { get; set; } = null!;
        public virtual DbSet<VContactosInfoGeneral> VContactosInfoGenerals { get; set; } = null!;
        public virtual DbSet<VCotizacionInfoGeneral> VCotizacionInfoGenerals { get; set; } = null!;
        public virtual DbSet<VProductosInfoGeneral> VProductosInfoGenerals { get; set; } = null!;
        public virtual DbSet<ValorPresenteCotizacione> ValorPresenteCotizaciones { get; set; } = null!;
        public virtual DbSet<VProductosXcotizacion> VProductosXcotizacions { get; set; } = null!;
        public virtual DbSet<Zona> Zonas { get; set; } = null!;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Actividad>(entity =>
            {
                entity.ToTable("Actividad");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.FechaFinalizacion)
                    .HasColumnType("date")
                    .HasColumnName("fecha_finalizacion");
            });

            modelBuilder.Entity<Canton>(entity =>
            {
                entity.ToTable("Canton");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Caso>(entity =>
            {
                entity.ToTable("Caso");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Asunto)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("asunto");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.IdDireccion).HasColumnName("id_direccion");

                entity.Property(e => e.IdEstado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_estado");

                entity.Property(e => e.IdOrigen)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_origen");

                entity.Property(e => e.IdPrioridad)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_prioridad");

                entity.Property(e => e.IdTipo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_tipo");

                entity.Property(e => e.NombreContacto)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombreContacto");

                entity.Property(e => e.NombreCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombreCuenta");

                entity.Property(e => e.PropietarioCaso)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("propietarioCaso");

                entity.Property(e => e.ProyectoAsociado).HasColumnName("proyectoAsociado");

                entity.HasOne(d => d.IdDireccionNavigation)
                    .WithMany(p => p.Casos)
                    .HasForeignKey(d => d.IdDireccion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_Direccion");

                entity.HasOne(d => d.IdEstadoNavigation)
                    .WithMany(p => p.Casos)
                    .HasForeignKey(d => d.IdEstado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_EstadoCaso");

                entity.HasOne(d => d.IdOrigenNavigation)
                    .WithMany(p => p.Casos)
                    .HasForeignKey(d => d.IdOrigen)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_Origen");

                entity.HasOne(d => d.IdPrioridadNavigation)
                    .WithMany(p => p.Casos)
                    .HasForeignKey(d => d.IdPrioridad)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_Prioridad");

                entity.HasOne(d => d.IdTipoNavigation)
                    .WithMany(p => p.Casos)
                    .HasForeignKey(d => d.IdTipo)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_TipoCaso");

                entity.HasOne(d => d.NombreCuentaNavigation)
                    .WithMany(p => p.CasoNombreCuentaNavigations)
                    .HasPrincipalKey(p => p.NombreCuenta)
                    .HasForeignKey(d => d.NombreCuenta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_Ejecucion_nombreCuenta");

                entity.HasOne(d => d.PropietarioCasoNavigation)
                    .WithMany(p => p.Casos)
                    .HasForeignKey(d => d.PropietarioCaso)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_Usuario");

                entity.HasOne(d => d.ProyectoAsociadoNavigation)
                    .WithMany(p => p.CasoProyectoAsociadoNavigations)
                    .HasPrincipalKey(p => p.Id)
                    .HasForeignKey(d => d.ProyectoAsociado)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Caso_Ejecucion");

                entity.HasMany(d => d.IdActividads)
                    .WithMany(p => p.IdCasos)
                    .UsingEntity<Dictionary<string, object>>(
                        "CasosActividad",
                        l => l.HasOne<Actividad>().WithMany().HasForeignKey("IdActividad").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_casosActividad_Actividad"),
                        r => r.HasOne<Caso>().WithMany().HasForeignKey("IdCaso").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CasosActividad_Caso"),
                        j =>
                        {
                            j.HasKey("IdCaso", "IdActividad").HasName("PK__CasosAct__EAD2EFF363EAC7B9");

                            j.ToTable("CasosActividad");

                            j.IndexerProperty<int>("IdCaso").HasColumnName("id_caso");

                            j.IndexerProperty<int>("IdActividad").HasColumnName("id_actividad");
                        });

                entity.HasMany(d => d.IdTareas)
                    .WithMany(p => p.IdCasos)
                    .UsingEntity<Dictionary<string, object>>(
                        "CasosTarea",
                        l => l.HasOne<Tarea>().WithMany().HasForeignKey("IdTarea").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CasosTarea_Tarea"),
                        r => r.HasOne<Caso>().WithMany().HasForeignKey("IdCaso").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CasosTarea_Caso"),
                        j =>
                        {
                            j.HasKey("IdCaso", "IdTarea").HasName("PK__CasosTar__AB11140B52F0136B");

                            j.ToTable("CasosTarea");

                            j.IndexerProperty<int>("IdCaso").HasColumnName("id_caso");

                            j.IndexerProperty<int>("IdTarea").HasColumnName("id_tarea");
                        });
            });

            modelBuilder.Entity<Cliente>(entity =>
            {
                entity.HasKey(e => e.Cedula)
                    .HasName("PK__Cliente__415B7BE4A2CC730D");

                entity.ToTable("Cliente");

                entity.HasIndex(e => e.Cedula, "UQ__Cliente__415B7BE59EE005D8")
                    .IsUnique();

                entity.Property(e => e.Cedula)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula");

                entity.Property(e => e.Apellido1)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido1");

                entity.Property(e => e.Apellido2)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido2");

                entity.Property(e => e.Celular)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("celular");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Telefono)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("telefono");
            });

            modelBuilder.Entity<Competidor>(entity =>
            {
                entity.HasKey(e => e.Nombre)
                    .HasName("PK__Competid__72AFBCC78B751D34");

                entity.ToTable("Competidor");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Contacto>(entity =>
            {
                entity.HasKey(e => new { e.Id})
                    .HasName("PK__Contacto__7EBE369A756F6CAD");

                entity.ToTable("Contacto");

                entity.HasIndex(e => e.Id, "UQ__Contacto__3213E83EB2B84A8F")
                    .IsUnique();

                entity.HasIndex(e => e.CedulaCliente, "UQ__Contacto__CADDEA54765DE2EB")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CedulaCliente)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula_cliente");

                entity.Property(e => e.CedulaUsuario)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula_usuario");

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("correo_electronico");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Direccion).HasColumnName("direccion");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.IdSector).HasColumnName("id_sector");

                entity.Property(e => e.IdZona).HasColumnName("id_zona");

                entity.Property(e => e.Motivo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("motivo");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Telefono)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("telefono");

                entity.Property(e => e.TipoContacto).HasColumnName("tipo_contacto");

                entity.HasOne(d => d.CedulaClienteNavigation)
                    .WithOne(p => p.Contacto)
                    .HasForeignKey<Contacto>(d => d.CedulaCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Contacto_Cliente");

                entity.HasOne(d => d.CedulaCliente1)
                    .WithOne(p => p.Contacto)
                    .HasPrincipalKey<CuentaCliente>(p => p.CedulaCliente)
                    .HasForeignKey<Contacto>(d => d.CedulaCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Contacto_CuentaCliente");

                entity.HasOne(d => d.CedulaUsuarioNavigation)
                    .WithMany(p => p.Contactos)
                    .HasForeignKey(d => d.CedulaUsuario)
                    .HasConstraintName("fk_Contacto_Usuario");

                entity.HasOne(d => d.DireccionNavigation)
                    .WithMany(p => p.Contactos)
                    .HasForeignKey(d => d.Direccion)
                    .HasConstraintName("fk_Contacto_Direccion");

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.Contactos)
                    .HasForeignKey(d => d.Estado)
                    .HasConstraintName("fk_Contacto_Estado");

                entity.HasOne(d => d.IdSectorNavigation)
                    .WithMany(p => p.Contactos)
                    .HasForeignKey(d => d.IdSector)
                    .HasConstraintName("fk_Contacto_Sector");

                entity.HasOne(d => d.IdZonaNavigation)
                    .WithMany(p => p.Contactos)
                    .HasForeignKey(d => d.IdZona)
                    .HasConstraintName("fk_Contacto_Zona");

                entity.HasOne(d => d.TipoContactoNavigation)
                    .WithMany(p => p.Contactos)
                    .HasForeignKey(d => d.TipoContacto)
                    .HasConstraintName("fk_Contacto_TipoContacto");

                entity.HasMany(d => d.IdActividads)
                    .WithMany(p => p.IdContactos)
                    .UsingEntity<Dictionary<string, object>>(
                        "ContactoActividad",
                        l => l.HasOne<Actividad>().WithMany().HasForeignKey("IdActividad").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_ContactoActividad_Actividad"),
                        r => r.HasOne<Contacto>().WithMany().HasPrincipalKey("Id").HasForeignKey("IdContacto").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_ContactoActividad_Contacto"),
                        j =>
                        {
                            j.HasKey("IdContacto", "IdActividad").HasName("PK__Contacto__24576630FEFB083E");

                            j.ToTable("ContactoActividad");

                            j.IndexerProperty<int>("IdContacto").HasColumnName("id_contacto");

                            j.IndexerProperty<int>("IdActividad").HasColumnName("id_actividad");
                        });

                entity.HasMany(d => d.IdTareas)
                    .WithMany(p => p.IdContactos)
                    .UsingEntity<Dictionary<string, object>>(
                        "ContactoTarea",
                        l => l.HasOne<Tarea>().WithMany().HasForeignKey("IdTarea").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_ContactoTarea_Tarea"),
                        r => r.HasOne<Contacto>().WithMany().HasPrincipalKey("Id").HasForeignKey("IdContacto").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_ContactoTarea_Contacto"),
                        j =>
                        {
                            j.HasKey("IdContacto", "IdTarea").HasName("PK__Contacto__65949DC88A74DA9F");

                            j.ToTable("ContactoTarea");

                            j.IndexerProperty<int>("IdContacto").HasColumnName("id_contacto");

                            j.IndexerProperty<int>("IdTarea").HasColumnName("id_tarea");
                        });
            });

            modelBuilder.Entity<Cotizacion>(entity =>
            {
                entity.HasKey(e => new { e.NumeroCotizacion, e.NombreCuenta })
                    .HasName("PK__Cotizaci__0857812529D010FA");

                entity.ToTable("Cotizacion");

                entity.HasIndex(e => e.IdFactura, "UQ__Cotizaci__6C08ED5214E42565")
                    .IsUnique();

                entity.HasIndex(e => e.NombreCuenta, "UQ__Cotizaci__7E5CF2B99EA7A7F4")
                    .IsUnique();

                entity.HasIndex(e => e.NumeroCotizacion, "UQ__Cotizaci__9FB24E0F9D410862")
                    .IsUnique();

                entity.Property(e => e.NumeroCotizacion).HasColumnName("numero_cotizacion");

                entity.Property(e => e.NombreCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_cuenta");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.FechaCierre)
                    .HasColumnType("date")
                    .HasColumnName("fecha_cierre");

                entity.Property(e => e.FechaCotizacion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("fecha_cotizacion");

                entity.Property(e => e.FechaProyeccionCierre)
                    .HasColumnType("date")
                    .HasColumnName("fecha_proyeccion_cierre");

                entity.Property(e => e.IdAsesor)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_asesor");

                entity.Property(e => e.IdCompetidor)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_competidor");

                entity.Property(e => e.IdContacto).HasColumnName("id_contacto");

                entity.Property(e => e.IdEtapa)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_etapa");

                entity.Property(e => e.IdFactura).HasColumnName("id_factura");

                entity.Property(e => e.IdMoneda).HasColumnName("id_moneda");

                entity.Property(e => e.IdSector).HasColumnName("id_sector");

                entity.Property(e => e.IdZona).HasColumnName("id_zona");

                entity.Property(e => e.MotivoDenegacion)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("motivo_denegacion");

                entity.Property(e => e.NombreOportunidad)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_oportunidad");

                entity.Property(e => e.OrdenCompra)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("orden_compra");

                entity.Property(e => e.Probabilidad).HasColumnName("probabilidad");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("tipo");

                entity.HasOne(d => d.IdAsesorNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.IdAsesor)
                    .HasConstraintName("fk_Cotizacion_Asesor");

                entity.HasOne(d => d.IdCompetidorNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.IdCompetidor)
                    .HasConstraintName("fk_Cotizacion_Competidor");

                entity.HasOne(d => d.IdContactoNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasPrincipalKey(p => p.Id)
                    .HasForeignKey(d => d.IdContacto)
                    .HasConstraintName("fk_Cotizacion_Contacto");

                entity.HasOne(d => d.IdEtapaNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.IdEtapa)
                    .HasConstraintName("fk_Cotizacion_Etapa");

                entity.HasOne(d => d.IdMonedaNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.IdMoneda)
                    .HasConstraintName("fk_Cotizacion_Moneda");

                entity.HasOne(d => d.IdSectorNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.IdSector)
                    .HasConstraintName("fk_Cotizacion_Sector");

                entity.HasOne(d => d.IdZonaNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.IdZona)
                    .HasConstraintName("fk_Cotizacion_Zona");

                entity.HasOne(d => d.MotivoDenegacionNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.MotivoDenegacion)
                    .HasConstraintName("fk_Cotizacion_Motivo");

                entity.HasOne(d => d.NombreCuentaNavigation)
                    .WithOne(p => p.Cotizacion)
                    .HasPrincipalKey<CuentaCliente>(p => p.NombreCuenta)
                    .HasForeignKey<Cotizacion>(d => d.NombreCuenta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Cotizacion_CuentaCliente");

                entity.HasOne(d => d.ProbabilidadNavigation)
                    .WithMany(p => p.Cotizacions)
                    .HasForeignKey(d => d.Probabilidad)
                    .HasConstraintName("fk_Cotizacion_Probabilidad");

                entity.HasMany(d => d.IdActividads)
                    .WithMany(p => p.IdCotizacions)
                    .UsingEntity<Dictionary<string, object>>(
                        "CotizacionActividad",
                        l => l.HasOne<Actividad>().WithMany().HasForeignKey("IdActividad").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CotizacionActividad_Actividad"),
                        r => r.HasOne<Cotizacion>().WithMany().HasPrincipalKey("NumeroCotizacion").HasForeignKey("IdCotizacion").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CotizacionActividad_Cotizacion"),
                        j =>
                        {
                            j.HasKey("IdCotizacion", "IdActividad").HasName("PK__Cotizaci__BADEE5FCD0E375DD");

                            j.ToTable("CotizacionActividad");

                            j.IndexerProperty<int>("IdCotizacion").HasColumnName("id_cotizacion");

                            j.IndexerProperty<int>("IdActividad").HasColumnName("id_actividad");
                        });

                entity.HasMany(d => d.IdTareas)
                    .WithMany(p => p.IdCotizacions)
                    .UsingEntity<Dictionary<string, object>>(
                        "CotizacionTarea",
                        l => l.HasOne<Tarea>().WithMany().HasForeignKey("IdTarea").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CotizacionTarea_Tarea"),
                        r => r.HasOne<Cotizacion>().WithMany().HasPrincipalKey("NumeroCotizacion").HasForeignKey("IdCotizacion").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_CotizacionTarea_Cotizacion"),
                        j =>
                        {
                            j.HasKey("IdCotizacion", "IdTarea").HasName("PK__Cotizaci__FB1D1E04CB6036A4");

                            j.ToTable("CotizacionTarea");

                            j.IndexerProperty<int>("IdCotizacion").HasColumnName("id_cotizacion");

                            j.IndexerProperty<int>("IdTarea").HasColumnName("id_tarea");
                        });
            });

            modelBuilder.Entity<CuentaCliente>(entity =>
            {
                entity.HasKey(e => new { e.Id, e.CedulaCliente, e.Moneda, e.NombreCuenta })
                    .HasName("PK__CuentaCl__F5BA606FCFD900E9");

                entity.ToTable("CuentaCliente");

                entity.HasIndex(e => e.NombreCuenta, "UQ__CuentaCl__7E5CF2B950CE3D4A")
                    .IsUnique();

                entity.HasIndex(e => e.CedulaCliente, "UQ__CuentaCl__CADDEA544D4977F5")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CedulaCliente)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula_cliente");

                entity.Property(e => e.Moneda).HasColumnName("moneda");

                entity.Property(e => e.NombreCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_cuenta");

                entity.Property(e => e.ContactoPrincipal)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("contacto_principal");

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("correo_electronico");

                entity.Property(e => e.IdSector).HasColumnName("id_sector");

                entity.Property(e => e.IdZona).HasColumnName("id_zona");

                entity.Property(e => e.InformacionAdicional)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("informacion_adicional");

                entity.Property(e => e.SitioWeb)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("sitio_web");

                entity.HasOne(d => d.CedulaClienteNavigation)
                    .WithOne(p => p.CuentaCliente)
                    .HasForeignKey<CuentaCliente>(d => d.CedulaCliente)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_CuentaCliente_Cliente");

                entity.HasOne(d => d.IdSectorNavigation)
                    .WithMany(p => p.CuentaClientes)
                    .HasForeignKey(d => d.IdSector)
                    .HasConstraintName("fk_CuentaCliente_Sector");

                entity.HasOne(d => d.IdZonaNavigation)
                    .WithMany(p => p.CuentaClientes)
                    .HasForeignKey(d => d.IdZona)
                    .HasConstraintName("fk_CuentaCliente_Zona");

                entity.HasOne(d => d.MonedaNavigation)
                    .WithMany(p => p.CuentaClientes)
                    .HasForeignKey(d => d.Moneda)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_CuentaCliente_Moneda");
            });

            modelBuilder.Entity<Departamento>(entity =>
            {
                entity.ToTable("Departamento");

                entity.Property(e => e.Id)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Direccion>(entity =>
            {
                entity.ToTable("Direccion");

                entity.HasIndex(e => e.Id, "UQ__Direccio__3213E83E60A3F8EE")
                    .IsUnique();

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.IdCanton).HasColumnName("id_canton");

                entity.Property(e => e.IdDistrito).HasColumnName("id_distrito");

                entity.Property(e => e.IdProvincia).HasColumnName("id_provincia");

                entity.HasOne(d => d.IdCantonNavigation)
                    .WithMany(p => p.Direccions)
                    .HasForeignKey(d => d.IdCanton)
                    .HasConstraintName("fk_Direccion_Canton");

                entity.HasOne(d => d.IdDistritoNavigation)
                    .WithMany(p => p.Direccions)
                    .HasForeignKey(d => d.IdDistrito)
                    .HasConstraintName("fk_Direccion_Distrito");

                entity.HasOne(d => d.IdProvinciaNavigation)
                    .WithMany(p => p.Direccions)
                    .HasForeignKey(d => d.IdProvincia)
                    .HasConstraintName("fk_Direccion_Provincia");
            });

            modelBuilder.Entity<Distrito>(entity =>
            {
                entity.ToTable("Distrito");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Ejecucion>(entity =>
            {
                entity.HasKey(e => new { e.Id, e.NombreCuenta })
                    .HasName("PK__Ejecucio__8A16C9DA7659E961");

                entity.ToTable("Ejecucion");

                entity.HasIndex(e => e.NumeroCotizacion, "UQ__Ejecucio__2B77500A72EEE1A3")
                    .IsUnique();

                entity.HasIndex(e => e.Id, "UQ__Ejecucio__3213E83E9B24B909")
                    .IsUnique();

                entity.HasIndex(e => e.NombreCuenta, "UQ__Ejecucio__80521E5B71BC415B")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.NombreCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombreCuenta");

                entity.Property(e => e.Asesor)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("asesor");

                entity.Property(e => e.AñoProyectadoCierre).HasColumnName("añoProyectadoCierre");

                entity.Property(e => e.FechaCierre)
                    .HasColumnType("date")
                    .HasColumnName("fechaCierre");

                entity.Property(e => e.FechaEjecucion)
                    .HasColumnType("date")
                    .HasColumnName("fechaEjecucion");

                entity.Property(e => e.IdDepartamento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_departamento");

                entity.Property(e => e.MesProyectadoCierre).HasColumnName("mesProyectadoCierre");

                entity.Property(e => e.NombreEjecucion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombreEjecucion");

                entity.Property(e => e.NumeroCotizacion).HasColumnName("numeroCotizacion");

                entity.Property(e => e.PropietarioEjecucion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("propietarioEjecucion");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Ejecucions)
                    .HasForeignKey(d => d.IdDepartamento)
                    .HasConstraintName("fk_Ejecucion_Departamento");

                entity.HasOne(d => d.NombreCuentaNavigation)
                    .WithOne(p => p.EjecucionNombreCuentaNavigation)
                    .HasPrincipalKey<Cotizacion>(p => p.NombreCuenta)
                    .HasForeignKey<Ejecucion>(d => d.NombreCuenta)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Ejecucion_Cotizacion");

                entity.HasOne(d => d.NumeroCotizacionNavigation)
                    .WithOne(p => p.EjecucionNumeroCotizacionNavigation)
                    .HasPrincipalKey<Cotizacion>(p => p.NumeroCotizacion)
                    .HasForeignKey<Ejecucion>(d => d.NumeroCotizacion)
                    .HasConstraintName("fk_Ejecucion_numeroCotizacion");

                entity.HasMany(d => d.IdActividads)
                    .WithMany(p => p.IdEjecucions)
                    .UsingEntity<Dictionary<string, object>>(
                        "EjecucionActividad",
                        l => l.HasOne<Actividad>().WithMany().HasForeignKey("IdActividad").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_EjecucionActividad_Actividad"),
                        r => r.HasOne<Ejecucion>().WithMany().HasPrincipalKey("Id").HasForeignKey("IdEjecucion").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_EjecucionActividad_Ejecucion"),
                        j =>
                        {
                            j.HasKey("IdEjecucion", "IdActividad").HasName("PK__Ejecucio__83237523526E150E");

                            j.ToTable("EjecucionActividad");

                            j.IndexerProperty<int>("IdEjecucion").HasColumnName("id_ejecucion");

                            j.IndexerProperty<int>("IdActividad").HasColumnName("id_actividad");
                        });

                entity.HasMany(d => d.IdTareas)
                    .WithMany(p => p.IdEjecucions)
                    .UsingEntity<Dictionary<string, object>>(
                        "EjecucionTarea",
                        l => l.HasOne<Tarea>().WithMany().HasForeignKey("IdTarea").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_EjecucionTarea_tarea"),
                        r => r.HasOne<Ejecucion>().WithMany().HasPrincipalKey("Id").HasForeignKey("IdEjecucion").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_EjecucionTarea_Ejecucion"),
                        j =>
                        {
                            j.HasKey("IdEjecucion", "IdTarea").HasName("PK__Ejecucio__C2E08EDBEC79D761");

                            j.ToTable("EjecucionTarea");

                            j.IndexerProperty<int>("IdEjecucion").HasColumnName("id_ejecucion");

                            j.IndexerProperty<int>("IdTarea").HasColumnName("id_tarea");
                        });
            });

            modelBuilder.Entity<Estado>(entity =>
            {
                entity.ToTable("Estado");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<EstadoCaso>(entity =>
            {
                entity.ToTable("EstadoCaso");

                entity.Property(e => e.Id)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("estado");
            });

            modelBuilder.Entity<EstadoFamilium>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("estado");
            });

            modelBuilder.Entity<EstadoProducto>(entity =>
            {
                entity.ToTable("EstadoProducto");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("estado");
            });

            modelBuilder.Entity<EstadoTarea>(entity =>
            {
                entity.ToTable("EstadoTarea");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(45)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Etapa>(entity =>
            {
                entity.HasKey(e => e.Nombre)
                    .HasName("PK__Etapa__72AFBCC724C9C2D1");

                entity.ToTable("Etapa");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Familium>(entity =>
            {
                entity.HasKey(e => e.Codigo)
                    .HasName("PK__Familia__40F9A2072FB5CC4B");

                entity.Property(e => e.Codigo)
                    .ValueGeneratedNever()
                    .HasColumnName("codigo");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.Familia)
                    .HasForeignKey(d => d.Estado)
                    .HasConstraintName("fk_Familia_EstadoFamilia");
            });

            modelBuilder.Entity<Inflacion>(entity =>
            {
                entity.HasKey(e => e.Anno)
                    .HasName("PK__Inflacio__61B2C0DD2A74E4CF");

                entity.ToTable("Inflacion");

                entity.Property(e => e.Anno)
                    .ValueGeneratedNever()
                    .HasColumnName("anno");

                entity.Property(e => e.Porcentaje).HasColumnName("porcentaje");
            });

            modelBuilder.Entity<Monedum>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Motivo>(entity =>
            {
                entity.ToTable("Motivo");

                entity.Property(e => e.Id)
                    .HasMaxLength(10)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");
            });

            modelBuilder.Entity<Origen>(entity =>
            {
                entity.ToTable("Origen");

                entity.Property(e => e.Id)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.Origen1)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("origen");
            });

            modelBuilder.Entity<Prioridad>(entity =>
            {
                entity.ToTable("Prioridad");

                entity.Property(e => e.Id)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.Prioridad1)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("prioridad");
            });

            modelBuilder.Entity<Probabilidad>(entity =>
            {
                entity.HasKey(e => e.Porcentaje)
                    .HasName("PK__Probabil__F36D48B9ACCADC74");

                entity.ToTable("Probabilidad");

                entity.Property(e => e.Porcentaje)
                    .ValueGeneratedNever()
                    .HasColumnName("porcentaje");
            });

            modelBuilder.Entity<Producto>(entity =>
            {
                entity.HasKey(e => new { e.Codigo})
                    .HasName("PK__Producto__15F6490F721B7434");

                entity.ToTable("Producto");

                entity.HasIndex(e => e.Codigo, "UQ__Producto__40F9A206F65DB503")
                    .IsUnique();

                entity.Property(e => e.Codigo).HasColumnName("codigo");

                entity.Property(e => e.CodigoFamilia).HasColumnName("codigo_Familia");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.PrecioEstandar).HasColumnName("precio_estandar");

                entity.HasOne(d => d.CodigoFamiliaNavigation)
                    .WithMany(p => p.Productos)
                    .HasForeignKey(d => d.CodigoFamilia)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Producto_Familia");

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.Productos)
                    .HasForeignKey(d => d.Estado)
                    .HasConstraintName("fk_Producto_EstadoProducto");
            });

            modelBuilder.Entity<ProductoCotizacion>(entity =>
            {
                entity.HasKey(e => new { e.CodigoProducto, e.NumeroCotizacion })
                    .HasName("PK__Producto__E9AA23493DC06231");

                entity.ToTable("ProductoCotizacion");

                entity.Property(e => e.CodigoProducto).HasColumnName("codigo_producto");

                entity.Property(e => e.NumeroCotizacion).HasColumnName("numero_cotizacion");

                entity.Property(e => e.Cantidad).HasColumnName("cantidad");

                entity.Property(e => e.PrecioNegociado).HasColumnName("precio_negociado");

                entity.HasOne(d => d.CodigoProductoNavigation)
                    .WithMany(p => p.ProductoCotizacions)
                    .HasPrincipalKey(p => p.Codigo)
                    .HasForeignKey(d => d.CodigoProducto)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ProductoCotizacion_Producto");

                entity.HasOne(d => d.NumeroCotizacionNavigation)
                    .WithMany(p => p.ProductoCotizacions)
                    .HasPrincipalKey(p => p.NumeroCotizacion)
                    .HasForeignKey(d => d.NumeroCotizacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_ProductoCotizacion_Cotizacion");
            });

            modelBuilder.Entity<Provincium>(entity =>
            {
                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<Rol>(entity =>
            {
                entity.ToTable("Rol");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(15)
                    .IsUnicode(false)
                    .HasColumnName("tipo");

                entity.HasMany(d => d.CedulaUsuarios)
                    .WithMany(p => p.IdRols)
                    .UsingEntity<Dictionary<string, object>>(
                        "UsuarioRole",
                        l => l.HasOne<Usuario>().WithMany().HasForeignKey("CedulaUsuario").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_UsuarioRoles_Usuario"),
                        r => r.HasOne<Rol>().WithMany().HasForeignKey("IdRol").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_UsuarioRoles_Rol"),
                        j =>
                        {
                            j.HasKey("IdRol", "CedulaUsuario").HasName("PK__UsuarioR__85D094499DF10DCD");

                            j.ToTable("UsuarioRoles");

                            j.IndexerProperty<int>("IdRol").HasColumnName("id_rol");

                            j.IndexerProperty<string>("CedulaUsuario").HasMaxLength(30).IsUnicode(false).HasColumnName("cedula_usuario");
                        });

                entity.HasMany(d => d.IdPrivilegios)
                    .WithMany(p => p.IdRols)
                    .UsingEntity<Dictionary<string, object>>(
                        "PrivilegiosXrol",
                        l => l.HasOne<TipoPrivilegio>().WithMany().HasForeignKey("IdPrivilegio").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_privilegiosXrol_TipoPrivilegio"),
                        r => r.HasOne<Rol>().WithMany().HasForeignKey("IdRol").OnDelete(DeleteBehavior.ClientSetNull).HasConstraintName("fk_PrivilegiosXRol_Rol"),
                        j =>
                        {
                            j.HasKey("IdRol", "IdPrivilegio").HasName("PK__Privileg__BD72B6410287F946");

                            j.ToTable("PrivilegiosXrol");

                            j.IndexerProperty<int>("IdRol").HasColumnName("id_rol");

                            j.IndexerProperty<int>("IdPrivilegio").HasColumnName("id_privilegio");
                        });
            });

            modelBuilder.Entity<Sector>(entity =>
            {
                entity.ToTable("Sector");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            modelBuilder.Entity<VProductosXcotizacion>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("VProductosXcotizacion");

                entity.Property(e => e.Codigo).HasColumnName("codigo");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Familia)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.NumeroCotizacion).HasColumnName("numero_cotizacion");

                entity.Property(e => e.PrecioEstandar).HasColumnName("precio_estandar");
            });

            modelBuilder.Entity<Tarea>(entity =>
            {
                entity.ToTable("Tarea");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Estado).HasColumnName("estado");

                entity.Property(e => e.FechaCreacion)
                    .HasColumnType("date")
                    .HasColumnName("fecha_creacion");

                entity.Property(e => e.FechaFinalizacion)
                    .HasColumnType("date")
                    .HasColumnName("fecha_finalizacion");

                entity.HasOne(d => d.EstadoNavigation)
                    .WithMany(p => p.Tareas)
                    .HasForeignKey(d => d.Estado)
                    .HasConstraintName("fk_Tarea_EstadoTarea");
            });

            modelBuilder.Entity<TipoCaso>(entity =>
            {
                entity.ToTable("TipoCaso");

                entity.Property(e => e.Id)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("tipo");
            });

            modelBuilder.Entity<TipoContacto>(entity =>
            {
                entity.ToTable("TipoContacto");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("tipo");
            });

            modelBuilder.Entity<TipoPrivilegio>(entity =>
            {
                entity.ToTable("TipoPrivilegio");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(20)
                    .IsUnicode(false)
                    .HasColumnName("tipo");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.Cedula)
                    .HasName("PK__Usuario__415B7BE4BD6E47FD");

                entity.ToTable("Usuario");

                entity.HasIndex(e => e.Cedula, "UQ__Usuario__415B7BE52934F19B")
                    .IsUnique();

                entity.Property(e => e.Cedula)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula");

                entity.Property(e => e.Apellido1)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido1");

                entity.Property(e => e.Apellido2)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido2");

                entity.Property(e => e.Clave)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("clave");

                entity.Property(e => e.IdDepartamento)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("id_departamento");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.HasOne(d => d.IdDepartamentoNavigation)
                    .WithMany(p => p.Usuarios)
                    .HasForeignKey(d => d.IdDepartamento)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_Usuario_Departamento");
            });

            modelBuilder.Entity<VClienteInfoGeneral>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("vClienteInfoGeneral");

                entity.Property(e => e.Apellido1)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido1");

                entity.Property(e => e.Apellido2)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("apellido2");

                entity.Property(e => e.Cedula)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula");

                entity.Property(e => e.Celular)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("celular");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.Telefono)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("telefono");
            });

            modelBuilder.Entity<VContactosInfoGeneral>(entity =>
            {
                entity.HasKey(e => e.Id);

                entity.ToView("vContactosInfoGeneral");

                entity.Property(e => e.Asesor)
                    .HasMaxLength(92)
                    .IsUnicode(false);

                entity.Property(e => e.CedulaCliente)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("cedula_cliente");

                entity.Property(e => e.Cliente)
                    .HasMaxLength(92)
                    .IsUnicode(false);

                entity.Property(e => e.CorreoElectronico)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("correo_electronico");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Direccion)
                    .HasMaxLength(94)
                    .IsUnicode(false)
                    .HasColumnName("direccion");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("estado");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Motivo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("motivo");

                entity.Property(e => e.NombreContactoEspecifico)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_contacto_especifico");

                entity.Property(e => e.Sector)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("sector");

                entity.Property(e => e.TelefonoContactoEspecifico)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("telefono_contacto_especifico");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("tipo");

                entity.Property(e => e.Zona)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("zona");
            });

            modelBuilder.Entity<VCotizacionInfoGeneral>(entity =>
            {
                entity.HasKey(e => e.NumeroCotizacion);

                entity.ToView("vCotizacionInfoGeneral");

                entity.Property(e => e.Asesor)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("asesor");

                entity.Property(e => e.Competidor)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("competidor");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Etapa)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("etapa");

                entity.Property(e => e.FechaCierre)
                    .HasColumnType("date")
                    .HasColumnName("fecha_cierre");

                entity.Property(e => e.FechaCotizacion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("fecha_cotizacion");

                entity.Property(e => e.FechaProyeccionCierre)
                    .HasColumnType("date")
                    .HasColumnName("fecha_proyeccion_cierre");

                entity.Property(e => e.IdContacto).HasColumnName("id_contacto");

                entity.Property(e => e.IdFactura).HasColumnName("id_factura");

                entity.Property(e => e.Motivo)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("motivo");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.NombreCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_cuenta");

                entity.Property(e => e.NombreOportunidad)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_oportunidad");

                entity.Property(e => e.NumeroCotizacion).HasColumnName("numero_cotizacion");

                entity.Property(e => e.OrdenCompra)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("orden_compra");

                entity.Property(e => e.Probabilidad).HasColumnName("probabilidad");

                entity.Property(e => e.Sector)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("sector");

                entity.Property(e => e.Tipo)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("tipo");

                entity.Property(e => e.Zona)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("zona");
            });

            modelBuilder.Entity<VProductosInfoGeneral>(entity =>
            {
                entity.HasKey(e => e.Codigo);

                entity.ToView("vProductosInfoGeneral");

                entity.Property(e => e.Codigo).HasColumnName("codigo");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("descripcion");

                entity.Property(e => e.Estado)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("estado");

                entity.Property(e => e.Familia)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("familia");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");

                entity.Property(e => e.PrecioEstandar).HasColumnName("precio_estandar");
            });

            modelBuilder.Entity<ValorPresenteCotizacione>(entity =>
            {
                entity.HasKey(e => e.NumeroCotizacion)
                    .HasName("PK__ValorPre__9FB24E0E84B743B5");

                entity.Property(e => e.NumeroCotizacion)
                    .ValueGeneratedNever()
                    .HasColumnName("numero_cotizacion");

                entity.Property(e => e.FechaCotizacion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("fecha_cotizacion");

                entity.Property(e => e.NombreCuenta)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_cuenta");

                entity.Property(e => e.NombreOportunidad)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre_oportunidad");

                entity.Property(e => e.NumeroContacto).HasColumnName("numero_contacto");

                entity.Property(e => e.TotalAValorPresente)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("total_a_valor_presente");

                entity.Property(e => e.TotalCotizacion)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("total_cotizacion");

                entity.HasOne(d => d.NumeroCotizacionNavigation)
                    .WithOne(p => p.ValorPresenteCotizacione)
                    .HasPrincipalKey<Cotizacion>(p => p.NumeroCotizacion)
                    .HasForeignKey<ValorPresenteCotizacione>(d => d.NumeroCotizacion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fk_valorPresente_numeroCotizacion");
            });

            modelBuilder.Entity<Zona>(entity =>
            {
                entity.ToTable("zona");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Nombre)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("nombre");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}

USE CRM
GO

ALTER TABLE Rol DROP CONSTRAINT IF EXISTS chk_tipo_rol

ALTER TABLE Rol ADD CONSTRAINT chk_tipo_rol
CHECK (tipo = 'Edición' OR tipo = 'Visualización' OR tipo = 'Reportería')
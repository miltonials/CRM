USE CRM
GO
ALTER TABLE Inflacion DROP CONSTRAINT IF EXISTS chk_annos

/*
ALTER TABLE Rol ADD CONSTRAINT chk_tipo_rol
CHECK (tipo = 'Edición' OR tipo = 'Visualización' OR tipo = 'Reportería')
*/

ALTER TABLE Inflacion ADD CONSTRAINT chk_annos
CHECK (anno >= 2000 AND anno < YEAR(GETDATE()))
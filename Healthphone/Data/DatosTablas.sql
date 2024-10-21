INSERT INTO Paises (Nombre) 
VALUES ('Costa Rica'), ('Panamá'), ('México');

INSERT INTO Organizacion (Nombre) 
VALUES ('Hospital Buena Vista'), ('Clinicas Por La Paz'), ('Hospital Médicos Unidos'), 
('Hospital La libertad'), ('Clinicas La Prosperidad'), ('Hospital El Progreso');

INSERT INTO Direcciones (idPais, Calle, Numero, Ciudad, Estado, CodigoPostal, Ubicacion) 
VALUES (1, 'La Merced', 'A10', 'Cartago', 'Cartago', '30106', POINT(-73.935242, 40.730610)), 
(1, 'Alajuelita', 'A10', 'San José', 'San José', '30106', POINT(-73.935242, 40.730610));

INSERT INTO Sitios (idOrganizacion, idDireccion, Nombre) 
VALUES (1, 1, 'Hospital Buena Vista parte baja'), (2, 2, 'Clinicas Por La Paz parte baja');

INSERT INTO TipoEscaneo (Nombre) 
VALUES ('Temperatura'), ('Altura'), ('Peso');

INSERT INTO TipoClasificacion (Nombre) 
VALUES ('Verde'), ('Azul'), ('Rojo'), ('Amarillo'), ('Leve'), ('Grave');

INSERT INTO TipoUnidad (Nombre) 
VALUES ('grados'), ('centímetros'), ('metros'), ('gramos'), ('kilogramos');

INSERT INTO TiposStatus (Nombre) 
VALUES ('Activo'), ('Inactivo'), ('Pagado'), ('Pendiente'), ('Cancelado'), ('Suspendido');

INSERT INTO Planes (Nombre, Descripcion, Precio)
VALUES ('Básico', 'Descripción Plan Básico', 100.00),
('Premium', 'Descripción Plan Premium', 300.00);

INSERT INTO Suscripciones (idSitio, idPlan, Activo, idStatus, FechaInicio, FechaFin) 
VALUES (1, 1, 1, 1, '2024-10-10', '2025-10-10'), (2, 2, 1, 1,'2024-10-10', '2024-10-10');

INSERT INTO Plan_TipoEscaneo (idPlan, idTipoEscaneo) 
VALUES (1, 1), (1, 2), (2, 1), (2, 2), (2, 3);

INSERT INTO Reglas (idTipoClasificacion, idPlan, idTipoEscaneo, Value, idTipoUnidad, isActive, FechaCreacion, Operador) 
VALUES (1, 1, 1, 20, 1, TRUE, CURDATE(), '<'), (2, 1, 1, 20, 1, TRUE, CURDATE(), '='), (3, 1, 1, 20, 1, TRUE, CURDATE(), '>'),
(1, 1, 2, 170, 2, TRUE, CURDATE(), '<'), (2, 1, 2, 170, 2, TRUE, CURDATE(), '='), (3, 1, 2, 170, 2, TRUE, CURDATE(), '>'),
(5, 2, 1, 30, 2, TRUE, CURDATE(), '<'), (6, 2, 1, 30, 2, TRUE, CURDATE(), '>'),
(5, 2, 2, 1.7, 3, TRUE, CURDATE(), '<'), (6, 2, 2, 1.7, 3, TRUE, CURDATE(), '>'),
(5, 2, 3, 50, 5, TRUE, CURDATE(), '<'), (6, 2, 3, 50, 5, TRUE, CURDATE(), '>');

-- ----------------------------Creacion del view----------------------------------

CREATE VIEW view_resultados AS
SELECT 
    ROW_NUMBER() OVER () AS id,  -- Genera un ID secuencial para cada fila
    s.nombre AS "Nombre_Sitio",
    o.nombre AS "Nombre_Organizacion",
    tc.nombre AS "Nombre_Tipo_Clasificacion",
    r.idTipoEscaneo AS "ID_Tipo_Escaneo",
    te.nombre AS "Nombre_Tipo_Escaneo",
    r.Value AS "Valor",
    r.Operador AS "Operador",
    tu.nombre AS "Nombre_Tipo_Unidad",
    su.idSuscripciones AS "id_Suscripcion"
FROM 
    Sitios s
JOIN 
    Organizacion o ON s.idOrganizacion = o.idOrganizacion
JOIN 
    Suscripciones su ON s.idSitio = su.idSitio
JOIN 
    Planes p ON su.idPlan = p.idPlanes
JOIN 
    Reglas r ON p.idPlanes = r.idPlan
JOIN 
    TipoClasificacion tc ON r.idTipoClasificacion = tc.idTipoClasificacion
JOIN 
    TipoEscaneo te ON r.idTipoEscaneo = te.idTipoEscaneo
JOIN 
    TipoUnidad tu ON r.idTipoUnidad = tu.idTipoUnidad;

SELECT * FROM view_resultados;
USE proyectov1;

INSERT INTO paises (Nombre) 
VALUES ('Costa Rica'), ('Panamá'), ('México');

INSERT INTO organizacion (Nombre) 
VALUES ('Hospital Buena Vista'), ('Clinicas Por La Paz'), ('Hospital Médicos Unidos'), 
('Hospital La libertad'), ('Clinicas La Prosperidad'), ('Hospital El Progreso');

INSERT INTO direcciones (idPais, Calle, Numero, Ciudad, Estado, CodigoPostal, Ubicacion) 
VALUES (1, 'La Merced', 'A10', 'Cartago', 'Cartago', '30106', POINT(-73.935242, 40.730610)), 
(1, 'Alajuelita', 'A10', 'San José', 'San José', '30106', POINT(-73.935242, 40.730610));

INSERT INTO sitios (idOrganizacion, idDireccion, Nombre) 
VALUES (1, 1, 'Hospital Buena Vista parte baja'), (2, 2, 'Clinicas Por La Paz parte baja');

INSERT INTO tipoescaneo (Nombre) 
VALUES ('Temperatura'), ('Altura'), ('Peso');

INSERT INTO tipoclasificacion (Nombre) 
VALUES ('Verde'), ('Azul'), ('Rojo'), ('Amarillo'), ('Leve'), ('Grave');

INSERT INTO tipounidad (Nombre) 
VALUES ('grados'), ('centímetros'), ('metros'), ('gramos'), ('kilogramos');

INSERT INTO tiposstatus (Nombre) 
VALUES ('Activo'), ('Inactivo'), ('Pagado'), ('Pendiente'), ('Cancelado'), ('Suspendido');

INSERT INTO planes (Nombre, Descripcion, Precio)
VALUES ('Básico', 'Descripción Plan Básico', 100.00),
('Premium', 'Descripción Plan Premium', 300.00);

INSERT INTO suscripciones (idSitio, idPlan, Activo, idStatus) 
VALUES (1, 1, 1, 1), (2, 2, 1, 1);

INSERT INTO Plan_TipoEscaneo (idPlan, idTipoEscaneo) 
VALUES (1, 1), (1, 2), (2, 1), (2, 2), (2, 3);

INSERT INTO reglas (idTipoClasificacion, idPlan, idTipoEscaneo, Value, idTipoUnidad, isActive, FechaCreacion, Operador) 
VALUES (1, 1, 1, 20, 1, TRUE, CURDATE(), '<'), (2, 1, 1, 20, 1, TRUE, CURDATE(), '='), (3, 1, 1, 20, 1, TRUE, CURDATE(), '>'),
(1, 1, 2, 170, 2, TRUE, CURDATE(), '<'), (2, 1, 2, 170, 2, TRUE, CURDATE(), '='), (3, 1, 2, 170, 2, TRUE, CURDATE(), '>'),
(5, 2, 1, 30, 2, TRUE, CURDATE(), '<'), (6, 2, 1, 30, 2, TRUE, CURDATE(), '>'),
(5, 2, 2, 1.7, 3, TRUE, CURDATE(), '<'), (6, 2, 2, 1.7, 3, TRUE, CURDATE(), '>'),
(5, 2, 3, 50, 5, TRUE, CURDATE(), '<'), (6, 2, 3, 50, 5, TRUE, CURDATE(), '>');

-- ----------------------------Creacion del view----------------------------------

CREATE VIEW view_resultados AS
SELECT 
    s.nombre AS "Nombre Sitio",
    o.nombre AS "Nombre Organizacion",
    p.nombre AS "Nombre Plan",
    r.idTipoClasificacion AS "ID Tipo Clasificacion",
    tc.nombre AS "Nombre Tipo Clasificacion",
    r.idTipoEscaneo AS "ID Tipo Escaneo",
    te.nombre AS "Nombre Tipo Escaneo",
    r.Value AS "Valor",
    r.Operador AS "Operador",
    r.idTipoUnidad AS "ID Tipo Unidad",
    tu.nombre AS "Nombre Tipo Unidad"
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





-- --------------------------Otros valores-----------------------
INSERT INTO metodopago (Nombre) 
VALUES ('PayPal'), ('Stripe'), ('MercadoPago'), ('Yappy');

INSERT INTO operarios (Nombre, Contrasena, idStatus) 
VALUES ('Juan Carlos Rojas', '12345678', 1), ('Maria Magdalena Rivas', '12345678', 1), ('Juan Carlos Rojas', '12345678', 1), 
('Juan Carlos Rojas', '12345678', 2),('Juan Carlos Rojas', '12345678', 2), ('Juan Carlos Rojas', '12345678', 2);

INSERT INTO tipocontacto (Nombre) 
VALUES ('Telefono'), ('Correo'), ('Fax'), ('Redes Sociales');

INSERT INTO informacioncontacto (idTipoContacto, idContacto, TipoEntidad, Valor) 
VALUES (1, 1, 'Organizacion', '12345678'),  (2, 1, 'Organizacion', 'correo@gmail.com'),  (1, 2, 'Organizacion', '12345678')
,  (2, 2, 'Organizacion', 'correo@gmail.com'),  (1, 1, 'Operario', '12345678'),  (2, 1, 'Operario', 'correo@gmail.com')
,  (1, 2, 'Operario', '12345678'),  (2, 2, 'Operario', 'correo@gmail.com');
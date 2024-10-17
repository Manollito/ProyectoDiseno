USE proyectov1;

INSERT INTO paises (Nombre) 
VALUES ('Costa Rica'), ('Panamá'), ('México');

INSERT INTO organizacion (Nombre, Contrasena) 
VALUES ('Hospital Buena Vista', '12345678'), ('Clinicas Por La Paz', '12345678'), ('Hospital Médicos Unidos', '12345678'), 
('Hospital La libertad', '12345678'), ('Clinicas La Prosperidad', '12345678'), ('Hospital El Progreso', '12345678');

INSERT INTO metodopago (Nombre) 
VALUES ('PayPal'), ('Stripe'), ('MercadoPago'), ('Yappy');

INSERT INTO operarios (Nombre, Contrasena, idStatus) 
VALUES ('Juan Carlos Rojas', '12345678', 1), ('Maria Magdalena Rivas', '12345678', 1), ('Juan Carlos Rojas', '12345678', 1), 
('Juan Carlos Rojas', '12345678', 2),('Juan Carlos Rojas', '12345678', 2), ('Juan Carlos Rojas', '12345678', 2);

INSERT INTO tiposstatus (Nombre) 
VALUES ('Activo'), ('Inactivo'), ('Pagado'), ('Pendiente'), ('Cancelado'), ('Suspendido');

INSERT INTO tipounidad (Nombre) 
VALUES ('grados'), ('centímetros'), ('metos'), ('gramos'), ('kilogramos');

INSERT INTO tipooperacion (Nombre) 
VALUES ('Creado'), ('Modificado'), ('Eliminado');

INSERT INTO tipoescaneo (Nombre, idTipoUnidad) 
VALUES ('Temperatura', 1), ('Altura', 2), ('Peso', 5);

INSERT INTO tipocontacto (Nombre) 
VALUES ('Telefono'), ('Correo'), ('Fax'), ('Redes Sociales');

INSERT INTO tipoclasificacion (Nombre) 
VALUES ('Verde'), ('Azul'), ('Rojo'), ('Amarillo'), ('Leve'), ('Grave');

INSERT INTO planes (Nombre, Descripcion, Precio, Disponibilidad, CantidadEscaneos, Activo) 
VALUES ('Básico', 'Descripción Plan Básico', 100.00, 50, 1000, TRUE), 
('Medio', 'Descripción Plan Medio', 200.00, 100, 2000, TRUE),
('Premium', 'Descripción Plan Premium', 300.00, 150, 3000, TRUE),
('Personalizado 1', 'Descripción Plan Personalizado 1', 300.00, 150, 3000, FALSE);

INSERT INTO informacioncontacto (idTipoContacto, idContacto, TipoEntidad, Valor) 
VALUES (1, 1, 'Organizacion', '12345678'),  (2, 1, 'Organizacion', 'correo@gmail.com'),  (1, 2, 'Organizacion', '12345678')
,  (2, 2, 'Organizacion', 'correo@gmail.com'),  (1, 1, 'Operario', '12345678'),  (2, 1, 'Operario', 'correo@gmail.com')
,  (1, 2, 'Operario', '12345678'),  (2, 2, 'Operario', 'correo@gmail.com');

INSERT INTO planes (idPais, Calle, Numero, Ciudad, Estado, CodigoPostal) 
VALUES (1, 'La Paz', '300', 'Cartago', 'Tejar', '30106'), (2, 'La Mora', '100', 'Panamá', 'Panamá', '30106'),
(3, 'La Mexicana', '200', 'México', 'México', '30106'), (1, 'La Guaria', '300', 'Cartago', 'Tejar', '30106'),
(1, 'La Monarca', '300', 'Cartago', 'Tejar', '30106');

INSERT INTO suscripciones (Nombre) 
VALUES ('Verde'), ('Azul');
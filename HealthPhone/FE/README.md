# Ideas implementadas

## Boiler implementado
El diseño del Boiler es importante para tener estructurado el proyecto, en éste caso, se sigue la siguiente estructura.

![img.png](img.png)

Como base, tenemos un sistema estructurado siguiendo el Diagrama final del proyecto.

Se sigue la estructura entonces de:

* **gradle**:
* **src**: Contiene todo el código fuente de fuerza mayor, importante a la hora de hacer el deploy de la aplicación, así como hacer
los testeos de ésta.
* **src/main**: Carpeta que contiene el contenido importante a hacer deploy de la aplicación, acá se contiene el código fuente principal,
y a tomar en consideración a la hora de generar la aplicación
* **src/test**: Carpeta encargada de hacer servicio de testing y pruebas previamente antes de sacar la versión final de la aplicación.
Contiene las pruebas.

## Diseño de la aplicación
Inicialmente, tendremos una página de Login, que tendrá ID de organización o correo, y una contraseña como tal. También incluirá un botón para login, y un botón para ir a la pantalla de Registro.

En la pantalla de Registro, tendremos la solicitud de datos, primero se solicitará los datos de registro, como nombre del Centro médico, País, contraseña, y una sección con los métodos de subscripciones a mostrar.



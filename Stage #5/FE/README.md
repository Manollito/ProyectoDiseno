# Ideas implementadas

## Diseño de la aplicación

### Página Login

### Página de Registro / Subscripción

### Página de uso de cámara para extracción de datos

### Página de display de resultados

## Boiler implementado
El diseño del Boiler es importante para tener estructurado el proyecto, en éste caso, se sigue la siguiente estructura.

![img.png](src/main/resources/imgBoilerplate.png)

Como base, tenemos un sistema estructurado siguiendo el Diagrama final del proyecto.

Se sigue la estructura entonces de:

* **gradle**: Contenido importante de la aplicación para la ejecución y propiedades del sistema
* **src**: Contiene todo el código fuente de fuerza mayor, importante a la hora de hacer el deploy de la aplicación, así como hacer
los testeos de ésta.
* **src/main**: Carpeta que contiene el contenido importante a hacer deploy de la aplicación, acá se contiene el código fuente principal,
y a tomar en consideración a la hora de generar la aplicación
* **src/test**: Carpeta encargada de hacer servicio de testing y pruebas previamente antes de sacar la versión final de la aplicación.
Contiene las pruebas.
* **src/main/kotlin/auth**: Sección encargada de la conexión con AWS Cognito, para autenticación y autorización de usuarios
* **src/main/kotlin/models**: Sección con las clases dentro del sistema a usar para el manejo de datos, y que también funcionarán como
mapeado del programa a los datos de la Base.
* **src/main/kotlin/network**: Sección encargada de todas las conexiones necesarias entre la aplicación y el Rest API de Django.
* **src/main/kotlin/Main.kt**: Por ahora, función o código principal de la aplicación, que será modificado, pero que funciona como
el main o la página inicial.
* **src/main/resources**: Recursos locales, como imágenes para ésta documentación.

## Diseño de la aplicación
Inicialmente, tendremos una página de Login, que tendrá ID de organización o correo, y una contraseña como tal. También incluirá un botón para login, y un botón para ir a la pantalla de Registro.

En la pantalla de Registro, tendremos la solicitud de datos, primero se solicitará los datos de registro, como nombre del Centro médico, País, contraseña, y una sección con los métodos de subscripciones a mostrar.



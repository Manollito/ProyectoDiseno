# Requerimientos no Funcionales

## Rendimiento

1. Se estima que el proceso de escaneo y visualización de los resultados en general dure aproximadamente unos 15 segundos como mínimo y como máximo unos 20 segundos.
2. El sistema tendrá la capacidad de soportar 500 usuarios concurrentes como máximo
3. El principal es para en caso de caída, el sistema debe de tardar a lo sumo 1 minuto para recuperarse, además que debe evitar el uso de más del 80% de los recursos del dispositivo, con el fin de evitar que el sistema se relentice. 

## Escalabilidad

4. Los datos que se irán acumulando por un mes, luego de eso serán eliminados de la base de datos, ya que la información solo sirve como análisis preliminar y no es relevante.
5. El sistema debe de ser capaz de manejar más de 100 solicitudes por segundo, además que la cantidad de datos referentes a las consultas, deben de ser eliminadas las más antiguas después de un mes, con el fin de liberar espacio.

## Fiabilidad

6. El sistema debe de estar funcionando un 99.9% del tiempo, por lo que al año se estima que debe fallar unos 10 minutos en total.
7. El sistema solo cuando termina de realizar el análisis de los pacientes, es cuando integrará a la base de datos dicha información, evitando así fragmentar a la misma y asegurando así la integridad de los datos.
8. En sí la información de la cual hay que tener cierto cuidado es con la que la IA consulta para poder realizar las categorizaciones de los pacientes, así que cada vez que se añade información que la IA debe procesar para entrenarse, debe existir un respaldo por si se necesitaría volver a entrar a la IA.

## Disponibilidad

9. El sistema debería estar funcionando el 99.9% del tiempo como mínimo, así que prácticamente debería de estar en su mayoría del tiempo activa. 
10. El sistema debería estar disponible sin falta principalmente en la parte de la consulta de la IA, ya que esta debe analizar los datos capturados al momento para así poder analizarlos.

## Seguridad

11. Ya que se tratan de datos totalmente personales, la seguridad radica en evitar almacenar datos personales ya que son confidenciales y puede ocasionar problemas al almacenarlos y que, por error, algunos de estos sean revelados. Los únicos datos que serán almacenados serán la de los centros médicos, ya que dichos datos contienen el modelo de la IA y suscripción que poseen.
12. Se hará uso de Cognito para la autorización y autentificación de usuarios por medio de tokens a la hora de iniciar sesión. Esto evitará que otra persona o centros médicos se hagan pasar por otro y obtengan acceso de manera ilegal.
13. El principal requisito es que, el encargado de registrar el centro médico no ande revelando su usuario y contraseña a otras personas, también evitar ingresar a sitios indebidos o conectar dispositivos externos al sistema, ya que estos puede provocar que un virus infecte su dispositivo y acceda al sistema y obtenga su usuario y contraseña, dándole así acceso al software.

## Usabilidad

14. Los estándares planeados a seguir son los siguientes:
- Orientados al Proceso: Dedicados principalmente a buscar la efectividad, eficiencia y satisfacción del usuario. Como tal, la aplicación se planea hacer sencilla de utilizar, es en la parte de efectividad y eficiencia donde se espera que la detección de datos por medio de la cámara brille, así como un claro manejo de control de errores y facilitación del trabajo.
- Orientados al Producto: Se espera que la interfaz de usuario sea fácil de interpretar, práctica a la hora de aprender y operar, así como atractiva y cómoda. Ésto para facilitar el uso de la aplicación a la hora de implementar el sistema de cámara, así como a la hora de mostrar los datos por la pantalla.
15. En caso de tratamiento con personas con discapacidad, casi siempre se verá ésto involucrado con la pantalla específica que muestra los datos, y es claro que pueden existir ciertos pacientes que tengan ciertas discapacidades visuales, es por eso que se toma en cuenta.
- Interfaz de Usuario Accesible: Uso de tamaños de fuente grandes y botones con suficiente espacio facilitará el uso para personas con problemas de visión. Así como el uso de colores contrastantes, para facilitar a la población con daltonismo.
- Instrucciones claras y guiadas: El proceso de medición y la integración, o el cómo se usa el programa en general, y en especial en el lado de administración, debe de ser claro, y de ser posible descrito mediante instrucciones visuales para ayudar a los usuarios.
16. Para el cómo usarlo, se tiene en mano un manual de usuario bien descriptivo, así como documentación técnica para el usuario con rol de administrador.

## Mantenibilidad

17. Se planea que el sistema sea fácil de controlar y dar mantenimiento, así como el control de errores, de modo que se pueda controlar y solucionar problemas de forma sencilla en el sistema cada vez que haya un cambio o actualización.
18. Para el control de logging y monitoreo del sistema, así como rastrear las métricas de rendimiento, se pueden usar distintas herramientas, en éste caso, se planea usar AWS Cloud Watch, para rastrear datos como el uso de CPU, memoria y tráfico, así como checar por registro de eventos.
19. Se planea usar Git para el control de versiones, asegurando que todas las documentaciones al sistema queden documentadas y puedan ser revertidas de ser necesario. Mientras que para el despliegue y manejo de versiones, se planea usar GitLab CI/CD, que permitirá integrar entregas continuas de nuevas versiones del sistema o producto de forma segura.

## Interoperabilidad

20. El sistema deberá integrarse con los sistemas de centros médicos para enviarles los resultados obtenidos de la evaluación médica de los pacientes
21. Se seguirán los estándares ISO/IEEE 11073 y FHIR (Fast Healthcare Interoperability Resources):

## Cumplimiento

22. El sistema debe cumplir con el requisito de respaldar los datos de los usuarios, asegurando un robusto sistema de seguridad con el fin de evitar que su información sea expuesta. Además de ello, el sistema no tiene permitido almacenar información acerca de los pacientes, ya que violaría su privacidad de datos.
23. Sí, principalmente los regidos por el Reglamento General de Protección de Datos (RGPD). Dentro del mismo están los siguientes pasos que se deberían seguir con el fin de garantizar la integridad de los datos:
- Las soluciones de gestión de identidad y acceso (IAM).
- Medidas de autenticación, como el single sign-on (SSO) y la autenticación multifactor (MFA).

## Extensibilidad

24. Las mejoras se verían en dos partes, en la estructural y la técnica. En el caso de la estructural, las futuras mejoras podrían presentarse la creación de mejores cámaras que permitan realizar los análisis de manera más eficiente, en la técnica consistiría en mejorar el entrenamiento de la IA, con casos más específicos para que esta pueda realizar un análisis preliminar más acertado.
25. Como tal escalabilidad en casos futuros se planearía en el manejo de datos, con la idea de generar informes de manera automática a los centros médicos sobre los datos posibles. Otro punto en la escalabilidad sería en la implementación de una IA extra, que permita facilitar la instalación de la ubicación del teléfono y la pantalla con los datos con base al enfoque de la cámara basado en el lugar que enfoque. Por último, también orientado en el punto de calibración, sería un sistema de notificaciones para notificar casos de descalibración del teléfono, ya dado por quizás un movimiento brusco del teléfono encargado de tomar los datos.

## Localización

26. Se implementará una traducción precisa de todos los contenidos, permitiendo cambios dinámicos de idioma, para que el usuario pueda elegir el idioma de su preferencia.
27. El sistema debe utilizar bibliotecas de internacionalización (i18n) que automaticen la conversión de formatos de fecha, hora y moneda según la configuración regional del usuario. Esto asegura que los datos se presenten en el formato más comprensible y familiar para el usuario. Por ejemplo, las fechas deben ser presentadas en el formato "DD/MM/YYYY" para regiones que usan ese formato y "MM/DD/YYYY" para otras, además de manejar conversiones de divisas si es necesario.

## Documentación

28. Se requerirá un manual de usuario para el uso normal y cotidiano, por el lado de los administradores se les brindará un manual de guía de administración del sistema, y para los programadores se tendrá un documento de diseño técnico , conteniendo las arquitecturas usadas, diagramas de componente, y detalles de los módulos usados, tanto en la parte del FrontEnd como el BackEnd.
29. Por el método de control de documentación para actualizarla y en mantenimiento, podría usarse Confluence, pues es bastante práctica para control de documentación, además de ser compatible con Jira, permite organizar la documentación de forma jerárquica, tiene características como historial de versiones y, por si fuera poco, también permite ver quiénes hacen los cambios y revertir a antiguas versiones. Por último, sus características de colaboración son muy efectivas para trabajar en grupos y mantener los datos como tal.

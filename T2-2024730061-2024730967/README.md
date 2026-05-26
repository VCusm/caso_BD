# Tarea\_2\_BD

Integrantes: Valeria Cid, Benjamín Leiva
Roles: 202473006-1, 202473096-7

### Instrucciones
* Tener descargado XAMPP
* Mover esta carpeta (T2-2024730061-2024730967) a xampp/htdocs
* Meter los sqls tablas, poblamiento, y view en el SQL, en ese orden.
* Iniciar los servicios Apache y MySQL de xampp (por lo general se inician solos al acceder a localhost, pero si no se inician, hacer esto)
* Acceder a http://localhost/T2-2024730061-2024730967/php/Index.php
* Acceder como Responsable Académico, Evaluador, o Administrador. En caso de ser Responsable Académico o Evaluador, deberás acceder con un nombre que esté dentro de la BDD (ej. Carlos Soto, Pedro Godoy para Responsable Académico, o Laura Shigihara), en caso de ser Administrador, cualquier nombre es válido, ya que no se especifica bien quién es admin. No se requiere contraseña.
* Acceder como administrador, el usuario admin con contraseña admin123.
### Notas y supuestos
* Se crearon dos tablas, EvaluadorCT y AdministradorCT. En la primera se registran los nombres que pueden acceder a Evaluador, solo puede ser modificada por aquellos que se encuentran registrados en AdministradorCT.
* Se considera que el Responsable académico es el **jefe de carrera** que postula
* Los 2 roles a los que tienen acceso a la barra de búsqueda son el responsable académico y el evaluador.
* Las carpetas css y js son archivos compilados de bootstrap (documentación: https://getbootstrap.com/?hl=es-ES)
* Php version: 
    * PHP 8.2.12 (cli) (built: Oct 24 2023 21:15:15) (ZTS Visual C++ 2019 x64)
    * Copyright (c) The PHP Group
    * Zend Engine v4.2.12, Copyright (c) Zend Technologies
* XAMPP version: v3.3.0 [ Compiled: Apr 6th 2021 ]
* Dentro de las carpetas php, se agregaron las carpetas Includes y Scripts para más modularidad. En los Includes están los segmentos de código HTML que se pueden reutilizar, y en Scripts van clases con funciones con procesos definidos.
* Como en nuestra BDD poblamos los datos con el nombre y apellido del postulante y evaluador, y no nombre completo, al consultar la BDD por nombre, solo se requiere nombre y apellido. Los admins son validados con cualquier nombre, ya que son independientes de nuestra BDD.
* El botón "crear postulación" está disponible para el Responsable Académico y Evaluador solamente.

### Prevención contra SQL injection
* Nuestro proyecto presenta variables como `:name` dentro de queries, para que los inputs de usuario sean tratados estrictamente como datos, y no SQL ejecutable, por ejemplo:
```php 
$stmt = $pdo->prepare($query);
$stmt->execute([[':name'] => $_SESSION['username']]);
```
* Los mensajes de error muestran mensajes genéricos para no mostrarle al atacante la estructura interna de la base de datos

## Postuladores, evaluadores y administradores disponibles
<table>
    <thead>
        <th> </th><th>Postulador</th><th>Evaluador</th><th>Admin</th>
    </thead>
    <tr>
        <td><b>Nombres</b></td><td>Carlos Soto</td><td>Benito Juarez</td><td>admin</td>
    <tr>
    <tr>
        <td></td><td>Rodrigo peña</td><td>Martín Gonzales</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td>Alan Brito</td><td>Daniel San Martín</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td>George Fan</td><td>Luz Rojas</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td>Karen Plankton</td><td>Laura Shigihara</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td>Saki Fujita</td><td>Larry Langosta</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td>Pedro Godoy</td><td>Luka Megurine</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td>Sigmund Freud</td><td>Grace Hopper</td><td></td><tr>
    <tr>
    <tr>
        <td></td><td></td><td>Jean-Martin Charcot</td><td></td><tr>
    <tr>
        <tr>
        <td><b>Contraseña</b></td><td></td><td></td><td>admin123</td><tr>
    <tr>

</table>
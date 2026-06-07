# Caso\_BD

Integrantes: Valeria Cid, Benjamín Leiva
Roles: 202473006-1, 202473096-7
###  Instrucciones
#### Respaldo
* Tener XAMPP descargado, con Apache y MySQL corriendo (por lo general se inician solos al acceder a localhost, pero si no se inician, hacer esto)
* Abrir phpMyAdmin
* Ir a la base de datos ct_usm_postulaciones
* Abrir pestaña import y seleccionar el archivo ct_usm_postulaciones.sql de la carpeta BD
* Desactivar la casilla de revisión de claves foraneas
* Presionar el botón continuar

#### Parámetros de conexión
* Host: localhost o 127.0.0.1
* Puerto: 3306
* Usuario: root

### Notas y supuestos

* Se considera que el Responsable académico es el **jefe de carrera** que postula, el evaluador CT es el **coordinador**
* XAMPP version: v3.3.0 [ Compiled: Apr 6th 2021 ]
* El atributo presupuesto de PostulacionIniciativaCT es un float con 2 dígitos decimales
* Los títulos originales de las tablas pueden ser cambiados, pero la estructura es la misma

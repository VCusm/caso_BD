<?php 
require_once 'Scripts/Conectar-BD.php'; // Incluye el archivo de conexión a la base de datos
session_start();
?>
<!DOCTYPE html>
<html>
<head>
    <title>Responsable Académico</title>
    <?php require 'Includes/Configs-head.php'; ?>
</head>
<body class="bg-dark">
    <div class="text-center p-4 bg-secondary">
        <h1>Responsable Académico</h1>
     </div>
    <?php require 'Includes/Msg-bienvenida.php'; ?>
    <?php require 'Includes/Barra-busqueda.php'; ?>
    <!-- Mis postulaciones -->
    <div class="container mt-5">
        <h2>Listado General</h2>
        <p>Aquí se mostrarán las iniciativas a las que el responsable académico ha postulado.</p>
        <?php require 'Scripts/Listar-postulaciones.php'; ?>
     </div>
    <!-- Botón de crear postulación -->
    <div class="container text-center mt-4">
        <a href="Crear-postulacion.php" class="btn btn-secondary pt-2 pb-2 px-4">Crear postulación</a>
     </div>
    <!-- Botón de volver a login-->
    <div class="container text-center my-4">
        <a href="./Login.php" class="btn btn-secondary pt-2 pb-2 px-4">Volver al Login</a>
     </div>
</body>
</html>
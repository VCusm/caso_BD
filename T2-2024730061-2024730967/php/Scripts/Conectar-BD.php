<?php
$host = 'localhost';
$dbname = 'ct_usm_postulaciones';
$username = 'root';
$password = '';

$pdo = null;
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e) {
    // Mostrar error y detener la ejecución para evitar referencias a un PDO no existente
    echo "<p style='color: red;'>Error de conexión a la base de datos: " . htmlspecialchars($e->getMessage()) . "</p>";
    exit;
}
?>
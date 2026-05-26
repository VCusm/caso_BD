<?php
require_once 'Conectar-BD.php';

if($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../Evaluador-CT-USM.php');
    exit;
}

$pk = isset($_POST['PKpostulacionCT']) ? intval($_POST['PKpostulacionCT']) : 0;
$newEstado = isset($_POST['idEstadoPostulacion']) ? intval($_POST['idEstadoPostulacion']) : 0;

if($pk <= 0 || $newEstado <= 0) {
    header('Location: ../Evaluador-CT-USM.php');
    exit;
}

try {
    $stmt = $pdo->prepare('UPDATE PostulacionIniciativaCT SET idEstadoPostulacion = :idEstado WHERE PKpostulacionCT = :pk');
    $stmt->execute([':idEstado' => $newEstado, ':pk' => $pk]);
    // Redirigir de vuelta al evaluador con mensaje opcional
    header('Location: ../Evaluador-CT-USM.php');
    exit;
}
catch(PDOException $e) {
    echo "Error al actualizar el estado: " . $e->getMessage();
}
?>
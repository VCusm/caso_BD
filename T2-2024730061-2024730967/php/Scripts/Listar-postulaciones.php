<?php
if($_SESSION['rol'] === 'Responsable académico') 
    $query = "SELECT * FROM vw_postulaciones_detalle WHERE Postulante = :name";
else if($_SESSION['rol'] === 'Evaluador') 
    $query = "SELECT * FROM vw_postulaciones_detalle WHERE Evaluador = :name";

try {
    $stmt = $pdo->prepare($query);
    $stmt->execute([':name' => $_SESSION['username']]);
    $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if ($rows && count($rows) > 0) {
        echo '<div class="table-responsive"><table class="table table-striped"><thead><tr>';
        foreach (array_keys($rows[0]) as $col) {
            echo '<th>' . htmlspecialchars($col) . '</th>';
        }
        echo '</tr></thead><tbody>';
        foreach ($rows as $row) {
            echo '<tr>';
            foreach ($row as $val) {
                echo '<td>' . htmlspecialchars($val) . '</td>';
            }
            echo '</tr>';
        }
        echo '</tbody></table></div>';
    } else {
        echo '<p>No hay postulaciones para mostrar.</p>';
    }
} catch (PDOException $e) {
    echo '<p>Error al obtener datos: ' . htmlspecialchars($e->getMessage()) . '</p>';
}
?>
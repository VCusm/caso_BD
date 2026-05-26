<?php 

session_start();
$roleClass = '';
if(!empty($_SESSION['rol'])){
  $roleClass = ' role-' . strtolower(str_replace(' ', '-', $_SESSION['rol']));
}

require_once 'Scripts/Conectar-BD.php'; // Incluye el archivo de conexión a la base de datos
?>
<!DOCTYPE html>
<html>
<head>
    <title>Evaluador CT-USM</title>
    <?php require 'Includes/Configs-head.php'; ?>
</head>
<body class="bg-dark text-light<?php echo $roleClass; ?>" data-role="<?php echo htmlspecialchars($_SESSION['rol'] ?? ''); ?>">
    <div class="text-center p-4 bg-secondary">
        <h1>Evaluador CT-USM</h1>
     </div>
    <?php require 'Includes/Msg-bienvenida.php'; ?>
    <?php require 'Includes/Barra-busqueda.php'; ?>
    <div class="container my-4">
        <?php
        // Obtener término de búsqueda (si viene desde la barra)
        $filtro = '';
        if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['nom_iniciativa'])) {
            $filtro = trim($_POST['nom_iniciativa']);
        }

        try {
            // Consulta para listar postulaciones con estado y datos relevantes
            $sql = "SELECT pi.id AS idPostulacionCT, ap.id AS postulacionNum, ap.fecha, ai.nombreIniciativa, e.nombre AS empresa, pi.presupuesto, ep.id AS idEstadoPostulacion, ep.descripcion AS estadoPostulacion
                    FROM PostulacionIniciativaCT pi
                    JOIN AntecedentePostulacion ap ON pi.idAntecedentePostulacion = ap.id
                    JOIN AntecedenteIniciativa ai ON pi.idAntecedenteIniciativa = ai.id
                    JOIN Empresa e ON pi.idEmpresa = e.id
                    JOIN EstadoPostulacion ep ON pi.idEstadoPostulacion = ep.id
                    JOIN Coordinadores c ON ap.idCoordinadores = c.id
                    WHERE c.nombre = :evaluador";

            if($filtro !== '') {
                $sql .= " AND (ai.nombreIniciativa LIKE :filtro OR e.nombre LIKE :filtro)";
            }

            $sql .= " ORDER BY ap.id";

            $stmt = $pdo->prepare($sql);
            $params = [':evaluador' => $_SESSION['username'] ?? ''];
            if($filtro !== '') {
                $params[':filtro'] = "%$filtro%";
                $stmt->execute($params); 
            } else {
                $stmt->execute($params);
            }

            $postulaciones = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Obtener lista de estados para el select
            $stmt2 = $pdo->query("SELECT id, descripcion FROM EstadoPostulacion ORDER BY id");
            $estados = $stmt2->fetchAll(PDO::FETCH_ASSOC);

            if(!$postulaciones) {
                echo "<p class='text-center text-warning'>No hay postulaciones encontradas.</p>";
            } else {
                echo "<div class='table-responsive'>";
                echo "<table class='table table-striped table-light'>";
                echo "<thead><tr><th>Postulación N°</th><th>Fecha</th><th>Iniciativa</th><th>Empresa</th><th>Presupuesto</th><th>Estado</th><th>Acción</th></tr></thead><tbody>";

                foreach($postulaciones as $p) {
                    echo "<tr>";
                    echo "<td>" . htmlspecialchars($p['postulacionNum']) . "</td>";
                    echo "<td>" . htmlspecialchars($p['fecha']) . "</td>";
                    echo "<td>" . htmlspecialchars($p['nombreIniciativa']) . "</td>";
                    echo "<td>" . htmlspecialchars($p['empresa']) . "</td>";
                    echo "<td>" . htmlspecialchars($p['presupuesto']) . "</td>";
                    // formulario por fila para actualizar estado
                    echo "<td>";
                    echo "<form method='POST' action='Scripts/Actualizar-estado.php' class='d-flex'>";
                    echo "<input type='hidden' name='idPostulacionCT' value='" . htmlspecialchars($p['idPostulacionCT']) . "'>";
                    echo "<select name='idEstadoPostulacion' class='form-select me-2'>";
                    foreach($estados as $e) {
                        $sel = ($e['id'] == $p['idEstadoPostulacion']) ? 'selected' : '';
                        echo "<option value='" . $e['id'] . "' $sel>" . htmlspecialchars($e['descripcion']) . "</option>";
                    }
                    echo "</select>";
                    echo "</td>";
                    echo "<td>";
                    echo "<button type='submit' class='btn btn-sm btn-primary'>Actualizar</button>";
                    echo "</form>";
                    echo "</td>";
                    echo "</tr>";
                }

                echo "</tbody></table></div>";
            }
        }
        catch(PDOException $e) {
            echo "<p class='text-danger'>Error al consultar postulaciones: " . $e->getMessage() . "</p>";
        }
        ?>
     </div>
    <!-- Mis postulaciones -->
    <div class="container mt-5">
        <h2>Listado General</h2>
        <p>Aquí se mostrarán las iniciativas a las que el evaluador pertenece.</p>
        <?php require 'Scripts/Listar-postulaciones.php'; ?>
     </div>
    <div class="container text-center mt-4">
        <a href="Crear-postulacion.php" class="btn btn-secondary pt-2 pb-2 px-4">Crear postulación</a>
     </div>
    <!-- Botón de volver a login-->
    <div class="container text-center my-4">
        <a href="./Login.php" class="btn btn-secondary pt-2 pb-2 px-4">Volver al Login</a>
     </div>
</body>
</html>
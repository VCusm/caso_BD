<?php 
require 'Scripts/Conectar-BD.php'; // Incluye el archivo de conexión a la base de datos
session_start();

// clase por rol para permitir estilos específicos
$roleClass = '';
if(!empty($_SESSION['rol'])){
    $roleClass = ' role-' . strtolower(str_replace(' ', '-', $_SESSION['rol']));
}

if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'Administrador') {
    header('Location: Login.php');
    exit();
}

$mensaje = '';
if (isset($_SESSION['admin_flash'])) {
    $mensaje = $_SESSION['admin_flash'];
    unset($_SESSION['admin_flash']);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $accion = $_POST['accion'] ?? '';

        if ($accion === 'agregar') {
            $nombre = trim($_POST['nombre'] ?? '');

            if ($nombre === '') {
                $_SESSION['admin_flash'] = 'Debe ingresar un nombre para el coordinador.';
            } else {
                $stmt = $pdo->prepare('INSERT INTO Coordinadores (nombre, activo) VALUES (:nombre, :activo)');
                $stmt->execute([
                    ':nombre' => $nombre,
                    ':activo' => isset($_POST['estado']) ? 1 : 0,
                ]);
                $_SESSION['admin_flash'] = 'Coordinador agregado correctamente.';
            }
        }

        if ($accion === 'alternar') {
            $stmt = $pdo->prepare('UPDATE Coordinadores SET activo = IF(activo = 1, 0, 1) WHERE id = :id');
            $stmt->execute([':id' => (int)($_POST['coordinador_id'] ?? 0)]);
            $_SESSION['admin_flash'] = 'Estado del coordinador actualizado.';
        }
    } catch (PDOException $e) {
        $_SESSION['admin_flash'] = 'Error al procesar la solicitud: ' . $e->getMessage();
    }

    header('Location: Administrador-CT-USM.php');
    exit();
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Administrador CT-USM</title>
    <?php require 'Includes/Configs-head.php'; ?>
</head>
<body class="bg-dark text-light<?php echo $roleClass; ?>" data-role="<?php echo htmlspecialchars($_SESSION['rol'] ?? ''); ?>">
    <div class="text-center p-4 bg-secondary">
        <h1>Administrador CT-USM</h1>
     </div>
    <?php require 'Includes/Msg-bienvenida.php'; ?>

    <div class="container my-4">
        <?php if ($mensaje !== ''): ?>
            <div class="alert alert-info text-dark"><?php echo htmlspecialchars($mensaje); ?></div>
        <?php endif; ?>

        <div class="card bg-secondary text-light mb-4">
            <div class="card-body">
                <h2 class="h4 mb-3">Agregar coordinador</h2>
                <form method="POST" class="row g-3 align-items-end">
                    <input type="hidden" name="accion" value="agregar">
                    <div class="col-md-6">
                        <label for="nombre" class="form-label">Nombre del coordinador</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre y apellido">
                    </div>
                    <div class="col-md-3 form-check ms-2">
                        <input class="form-check-input" type="checkbox" id="estado" name="estado" checked>
                        <label class="form-check-label" for="estado">Activo</label>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-primary w-100">Agregar</button>
                    </div>
                </form>
            </div>
        </div>

        <?php
        try {
            $stmt = $pdo->query('SELECT id, nombre, activo FROM Coordinadores ORDER BY nombre');
            $coordinadores = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            echo '<p class="text-danger">Error al consultar coordinadores: ' . htmlspecialchars($e->getMessage()) . '</p>';
            $coordinadores = [];
        }
        ?>

        <div class="table-responsive">
            <table class="table table-striped table-light align-middle">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Estado</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($coordinadores)): ?>
                        <tr>
                            <td colspan="3" class="text-center text-warning">No hay coordinadores registrados.</td>
                        </tr>
                    <?php else: ?>
                        <?php foreach ($coordinadores as $coordinador): ?>
                            <tr>
                                <td><?php echo htmlspecialchars($coordinador['nombre']); ?></td>
                                <td>
                                    <?php echo ((int)$coordinador['activo'] === 1) ? 'Activo' : 'Inactivo'; ?>
                                </td>
                                <td>
                                    <form method="POST" class="d-inline">
                                        <input type="hidden" name="accion" value="alternar">
                                        <input type="hidden" name="coordinador_id" value="<?php echo (int)$coordinador['id']; ?>">
                                        <button type="submit" class="btn btn-sm btn-warning me-2">
                                            <?php echo ((int)$coordinador['activo'] === 1) ? 'Desactivar' : 'Activar'; ?>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    <div class="container text-center mb-4">
        <a href="./Login.php" class="btn btn-secondary pt-2 pb-2 px-4">Volver al Login</a>
     </div>
</body>
</html>
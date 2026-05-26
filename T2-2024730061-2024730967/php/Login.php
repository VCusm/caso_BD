<?php 
require_once 'Scripts/Conectar-BD.php'; // Incluye el archivo de conexión a la base de datos
session_start(); // Inicia la sesión para almacenar variables de sesión como el nombre de usuario
// Verificar que la conexión PDO existe
if(!isset($pdo) || !($pdo instanceof PDO)) {
    // Si no hay conexión, mostramos el error más adelante en la UI
    $errorMsg = 'Error: no se pudo conectar a la base de datos.';
} else {
    $errorMsg = '';
}

// Procesamiento del formulario antes de imprimir cualquier HTML
if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if($username && empty($_POST['rol'])) {
        $errorMsg = 'Por favor seleccione un rol';
    } else if($username && isset($_POST['rol'])) {
        switch($_POST['rol']) {
            case 'Responsable académico':
                $query = "SELECT COUNT(*) FROM Jefes WHERE nombre = :name";
                $stmt = $pdo->prepare($query);
                $stmt->execute([':name' => $username]);
                $count = $stmt->fetchColumn();
                if($count == 0) {
                    $errorMsg = 'Usuario no encontrado en la base de datos';
                    session_destroy();
                    break;
                }
                $_SESSION['username'] = $username;
                $_SESSION['rol'] = $_POST['rol'];
                header('Location: Responsable-académico.php');
                exit;
            case 'Evaluador':
                $query = "SELECT COUNT(*) FROM Coordinadores WHERE nombre = :name AND activo = 1";
                $stmt = $pdo->prepare($query);
                $stmt->execute([':name' => $username]);
                $count = $stmt->fetchColumn();
                if($count == 0) {
                    $errorMsg = 'Usuario no encontrado o cuenta inactiva en la base de datos';
                    session_destroy();
                    break;
                }
                $_SESSION['username'] = $username;
                $_SESSION['rol'] = $_POST['rol'];
                header('Location: Evaluador-CT-USM.php');
                exit;
            case 'Administrador':
                $query = "SELECT contrasena FROM AdministradorCT WHERE nombre = :name LIMIT 1";
                $stmt = $pdo->prepare($query);
                $stmt->execute([':name' => $username]);
                $admin = $stmt->fetch(PDO::FETCH_ASSOC);

                if(!$admin || $password === '' || $admin['contrasena'] !== $password) {
                    $errorMsg = 'Usuario o contraseña incorrectos para administrador';
                    session_destroy();
                    break;
                }

                $_SESSION['username'] = $username;
                $_SESSION['rol'] = $_POST['rol'];
                header('Location: Administrador-CT-USM.php');
                exit;
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <?php require 'Includes/Configs-head.php'; ?>
</head>
<body class="bg-dark">
        <!-- Switch de tema (esquina superior derecha) -->
        <div id="hack-switch" style="position:fixed; top:1rem; right:1rem; z-index:2000;">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="checkNativeSwitchLogin">
                <label class="form-check-label text-light" for="checkNativeSwitchLogin">Hackerman</label>
            </div>
        </div>
    <div class="text-center p-4 bg-secondary">
        <h1>Portal de Login CT-USM</h1>
     </div>
    <div class="text-center p-2">
        <p>Por favor seleccione su rol y nombre de usuario para ingresar:</p>
     </div>
    <form class="text-center" action=<?php echo $_SERVER['PHP_SELF']; ?> method="POST">
        <div class="container mt-2">
            <!-- Botones de selección de rol 
             input:
                type: button
                class: 
                    form-check-input: para estilizar como botón de radio o checkbox (no se usa en este caso)
                    btn: para estilizar como botón de Bootstrap
                    btn-secondary: para darle un color secundario (gris) a los botones
                    btn-check: para button-like radios/checkboxes (oculta el botón de radio/checkbox original y estiliza el label como botón)
                    me-*: "margin end" para agregar espacio entre los botones
                id: para identificar cada botón
                name: el nombre de la variable que se va a enviar al servidor al hacer submit al formulario
                value: el texto que se muestra en cada botón
                autocomplete: off para evitar que el navegador recuerde la selección anterior
             -->            
            <input type="radio" class="btn-check" name="rol" id="responsable" value="Responsable académico" autocomplete="off">
            <label class="btn btn-secondary me-1" for="responsable">Responsable académico</label>

            <input type="radio" class="btn-check" name="rol" id="evaluador" value="Evaluador" autocomplete="off">
            <label class="btn btn-secondary me-1" for="evaluador">Evaluador</label>

            <input type="radio" class="btn-check" name="rol" id="admin" value="Administrador" autocomplete="off">
            <label class="btn btn-secondary" for="admin">Administrador</label>

         </div>
        <div class="container mt-5 text-center">
            <label for="username" class="form-label mt-3">Usuario:</label>
            <input type="text" class="form-control mb-3 bg-secondary w-25 text-light mx-auto" id="username" name="username" placeholder="Ingrese nombre y apellido">
            <div id="admin-password-group" style="display:none;">
                <label for="password" class="form-label mt-3">Contraseña de administrador:</label>
                <input type="password" class="form-control mb-3 bg-secondary w-25 text-light mx-auto" id="password" name="password" placeholder="Solo para administrador">
            </div>
            <button type="submit" class="btn btn-primary">Ingresar</button>
         </div>
     </form>

    <script>
        // DOM: Document Object Model
        document.addEventListener('DOMContentLoaded', function () {
            const adminRadio = document.getElementById('admin');
            const passwordGroup = document.getElementById('admin-password-group');
            const passwordInput = document.getElementById('password');
            const hackSwitch = document.getElementById('checkNativeSwitchLogin');

            function togglePasswordField() {
                const isAdmin = adminRadio.checked;
                passwordGroup.style.display = isAdmin ? 'block' : 'none';
                if (!isAdmin) {
                    passwordInput.value = '';
                }
            }

            document.querySelectorAll('input[name="rol"]').forEach(function (radio) {
                radio.addEventListener('change', togglePasswordField);
            });

            // Inicializa el switch de tema según localStorage
            try{
              if(hackSwitch){
                hackSwitch.checked = (localStorage.getItem('theme') === 'hackerman');
                hackSwitch.addEventListener('change', function(){
                  if(typeof window.setTheme === 'function') window.setTheme(hackSwitch.checked);
                });
              }
            }catch(e){}

            togglePasswordField();
        });
    </script>

    <?php
    if(!empty($errorMsg)){
        echo '<p class="text-danger text-center">'.htmlspecialchars($errorMsg).'</p>';
    }
    ?>
    <script src="../js/bootstrap.bundle.min.js"></script> <!-- Bootstrap JS (va al final) -->
</body>
</html>
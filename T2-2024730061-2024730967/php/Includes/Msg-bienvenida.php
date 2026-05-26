<div class="text-center p-2">
    <?php 
    echo 'Bienvenido/a, ';
    if(isset($_SESSION['username'])) {
        echo $_SESSION['username']; // Muestra el nombre de usuario almacenado en la variable de sesión
    }
    else {
        echo 'Usuario'; // Si no hay un nombre de usuario almacenado, muestra "Usuario"
    }
    ?>
 </div>
<?php
// Redirige a la página de login del proyecto
header('Location: Login.php');
exit;
?>

<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<meta http-equiv="refresh" content="0;url=php/Login.php">
	<title>Redirigiendo...</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">
	<div class="container text-center p-5">
		<p>Si no eres redirigido automáticamente, haz click en el siguiente enlace:</p>
		<a href="php/Login.php" class="btn btn-primary">Ir a Login</a>
	</div>
	<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>

<!-- Contiene las configuraciones del head para cada página -->
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="../favicon.png"> <!-- Favicon -->
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Responsive meta tag -->
<link href="../css/bootstrap.min.css" rel="stylesheet"> <!-- Boostrap CSS -->
<link href="../css/diseño.css" rel="stylesheet"> <!-- Estilos personalizados -->
<link id="hackerman-css" href="../css/hackerman.css" rel="stylesheet" disabled>
<script>
	(function(){
		const link = document.getElementById('hackerman-css');
		window.setTheme = function(on){
			if(on){
				link.disabled = false;
				document.documentElement.classList.add('hackerman');
				try{ localStorage.setItem('theme','hackerman'); }catch(e){}
			} else {
				link.disabled = true;
				document.documentElement.classList.remove('hackerman');
				try{ localStorage.removeItem('theme'); }catch(e){}
			}
		};
		try{
			const saved = localStorage.getItem('theme');
			if(saved === 'hackerman'){
				link.disabled = false;
				document.documentElement.classList.add('hackerman');
			}
		}catch(e){}
	})();
</script>
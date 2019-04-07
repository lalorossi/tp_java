<%@ page import="entities.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
	function checkUsuario(){
		userName = document.getElementById("inputUsuario").value;
		password = document.getElementById("inputPassword").value;
		if(userName != "" && password != "")
			return true;
		window.alert("Complete los campos");
		return false;
	}
	
	// Si hay alertas seteadas en la request, las muestra
	function showAlerts(){
		// El onLoad solo se ejecuta la primera vez. Si vengo de un redirect, no se ejecuta
		usuarioActual = <%= ((Usuario)request.getSession(false).getAttribute("usuarioActual")) %>;
		if(usuarioActual != null){
			window.alert("Ya está logeado, hacer redirect");
		}
		else{
			mensaje = <%= session.getAttribute("mensaje") %>;
			window.alert(mensaje);
			<% 
				session.removeAttribute("mensaje");
				System.out.println("mensaje borrado");
			%>
			window.alert(mensaje);
			if( mensaje != null){
				window.alert(mensaje);
			}
		}
	}
</script>
</head>
<body onLoad="showAlerts()">
	<form action="home" method="POST" onsubmit="return checkUsuario()">
		<table>
			<tr>
				<th>Usuario</th>
				<th>
					<input type="text" name="usuario" id="inputUsuario" autofocus>
				</th>
			</tr>
			<tr>
				<th>Contraseña</th>
				<th>
					<input type="password" name="password" id="inputPassword">
				</th>
			</tr>
			<tr>
				<th>
					<button type="submit">Ingresar</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>
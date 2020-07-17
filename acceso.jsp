<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<script src="https://apis.google.com/js/platform.js" async defer></script>
    	<meta name="google-signin-client_id" content="804980728062-eh55v4ciivc72volvsl8rd2shothficj.apps.googleusercontent.com">
        
	<title>Acceso Administrador</title>
	<link href="" rel="stylesheet" type="text/css" />
	</head>
	
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage=""%>
<%@ page import="org.apache.commons.fileupload.*,
				librerias.catalogos.*,
				librerias.base.*,
				librerias.comun.*,
				java.sql.*, java.util.*, java.io.File"%>
<%
/**
 * <p>Title:  Título de la página  </p>
 * <p>Description: Aplicación Web para ...</p>
 * <p>Copyright: Copyright (c) 2018</p>
 * <p>Company: Nombre de la aplicacion </p>
 * @author Nombre Autor
 * @version 1.0
 */

String usuario= request.getParameter("xLogin")!=null?
request.getParameter("xLogin"):"";

String contrasena= request.getParameter("xContrasena")!=null?
request.getParameter("xContrasena"):"";

String tipo="admi";


Resultados rs = null;
String linea="";
String error="";

if (!usuario.equals("")){

linea="Select 1 from usuarios where usuario=" + Utilerias.Comillas(usuario) + " and " +
		"clave=" + Utilerias.Comillas(contrasena) + " and tipo= " + Utilerias.Comillas(tipo);

rs = UtilDB.ejecutaConsulta(linea);



if (rs.recordCount()>0)
{
	response.sendRedirect(request.getContextPath() + "/principal.jsp");
}
else
{

	error="Usuario o contraseña incorrectos";
	usuario="";
	contrasena="";

}
}


%>

<script>

	function onSignIn(googleUser) {
  		var profile = googleUser.getBasicProfile();
  		console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
 	 	console.log('Name: ' + profile.getName());
  		console.log('Image URL: ' + profile.getImageUrl());
  		console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		alert("Bienvenido " + profile.getName());
		window.location = "principal.jsp";
	}

	function Validate()
	{

	if (forma.xLogin.value=="")

	{
		alert ("Debe escribir su usuario");
	}
	else
	{
		if(forma.xContrasena.value=="")
		{
			alert ("Debe escribir su contraseña");
		}
		else{
			forma.submit();
		}
	}
	}
</script>



<body background="complementos/imagen/f1.jpg">
<form action="" autocomplete="off" method="post" name="forma">

	<table width="50%" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
		<tr>
			<td align="center" colspan="2" bgcolor="black"><h2 style="color:#FFFFFF">Ingrese sus credenciales de acceso</h2></td>
			
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td bgcolor="white" align="center">Usuario</td>
			<td><input type="text" name="xLogin" id="xLogin" placeholder="Escriba su usuario" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td bgcolor="white" align="center">Contrase&ntilde;a</td>
			<td><input type="password" name="xContrasena" id="xContrasena" placeholder="Escriba su contraseña" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
			<button type="button" name="Aceptar" id="Aceptar" value="Iniciar" onclick="Validate();">Iniciar sesion</button>
			</td>
		</tr>

		<tr>
			<td>
				<div class="g-signin2" data-onsuccess="onSignIn"></div>
			</td>
		</tr>

		<tr>
			<td>&nbsp;</td>
			<td>
				<a href="index.jsp"><img width="100" height="50" align="right" src="complementos/imagen/regresar.png"></a>
			</td>
		</tr>

		<%

		if (!error.equals(""))
		{

		%>
			<script>
				alert('<%=error%>')
				forma.xLogin.focus();
			</script>
		<%
		}
		%>

	</table>
</form>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Bienvenido...</title>
	<link rel="stylesheet" type="text/css" href="archivos_menu/menu.css"/>
	<script type="text/javascript" src="archivos_menu/jquery.js"></script>
	<script type="text/javascript" src="archivos_menu/menu.js"></script>
	<link rel="stylesheet" href="CSS/estilos.css">

	<style type="text/css">
	div#menu { margin: 5px auto }
	div#copyright { 
		font: 11px 'Trebuchet MS';
		color: #222;
		text-indent: 30px;
		padding: 40px 0 0 0;
	 }
	 div#copyright a { color:#000; }
	 div#copyright a:hover { color:#222; }
	</style>
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

%>

<script>
  
function signOut() {
       var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
       console.log('User signed out.');
       window.location = "index.jsp";
    });
  }


</script>


<body background="complementos/imagen/f1.jpg">
<form action="" autocomplete="off" method="post" name="forma">
	<table align="center" width="70%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" colspan="3">
    		<img border="0" src="complementos/imagen/baner3.png" width="950" height="100">
    </td>
  </tr>
  <tr>
  	<td colspan="3">
  		<div id="menu">
  			<ul class="menu">
  				<li><a href="cat_baguis.jsp" class="parent" target="_parent"><span>Recetas Bagui</span></a></li>
  				<li><a href="cat_makis.jsp" class="parent" target="_parent"><span>Recetas Maki</span></a></li>
  				<li><a href="cat_snacks.jsp" class="parent" target="_parent"><span>Recetas Snack</span></a></li>
  				<li><a href="cat_cafes.jsp" class="parent" target="_parent"><span>Recetas Cafe</span></a></li>
          <li><a href="cat_usuarios.jsp" class="parent" target="_parent"><span>Usuarios</span></a></li>
  				<li><a href="Encuesta.jsp" class="parent" target="_parent"><span>Encuestas</span></a></li>
          <li><a href="cat_preguntas.jsp" class="parent" target="_parent"><span>Preguntas Encuesta</span></a></li>
  			</ul>
  		</div>
  		<a href="http://apycom.com/"></a>
  	</td>
  </tr>
  <tr>
  	<td colspan="3">
  		<h3 align="center" style="color:#FFFFFF">A continuacion podras realizar ingreso, actualizacion, eliminacion y visualizacion de los datos de Cinepolis, recuerda que el cambio se realizara en ambas plataformas.</h3>
  	</td>
  </tr>
  <tr>
  	<td align="center" width="80%">
  		<a href="cat_baguis.jsp"><img src="complementos/imagen/bagui.png" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<a href="cat_makis.jsp"><img src="complementos/imagen/maki.jpg" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<a href="cat_snacks.jsp"><img src="complementos/imagen/snack.jpg" width="200" height="80"></a>
  	</td>
  </tr>

   <tr>
  	<td align="center">
  		<h4 style="color:#FFFFFF">Recetas de Baguis.</h4>
  	</td>
  	<td align="center">
  		<h4 style="color:#FFFFFF">Recetas de Makis</h4>
  	</td>
  	<td align="center">
  		<h4 style="color:#FFFFFF">Recetas de Snacks</h4>
  	</td>
  </tr>

  <tr>
  	<td align="center" width="80%">
  		<a href="cat_usuarios.jsp"><img src="complementos/imagen/usuarios.jpg" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<a href="cat_cafes.jsp"><img src="complementos/imagen/cafe.png" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<a href="graficas.jsp"><img src="complementos/imagen/op1.png" width="200" height="80"></a>
  	</td>
  </tr>

   <tr>
  	<td align="center">
  		<h4 style="color:#FFFFFF">Acceso a la informacion.</h4>
  	</td>
  	<td align="center">
  		<h4 style="color:#FFFFFF">Recetas de Coffe Tree</h4>
  	</td>
  	<td align="center">
  		<h4 style="color:#FFFFFF">Encuestas cinepolito</h4>
  	</td>
  </tr>

   <tr>
    <td align="center" width="80%">
    </td>
    <td align="center" width="80%">
      <a href="cat_preguntas.jsp"><img src="complementos/imagen/signo.png" width="200" height="80"></a>
    </td>
    <td align="center" width="80%">
    </td>
  </tr>

  <tr>
    <td align="center">
    </td>
    <td align="center">
      <h4 style="color:#FFFFFF">Preguntas encuesta</h4>
    </td>
    <td align="center">
    </td>
  </tr>

  <tr>
  	<td>
  		<a href="index.jsp" onclick="signOut();"><img width="100" height="50" src="complementos/imagen/regresar.png"></a>
  	</td>
  </tr>


</table>
</form>
</body>
</html>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Administracion de la informacion de Cinepolis</title>
	<link rel="stylesheet" href="CSS/estilos.css">

	
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
<body background="complementos/imagen/f1.jpg">
<form action="" autocomplete="off" method="post" name="forma">
	<table align="center" width="60%"  border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td align="center" colspan="2">
    		<img border="0" src="complementos/imagen/baner3.png" width="700" height="100">
    </td>
  </tr>
  
  <tr>
  	<td colspan="3">
  		<h2 align="center" style="color:#FFFFFF" align="text">El siguiente sistema tiene como finalidad otorgar la adecuada seguridad de acceso a la informacion de Cinepolis, asi como permitir al equipo gerencial, el uso de la informacion y su administracion. Con ayuda de este sistema podras:</h2>
  	</td>
  </tr>
  <tr>
  	<td align="center" width="80%">
  		<img src="complementos/imagen/bagui.png" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<img src="complementos/imagen/snack.jpg" width="200" height="80"></a>
  	</td>
  </tr>

   <tr>
  	<td align="center" style="color:#FFFFFF">
  		<H4>Editar las recetas de Bagguis existentes.</H4>
  	</td>
  	<td align="center" style="color:#FFFFFF">
  		<H4>Editar las recetas de Snacks existentes.</H4>
  	</td>
  </tr>

  <tr>
  	<td align="center" width="80%">
  		<img src="complementos/imagen/maki.jpg" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<img src="complementos/imagen/cafe.png" width="200" height="80"></a>
  	</td>
  </tr>

   <tr>
  	<td align="center" style="color:#FFFFFF">
  		<H4>Editar las recetas de Makis existentes.</H4>
  	</td>
  	<td align="center" style="color:#FFFFFF">
  		<H4>Editar las recetas de Cafes existentes.</H4>
  	</td>
  </tr>

  <tr>
  	<td align="center" width="80%">
  		<img src="complementos/imagen/login1.png" width="200" height="80"></a>
  	</td>
  	<td align="center" width="80%">
  		<img src="complementos/imagen/op2.png" width="200" height="80"></a>
  	</td>
  </tr>

   <tr>
  	<td align="center" style="color:#FFFFFF">
  		<H4>Brindar acceso administrativo a un nuevo usuario.</H4>
  	</td>
  	<td align="center" style="color:#FFFFFF">
  		<H4>Conocer las opiniones de los Cinepolitos.</H4>
  	</td>
  </tr>


  <tr>
    <td colspan="3" align="center" style="color:#FFFFFF">
      <h2>Ingresa con tus credenciales administrativas:</h2>
    </td>
  </tr>

  <tr>
    <td colspan="3" align="center">
      <a href="acceso.jsp"><img src="complementos/imagen/star.png" width="100" height="80"></a>
    </td>
  </tr>
  <tr>
    <td colspan="3" align="center">
      <a href="acceso.jsp" style="color:#FFFFFF"><h3>Iniciar sesion</h3></a>
    </td>
  </tr>
</table>
</form>
</body>
</html>
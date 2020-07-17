<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Catalogo de Administradores</title>
	<link href="css/estilos.css" rel="stylesheet" type="text/css" />
	</head>
	
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage=""%>
<%@ page import="org.apache.commons.fileupload.*,
				librerias.catalogos.*,
				librerias.base.*,
				librerias.comun.*,
				java.sql.*, java.util.*, java.io.File"%>
<%
/**
 * <p>Title:  Catalogo de Regiones  </p>
 * <p>Description: Aplicación Web para ...</p>
 * <p>Copyright: Copyright (c) 2018</p>
 * <p>Company: Nombre de la aplicacion </p>
 * @author Jorge Diaz Autor
 * @version 1.0
 */

String accion= request.getParameter("xAccion")!=null?
request.getParameter("xAccion"):"listado";

String clave= request.getParameter("xClave")!=null?
request.getParameter("xClave"):"0";

String nombre= request.getParameter("xNombre")!=null?
request.getParameter("xNombre"):"";

String paterno= request.getParameter("xPaterno")!=null?
request.getParameter("xPaterno"):"";

String materno= request.getParameter("xMaterno")!=null?
request.getParameter("xMaterno"):"";

String login= request.getParameter("xLogin")!=null?
request.getParameter("xLogin"):"";

String contrasena= request.getParameter("xContrasena")!=null?
request.getParameter("xContrasena"):"";

int cveUsuarios = request.getParameter("xCveUsuarios")!=null?
Integer.parseInt(request.getParameter("xCveUsuarios")):0;

String linea="";
Resultados rs= null; 
int renglon= 0;

if (accion.equals("recargar"))
{
	linea="select * from usuarios where cve_usuarios=" + clave;
	rs=UtilDB.ejecutaConsulta(linea);
	while (rs.next())
	{
		nombre=rs.getString("nombre");
		paterno=rs.getString("paterno");
		materno=rs.getString("materno");
		login=rs.getString("login");
		contrasena=rs.getString("contrasena");
	}
}

if(accion.equals("guardarcerrar") || accion.equals("guardarNuevo"))
{
	if(clave.equals("0")) //registro nuevo
	{
		clave = String.valueOf(UtilDB.getSiguienteNumero("usuarios","cve_usuarios"));

		linea="insert into usuarios(cve_usuarios, nombre, paterno, materno, login, contrasena) values (" + clave + ", " +
				Utilerias.Comillas(nombre) + "," +
				Utilerias.Comillas(paterno) + "," +
				Utilerias.Comillas(materno) + "," +
				Utilerias.Comillas(login) + "," +
				Utilerias.Comillas(contrasena) + ")";
		UtilDB.ejecutaSQL(linea);
	
		if(accion.equals("guardarNuevo"))
		{
			accion="nuevo";
			clave="";
			nombre="";
			paterno="";
			materno="";
			login="";
			contrasena="";

		}
		else
		{
			accion="listado";
	    }
	}
	else
	{ 
		linea="update usuarios set " +
				"cve_usuarios=" + clave + "," +  
				"nombre=" + Utilerias.Comillas(nombre) + "," +
		        "paterno=" + Utilerias.Comillas(paterno) + "," +
		        "materno=" + Utilerias.Comillas(materno) + "," +
		        "login=" + Utilerias.Comillas(login) + "," +
		        "contrasena=" + Utilerias.Comillas(contrasena) + " " +
		        "where cve_usuarios=" + clave;
		UtilDB.ejecutaSQL(linea);

		if(accion.equals("guardarNuevo"))
		{
			accion="nuevo";
			clave="";
			nombre="";
			paterno="";
			materno="";
			login="";
			contrasena="";
		}
		else
		{
			accion="listado";

	    }
      }

	}
	
	if (accion.equals("eliminar"))
	{
		UtilDB.ejecutaSQL("delete from usuarios where cve_usuarios=" + clave);
		accion="listado";
	}

%>

<script>

	function salir()
	{
		window.location = "principal.jsp";
	}

	function cerrar()
	{
		if (confirm("¿Esta seguro de cerrar sin guardar los cambios?"))
		{
		forma.xAccion.value = "listado";
		forma.submit();
		}
	}

	function recargaE()
	{
		forma.xAccion.value="recargaE";
		forma.xCveUsuarios.value="0";
		forma.submit();
	}

	function eliminar()
	{
		if (confirm("¿Esta seguro de eliminar el registro?"))
		{
		forma.xAccion.value = "eliminar";
		forma.submit();
		}
	}

	function recargar(cve)
	{
		forma.xAccion.value="recargar";
		forma.xClave.value= cve;
		forma.submit();	
	}


	function nuevo()
	{
		forma.xAccion.value="nuevo";
		forma.xClave.value="0";
		forma.submit();
	}


	function validate(accion) 
	{
		errores =0;
		if(forma.xNombre.value=="")
		{
			alert("Debe escribir el nombre del usuario");
			forma.xNombre.focus();
			errores++;
		}

		else 
		{
			if (forma.xPaterno.value=="")
				{
					alert("Debe escribir un apellido paterno");
					forma.xPaterno.focus();
					errores++;
				}else 
		{
			if (forma.xMaterno.value=="")
				{
					alert("Debe escribir un apellido materno");
					forma.xMaterno.focus();
					errores++;
				}else 
		{
			if (forma.xLogin.value=="")
				{
					alert("Debe escribir un login de usuario");
					forma.xLogin.focus();
					errores++;
				}else 
		{
			if (forma.xContrasena.value=="")
				{
					alert("Debe escribir una contrasena");
					forma.xContrasena.focus();
					errores++;
				}
		}
		}
		}
		}
		
		if (errores==0)
		{
			forma.xAccion.value=accion;
			forma.submit();
		}

	}
</script>
<body background="complementos/imagen/fondo2.jpg">
<form action="" autocomplete="off" method="post" name="forma">
	<input type="hidden" id="xClave"  name="xClave" value="<%=clave%>">
	<input type="hidden" id="xAccion"  name="xAccion" value="<%=accion%>">
	<table width="95%" align="center" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>
				<table width="95%" align="center" cellpadding="0" cellspacing="0" border="1">
					<tr>
						<td class="TextoEncabezado" colspan="5" align="center">
							<h2>
						Catalago de Administradores</td></h2>
					</tr>
					<% 
						if (accion.equals("listado"))
						{
					%>
					<tr align="center">
						<td width="20%"> 
							<a href="#" onClick="nuevo();">
							<img src="imagenes/botones/nuevo.png" alt="" title="Dar de alta un nuevo registro">
							</a>
						</td>
					
						<td width="20%"> 
							<img src="imagenes/botones/disabled/guardarycerrar.png" ></td>

						<td width="20%"> <img src="imagenes/botones/disabled/guardarynuevo.png" ></td>

						<td width="20%"> <img src="imagenes/botones/disabled/eliminar.png" ></td>

						<td width="20%"> 
							<a href="#" onclick="salir();">
							<img src="imagenes/botones/cerrar.png">
							</a>
						</td>
					</tr>

					<tr>
						<td colspan="5">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5">
							<table align="center" width="100%" cellpadding="0" cellspacing="0" border="1">
								<tr align="center" bgcolor="yellow">
									<td class="celdaEncabezado">No.</td>
									<td class="celdaEncabezado">&nbsp;</td>
									<td class="celdaEncabezado">&nbsp;</td>
									<td class="celdaEncabezado">Nombre</td>
									<td class="celdaEncabezado">Paterno</td>
									<td class="celdaEncabezado">Materno</td>
									<td class="celdaEncabezado">Login</td>
									<td class="celdaEncabezado">Contrasena</td>
									
								</tr>

							<%
							 rs = UtilDB.ejecutaConsulta("Select e.*, e.nombre as usuario from usuarios as e order by e.nombre");
													renglon=0;
													while(rs.next())
													{
														renglon++;
							%>

								<tr>
									<td class="celdaEncabezado"><%=renglon%></td>
									<td class="celdaEncabezado">&nbsp;</td>
									<td class="celdaEncabezado">
										<a href="#" onclick="recargar('<%=rs.getInt("cve_usuarios")%>')"><img src="imagenes/edit.png" width="20" alt=""></a>
									</td>
									<td class="celdaEncabezado"><%=rs.getString("nombre")%></td>
									<td class="celdaEncabezado"><%=rs.getString("paterno")%></td>
									<td class="celdaEncabezado"><%=rs.getString("materno")%></td>
									<td class="celdaEncabezado"><%=rs.getString("login")%></td>
									<td class="celdaEncabezado"><%=rs.getString("contrasena")%></td>
								</tr>
								
							    <%
							    }
								%>	

							</table>
						</td>
					</tr>

					<%
						}
						else
						 {
                    %>

                    	<tr>
						<td width="20%"> <img src="imagenes/botones/disabled/nuevo.png" alt="" title="Dar de alta un nuevo registro"></td>
					
						<td width="20%">
							<a href="#" onclick="validate('guardarcerrar');">
						      <img src="imagenes/botones/guardarycerrar.png" >
						    </a>
						</td>

						<td width="20%">
							<a href="#" onClick="validate('guardarNuevo')">
							 <img src="imagenes/botones/guardarynuevo.png" >
							</a>	
						</td>


						<td width="20%"> 
							<a href="#" onclick="eliminar();">
							<img src="imagenes/botones/eliminar.png" />
							</a>
						</td>

						<td width="20%"> 
							<a href="#" onclick="cerrar();">
							<img src="imagenes/botones/cerrar.png"></a>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<table>
									<tr>
										<td>Datos del Usuario</td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td>Nombre </td>
										<td> <input type="text" id="xNombre" name="xNombre" size="40" maxlength="120" value="<%=nombre%>"></td>
									</tr>
									<tr>
										<td>Paterno </td>
										<td> <input type="text" id="xPaterno" name="xPaterno" size="40" maxlength="120" value="<%=paterno%>"></td>
									</tr>
									<tr>
										<td>Materno </td>
										<td> <input type="text" id="xMaterno" name="xMaterno" size="40" maxlength="120" value="<%=materno%>"></td>
									</tr>
									<tr>
										<td>Login </td>
										<td> <input type="text" id="xLogin" name="xLogin" size="40" maxlength="120" value="<%=login%>"></td>
									</tr>
									<tr>
										<td>Contrasena </td>
										<td> <input type="text" id="xContrasena" name="xContrasena" size="40" maxlength="120" value="<%=contrasena%>"></td>
									</tr>
							</table>
					    </td>
					</tr>
					
                    <%
						 }
					%>
				</table>
			</td>
		</tr>
	</table>
	
</form>
</body>
</html>


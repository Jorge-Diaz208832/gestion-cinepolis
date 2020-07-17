<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Acceso a la informacion</title>
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

String usuario= request.getParameter("xUsuario")!=null?
request.getParameter("xUsuario"):"";

String clave2= request.getParameter("xClave2")!=null?
request.getParameter("xClave2"):"";

String tipo= request.getParameter("xTipo")!=null?
request.getParameter("xTipo"):"";

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
		usuario=rs.getString("usuario");
		clave2=rs.getString("clave");
		tipo=rs.getString("tipo");
	}
}

if(accion.equals("guardarcerrar") || accion.equals("guardarNuevo"))
{
	if(clave.equals("0")) //registro nuevo
	{
		clave = String.valueOf(UtilDB.getSiguienteNumero("usuarios","cve_usuarios"));

		linea="insert into usuarios(cve_usuarios, usuario, clave, tipo) values (" + clave + ", " +
				Utilerias.Comillas(usuario) + "," +
				Utilerias.Comillas(clave2) + "," +
				Utilerias.Comillas(tipo) + ")";
		UtilDB.ejecutaSQL(linea);
	
		if(accion.equals("guardarNuevo"))
		{
			accion="nuevo";
			clave="";
			usuario="";
			clave2="";
			tipo="";
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
				"usuario=" + Utilerias.Comillas(usuario) + "," +
				"clave=" + Utilerias.Comillas(clave2) + "," +
		        "tipo=" + Utilerias.Comillas(tipo) + " " +
		        "where cve_usuarios=" + clave;
		UtilDB.ejecutaSQL(linea);

		if(accion.equals("guardarNuevo"))
		{
			accion="nuevo";
			clave="";
			usuario="";
			clave2="";
			tipo="";
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
		if(forma.xUsuario.value=="")
		{
			alert("Debe escribir el nombre del usuario");
			forma.xUsuario.focus();
			errores++;
		}

		else 
		{
			if (forma.xClave2.value=="")
				{
					alert("Debe escribir una clave de acceso");
					forma.xClave2.focus();
					errores++;
				}
		}

		
		if (errores==0)
		{
			forma.xAccion.value=accion;
			forma.submit();
		}

	}
</script>

<body background="complementos/imagen/f1.jpg">

<form action="" autocomplete="off" method="post" name="forma">
	<input type="hidden" id="xClave"  name="xClave" value="<%=clave%>">
	<input type="hidden" id="xAccion"  name="xAccion" value="<%=accion%>">
	<table width="95%" align="center" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>
				<table width="95%" align="center" cellpadding="0" cellspacing="0" border="1">
					<tr bgcolor="black">
						<td class="TextoEncabezado" colspan="5" align="center">
							<h2 style="color:#FFFFFF">
						Usuarios de la informacion Cinepolis</td></h2>
					</tr>
					<% 
						if (accion.equals("listado"))
						{
					%>
					<tr align="center" bgcolor="white">
						<td width="20%"> 
							<a href="#" onClick="nuevo();">
							<img width="100" height="50" src="imagenes/botones/nuevo.png" alt="" title="Dar de alta un nuevo registro">
							</a>
						</td>
					
						<td width="20%"> 
							<img width="100" height="50" src="imagenes/botones/disabled/guardarycerrar.png" ></td>

						<td width="20%"> <img width="100" height="50" src="imagenes/botones/disabled/guardarynuevo.png" ></td>

						<td width="20%"> <img width="100" height="50" src="imagenes/botones/disabled/eliminar.png" ></td>

						<td width="20%"> 
							<a href="#" onclick="salir();">
							<img width="100" height="50" src="imagenes/botones/cerrar.png">
							</a>
						</td>
					</tr>

					<tr>
						<td colspan="5">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5">
							<table align="center" width="100%" cellpadding="0" cellspacing="0" border="1">
								<tr align="center" bgcolor="black">
									<td class="celdaEncabezado" style="color:#FFFFFF">No.</td>
									<td class="celdaEncabezado">&nbsp;</td>
									<td class="celdaEncabezado" style="color:#FFFFFF">Usuario</td>
									<td class="celdaEncabezado" style="color:#FFFFFF">Contraseña</td>
									<td class="celdaEncabezado" style="color:#FFFFFF">Privilegio</td>
								</tr>

							<%
							 rs = UtilDB.ejecutaConsulta("Select e.*, e.usuario as usuarios from usuarios as e order by e.usuario");
													renglon=0;
													while(rs.next())
													{
														renglon++;
							%>

								<tr bgcolor="white" align="center">
									<td class="celdaEncabezado"><%=renglon%></td>
									<td class="celdaEncabezado" align="center">
										<a href="#" onclick="recargar('<%=rs.getInt("cve_usuarios")%>')"><img align="center" src="imagenes/edit.png" width="20" alt=""></a>
									</td>
									<td class="celdaEncabezado"><%=rs.getString("usuario")%></td>
									<td class="celdaEncabezado"><%=rs.getString("clave")%></td>
									<td class="celdaEncabezado"><%=rs.getString("tipo")%></td>
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

                    	<tr bgcolor="white" align="center">
						<td width="20%"> <img width="100" height="50" src="imagenes/botones/disabled/nuevo.png" alt="" title="Dar de alta nueva receta"></td>
					
						<td width="20%">
							<a href="#" onclick="validate('guardarcerrar');">
						      <img width="100" height="50" src="imagenes/botones/guardarycerrar.png" >
						    </a>
						</td>

						<td width="20%">
							<a href="#" onClick="validate('guardarNuevo')">
							 <img width="100" height="50" src="imagenes/botones/guardarynuevo.png" >
							</a>	
						</td>


						<td width="20%"> 
							<a href="#" onclick="eliminar();">
							<img width="100" height="50" src="imagenes/botones/eliminar.png" />
							</a>
						</td>

						<td width="20%"> 
							<a href="#" onclick="cerrar();">
							<img width="100" height="50" src="imagenes/botones/cerrar.png"></a>
						</td>
					</tr>
					<tr>
						<td colspan="5">
							<table>
									<tr>
										<td style="color:#FFFFFF" align="right"><h4>Datos del usuario</h4></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="color:#FFFFFF">Usuario: </td>
										<td> <input type="text" id="xUsuario" name="xUsuario" size="40" maxlength="120" value="<%=usuario%>"></td>
									</tr>
									<tr>
										<td style="color:#FFFFFF">Clave: </td>
										<td> <input type="text" id="xClave2" name="xClave2" size="40" maxlength="120" value="<%=clave2%>"></td>
									</tr>
									<tr>
										<td style="color:#FFFFFF">Privilegio: </td>
										<td> <input type="text" id="xTipo" name="xTipo" size="40" maxlength="120" value="<%=tipo%>"></td>
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


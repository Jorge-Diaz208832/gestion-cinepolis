<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Recetario de Coffe Tree</title>
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

String nombre= request.getParameter("xNombre")!=null?
request.getParameter("xNombre"):"";

String descripcion= request.getParameter("xDescripcion")!=null?
request.getParameter("xDescripcion"):"";

String elaboracion= request.getParameter("xElaboracion")!=null?
request.getParameter("xElaboracion"):"";

int cveCafes = request.getParameter("xCveCafes")!=null?
Integer.parseInt(request.getParameter("xCveCafes")):0;

String linea="";
Resultados rs= null; 
int renglon= 0;

if (accion.equals("recargar"))
{
	linea="select * from cafes where cve_cafes=" + clave;
	rs=UtilDB.ejecutaConsulta(linea);
	while (rs.next())
	{
		nombre=rs.getString("nombre");
		descripcion=rs.getString("descripcion");
		elaboracion=rs.getString("elaboracion");
	}
}

if(accion.equals("guardarcerrar") || accion.equals("guardarNuevo"))
{
	if(clave.equals("0")) //registro nuevo
	{
		clave = String.valueOf(UtilDB.getSiguienteNumero("cafes","cve_cafes"));

		linea="insert into cafes(cve_cafes, nombre, descripcion, elaboracion) values (" + clave + ", " +
				Utilerias.Comillas(nombre) + "," +
				Utilerias.Comillas(descripcion) + "," +
				Utilerias.Comillas(elaboracion) + ")";
		UtilDB.ejecutaSQL(linea);
	
		if(accion.equals("guardarNuevo"))
		{
			accion="nuevo";
			clave="";
			nombre="";
			descripcion="";
			elaboracion="";
		}
		else
		{
			accion="listado";
	    }
	}
	else
	{ 
		linea="update cafes set " +
				"cve_cafes=" + clave + "," + 
				"nombre=" + Utilerias.Comillas(nombre) + "," +
				"descripcion=" + Utilerias.Comillas(descripcion) + "," +
		        "elaboracion=" + Utilerias.Comillas(elaboracion) + " " +
		        "where cve_cafes=" + clave;
		UtilDB.ejecutaSQL(linea);

		if(accion.equals("guardarNuevo"))
		{
			accion="nuevo";
			clave="";
			nombre="";
			descripcion="";
			elaboracion="";
		}
		else
		{
			accion="listado";

	    }
      }

	}
	
	if (accion.equals("eliminar"))
	{
		UtilDB.ejecutaSQL("delete from baguis where cve_cafes=" + clave);
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
		if(forma.xNombre.value=="")
		{
			alert("Debe escribir el nombre del cafe");
			forma.xNombre.focus();
			errores++;
		}

		else 
		{
			if (forma.xDescripcion.value=="")
				{
					alert("Debe escribir la descripcion del cafe");
					forma.xAbreviatura.focus();
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
						Recetario de Coffe Tree Cinepolis</td></h2>
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
									<td class="celdaEncabezado" style="color:#FFFFFF">Nombre</td>
									<td class="celdaEncabezado" style="color:#FFFFFF">Descripcion</td>
									<td class="celdaEncabezado" style="color:#FFFFFF">Tiempo</td>
								</tr>

							<%
							 rs = UtilDB.ejecutaConsulta("Select e.*, e.nombre as cafes from cafes as e order by e.nombre");
													renglon=0;
													while(rs.next())
													{
														renglon++;
							%>

								<tr bgcolor="white" align="center">
									<td class="celdaEncabezado"><%=renglon%></td>
									<td class="celdaEncabezado" align="center">
										<a href="#" onclick="recargar('<%=rs.getInt("cve_cafes")%>')"><img align="center" src="imagenes/edit.png" width="20" alt=""></a>
									</td>
									<td class="celdaEncabezado"><%=rs.getString("nombre")%></td>
									<td class="celdaEncabezado"><%=rs.getString("descripcion")%></td>
									<td class="celdaEncabezado"><%=rs.getString("elaboracion")%></td>
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
										<td style="color:#FFFFFF" align="right"><h4>Datos del Coffe</h4></td>
										<td></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="color:#FFFFFF">Nombre: </td>
										<td> <input type="text" id="xNombre" name="xNombre" size="100" maxlength="120" value="<%=nombre%>"></td>
									</tr>
									<tr>
										<td style="color:#FFFFFF">Descripcion: </td>
										<td> <input type="text" id="xDescripcion" name="xDescripcion" size="100" maxlength="120" value="<%=descripcion%>"></td>
									</tr>
									<tr>
										<td style="color:#FFFFFF">Tiempo de elaboracion: </td>
										<td> <input type="text" id="xElaboracion" name="xElaboracion" size="100" maxlength="120" value="<%=elaboracion%>"></td>
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


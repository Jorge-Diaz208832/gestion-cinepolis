<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Graficacion VIP</title>
	<link href="" rel="stylesheet" type="text/css" />

	</head>
	
<%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage=""%>
<%@ page import="org.apache.commons.fileupload.*,
				librerias.catalogos.*,
				librerias.base.*,
				librerias.comun.*,
				java.sql.*, java.util.*, java.io.File"%>
<%


String accion= request.getParameter("xAccion")!=null?
request.getParameter("xAccion"):"enviar";


int jo=0;
int bl=0;
int ma=0;
int al=0;
int je=0;
int es=0;
int ju=0;
int se=0;
String pre="";

String linea="";
Resultados rs= null; 
int renglon= 0;

linea="select * from encuesta where cve_preguntas=8";
rs=UtilDB.ejecutaConsulta(linea);

while (rs.next())
    {
        jo = rs.getInt("Jorge");
        bl = rs.getInt("Blanca");
        ma = rs.getInt("Maday");
        al = rs.getInt("Alan");
        je = rs.getInt("Jesus");
        es = rs.getInt("Esther");
        ju = rs.getInt("Julio");
        se = rs.getInt("Serra");
        pre = rs.getString("preguntas");

    }




%>

<script type="text/javascript">

	function exit()
	{
		window.location = "principal.jsp";
	}

    
</script>

 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);


      jorge=<%=jo%>;
      blanca=<%=bl%>;
      maday=<%=ma%>;
      serra=<%=se%>;
      julio=<%=ju%>;
      esther=<%=es%>;
      alan=<%=al%>;
      jesus=<%=je%>;


      function drawChart() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Votos');
        data.addRows([
          ['Jorge', jorge],
          ['Blanca', blanca],
          ['Esther', esther],
          ['Maday', maday],
          ['Serra', serra],
          ['Jesus', jesus],
          ['Julio', julio],
          ['Alan', alan]
        ]);

        // Set chart options
        var options = {
                       'width':700,
                       'height':500};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>

<body background="complementos/imagen/fondo6.jpg">
<form action="" autocomplete="off" method="post" name="forma">
	<input type="hidden" id="xAccion"  name="xAccion" value="<%=accion%>">
	
		
		<div align="center">
							<h2><%=pre%></h2>

		</div>
	


<div align="center">


         <!--Div that will hold the pie chart-->
    <div id="chart_div"></div>

</div>

		<div align="right">
					<a href="graficas7.jsp"><img width="100" height="50" align="left" src="complementos/imagen/regresar.png"></a>
                    <a href="graficas9.jsp"><img width="100" height="50" align="right" src="complementos/imagen/siguiente.png"></a>
		</div>
	
</form>
</body>
</html>


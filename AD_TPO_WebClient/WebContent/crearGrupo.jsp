<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="dtos.JugadorDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TPO AD 2018 - Crear Grupo</title>

<%

	String apodoJugador = request.getParameter("apodoJugador");
	int idJugador = Integer.valueOf(request.getParameter("idJugador")).intValue();
	
	JugadorDTO jugador = new JugadorDTO();
	
	jugador.setApodo(apodoJugador);
	jugador.setId(idJugador);
	
	request.setAttribute("jugador", jugador);

%>


<script type="text/javascript">


	function mostrarError(error) {
		document.write(error);
	}

</script>
</head>
<body>

<div class="container bg-faded">
    <h1 class="text-center">Truco web - Login</h1>
    <hr>
<br><br>
<div class="row">
        <div class="col-6 mx-auto">
            <!-- <div class="card card-body mb-2"> -->
            <form action="CrearGrupoServlet?apodoJugador=<%=jugador.getApodo()%>&idJugador=<%=jugador.getId()%>" method=post>
              <div class="form-group">
                <label for="apodo">Nombre del grupo nuevo:</label>
                <input type="text" class="form-control" id="campoNombreGrupo" name="nombreGrupo">
              </div>
             
              <button type="submit" class="btn btn-default">Crear</button>
            </form>    
    <br><br>
      <div align="center">
     	  <button class="btn btn-default" onclick="location.href='VolverAlMenu?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>'">Volver al menú</button> 
              </div></div>
        </div>
            <hr>
        
</div>
</body>
</html>





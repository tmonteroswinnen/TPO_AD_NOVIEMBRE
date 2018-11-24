<%@page import="dtos.JugadorDTO"%>
<%@page import="dtos.GrupoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="es">


<head>
  <title>Opciones de Juego</title>
  
  	<%

	String apodoJugador = request.getParameter("apodoJugador");
	int idJugador = Integer.valueOf(request.getParameter("idJugador")).intValue();
	
	JugadorDTO jugador = new JugadorDTO();
	
	jugador.setApodo(apodoJugador);
	jugador.setId(idJugador);
	

%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
  


  <div class="container bg-faded">
    <h1 class="text-center">Opciones de Juego</h1>
    <hr>
     <div class="row">
        <div class="col-6 mx-auto">
            <!-- <div class="card card-body mb-2"> -->
            
              <div>
			<input type="image" src="images/individual.png"  height="42" width="42"
			onclick="location.href='CrearPartidaIndividualServlet?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>'"/>    
			<p class="btn btn-default">Libre Individual</p>
			<hr>
				
				</div>
               <div>
			<input type="image" src="images/individualPareja.png"  height="42" width="62" onclick="location.href='opcionesJuego.jsp'"/>
			<p class="btn btn-default">Libre Parejas</p>
			<hr>
				
				</div>
               <div>
			<input type="image" src="images/cerrada.png"  height="42" width="42" onclick="location.href='opcionesJuego.jsp'"/>
			<p class="btn btn-default">Cerrada</p>
			<hr>
				
				</div>
            </div>
        </div>
        </div>

</body>
</html>
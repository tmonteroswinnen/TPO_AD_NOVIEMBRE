<%@page import="dtos.JugadorDTO"%>
<%@page import="dtos.PartidoDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Truco - Ranking</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-end">
      <a class="navbar-brand" href="#">TRUCO - WEB</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#">Grupos</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Rankings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Jugar</a>
          </li>
        </ul>
      </div>
    </nav>
    
<%
	JugadorDTO jugador = (JugadorDTO) request.getAttribute("jugador");
	
	List<PartidoDTO> partidosTerminados = (List<PartidoDTO>)request.getAttribute("partidosTerminados");
%>

	
	  <div class="container bg-faded">
        <h2 class="text-center">Ranking</h2> 
        <h3 class="text-center"><%=jugador.getApodo()%></h3> 
        <hr>
	<table class="table table-bordered table-dark" >
	  <tr>
	    <th scope="Categoria">Categoria</th>
	    <td><p><%=jugador.getCategoria()%></p></td>
	  </tr>
	  <tr>
	    <th scope="Cantidad de Puntos">Cantidad de Puntos</th>
	    <td><%=jugador.getRanking().getPuntos()%></td>
	  </tr>
	  <tr>
	    <th scope="Cantidad Ganadas">Cantidad Ganadas</th>
	    <td><%=jugador.getRanking().getCantidadGanadas()%></td>
	  </tr>
	  <tr>
	    <th scope="Promedio">Promedio</th>
	    <td><%    
	    if(jugador.getRanking().getPuntos()==0)
	    {
	    	%><%=0%><%	
	    }
	    else{%>
	    <%=jugador.getRanking().getPuntos()/jugador.getRanking().getCantidadGanadas()%><%}%></td>
	  </tr>
	</table>
	
	
	
	<table class="table table-bordered table-dark" >
	  <tr>
	    <th width="81" scope="IdPartido">ID_Partido</th>
	    <th width="118" scope="Fecha_Juego">Fecha de Juego</th>
	    <th width="102" scope="Resultado">Resultado</th>
	    <th width="143" scope="Reproducir">Reproducir</th>
	  </tr>
	  <% for(PartidoDTO part: partidosTerminados){%>
		  
	  <tr>
	    <td><%=part.getId()%></td>
	    <td><%=part.getFechaInicio()%></td>
	    <td><% if((part.getParejaGanadora().getJugador1().equals(jugador.getApodo()))||(part.getParejaGanadora().getJugador2().equals(jugador.getApodo())))
	    		{
				 %>Ganaste<%}
	    	   else %>Perdiste</td>
	    <td><input type="submit" class="btn btn-default" value="Reproducir" onclick="location.href='ReproducirPartido?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>&idPartido=<%=part.getId()%>&ultimoMovimiento=<%=0%>'"/></td>
	   </tr>
	  <%}%>
	</table>
	</div>
	
	<div align="center">
	<input class="btn btn-default" type="submit" value="Volver al Menu" onclick="location.href='VolverAlMenu?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>'"/>    
	</div>
</body>
</html>
<!DOCTYPE html>
<%@page import="dtos.JugadorDTO" %>
<%@page import="dtos.BazaDTO" %>
<%@ page import="enums.EstadoPartido"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="enums.TipoEnvite"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>

<!-- IMPORTO LOS DTOS -->
<%@ page import="dtos.*"%>
<html lang="es">

<head>

  <title>Partido: <%= ((PartidoDTO) request.getAttribute("miPartido")).getId() %></title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">



<%

JugadorDTO yo = (JugadorDTO) request.getAttribute("jugador");
EstadoPartido estadoPartido = (EstadoPartido) request.getAttribute("estadoPartido");

//if (!estadoPartido.equals(EstadoPartido.Terminado)) 


	List<BazaDTO> bazas = (List<BazaDTO>) request.getAttribute("bazas");
	JugadorDTO jugadorActual = (JugadorDTO) request.getAttribute("jugadorActual");
	PartidoDTO miPartido = (PartidoDTO) request.getAttribute("miPartido");
	List<ParejaDTO> parejas = (List<ParejaDTO>) request.getAttribute("parejas");
	List<CartaJugadorDTO> misCartas = (List<CartaJugadorDTO>) request.getAttribute("misCartas");
	List<PuntajeParejaDTO> puntajes = (List<PuntajeParejaDTO>) request.getAttribute("puntajes");
	List<JugadorDTO> ganadoresBazas = (List<JugadorDTO>) request.getAttribute("ganadoresBazas");
// 	List<MovimientoDTO> movimientosBazas = (List<MovimientoDTO>) request.getAttribute("movimientos");

	List<TipoEnvite> envites = new ArrayList<TipoEnvite>();	
	if(jugadorActual.getId()== yo.getId()) {
		envites = (List<TipoEnvite>) request.getAttribute("envites");
	}
	

	String j1c1,j1c2,j1c3;

	// Cargamos nuestras cartas!
	j1c1 = "./images/cartas/" + misCartas.get(0).getCarta().getNombreImagen();
	j1c2 = "./images/cartas/" + misCartas.get(1).getCarta().getNombreImagen();
	j1c3 = "./images/cartas/" + misCartas.get(2).getCarta().getNombreImagen();

	// Declaro las variables Nombre de jugadores
	String jugador1 = yo.getApodo();
	String jugador2 = "N/A";
	String jugador3 = "N/A";
	String jugador4 = "N/A";

	int puntosNuestros = 99;
	int puntosEllos = 99;

	// 'jugador1' es el que esta ubicado en la parte inferior de la ventana
	if (jugador1.equals((parejas.get(0).getJugador1()))) {
		// soy el jugador 1 de la pareja 1
		// ordeno la mesa a como la veria sentado
		// 'jugador2' es mi jugador a la derecha
		jugador2 = parejas.get(1).getJugador1();
		// 'jugador3' es mi compañero, sentado en frente mio
		jugador3 = parejas.get(0).getJugador2();
		// es mi jugador a la izquierda
		jugador4 = parejas.get(1).getJugador2();
		
		// Pertenezco a la Pareja 1
		puntosNuestros = puntajes.get(0).getPuntaje();
		puntosEllos = puntajes.get(1).getPuntaje();
	} else if (jugador1.equals((parejas.get(1).getJugador1()))) {
		// soy el jugador 1 de la pareja 2
		// 'jugador2' es mi jugador a la derecha
		jugador2 = parejas.get(0).getJugador2();
		// 'jugador3' es mi compañero, sentado en frente mio
		jugador3 = parejas.get(1).getJugador2();
		// es mi jugador a la izquierda
		jugador4 = parejas.get(0).getJugador1();

		// Pertenezco a la Pareja 2
		puntosNuestros = puntajes.get(1).getPuntaje();
		puntosEllos = puntajes.get(0).getPuntaje();
	} else if (jugador1.equals((parejas.get(0).getJugador2()))) {
		// soy el jugador 2 de la pareja 1
		// 'jugador2' es mi jugador a la derecha
		jugador2 = parejas.get(1).getJugador2();
		// 'jugador3' es mi compañero, sentado en frente mio
		jugador3 = parejas.get(0).getJugador1();
		// es mi jugador a la izquierda
		jugador4 = parejas.get(1).getJugador1();

		// Pertenezco a la Pareja 1
		puntosNuestros = puntajes.get(0).getPuntaje();
		puntosEllos = puntajes.get(1).getPuntaje();
	} else if (jugador1.equals((parejas.get(1).getJugador2()))) {
		// soy el jugador 2 de la pareja 2
		// 'jugador2' es mi jugador a la derecha
		jugador2 = parejas.get(0).getJugador1();
		// 'jugador3' es mi compañero, sentado en frente mio
		jugador3 = parejas.get(1).getJugador1();
		// es mi jugador a la izquierda
		jugador4 = parejas.get(0).getJugador2();

		// Pertenezco a la Pareja 2
		puntosNuestros = puntajes.get(1).getPuntaje();
		puntosEllos = puntajes.get(0).getPuntaje();
	} else {
		// ?????
	}
//}
%>

<script type="text/javascript">

	setInterval(function() { actualizar() }, 10000);
// 	setInterval(blinker, 1000);

	function actualizar() {
		window.location.href='RefrescarPartido?idJugador=<%=yo.getId()%>&apodoJugador=<%=yo.getApodo()%>&idPartido=<%=miPartido.getId()%>'
	}

//     function blinker() {
//     	$('.blinking').fadeOut(500);
//     	$('.blinking').fadeIn(500);
//     }

	function allowDrop(ev) {
		ev.preventDefault();
	}

	function drag(ev) {
		ev.dataTransfer.setData("text", ev.target.id);
	}

	function drop(ev) {
		ev.preventDefault();
		var carta = ev.dataTransfer.getData("text");
// 		ev.target.appendChild(document.getElementById(carta));

// 		document.getElementById(carta).draggable = false;
// 		document.getElementById("contenedorCarta1").ondrop = null;
// 		document.getElementById("contenedorCarta2").style.visibility = 'visible';

		window.location.href='gestionarMovimiento?idJugador=<%=yo.getId()%>&apodoJugador=<%=yo.getApodo()%>&movimiento=ct&idPartido=<%=miPartido.getId()%>&idCartaTirada=' + carta;
	} 

	</script>

</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark justify-content-end">
      <a class="navbar-brand" href="#">TRUCO - WEB</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="#">Grupos <span class="sr-only">(current)</span></a>
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
	    <hr>
	    <div class="mx-auto w-50 p-3 bg-dark text-white text-center">
	    
	      <span><%=yo.getApodo()%></span>
	    </div>
	    <hr>
    </div>
    <hr>

    <div class="container">
        <div class="row">
          <div class="col-10 mx-auto">
            <div class="card card-body mb-2"> <!-- Ésta es la mesa de juego -->
              <div class="container">
                <div class="card-deck mb-3">

                    <div class="jugadorEnMesa">
                      <h6><%=jugador1%></h6>
                    </div>

                    <div class="jugadorEnMesa">
                      <h6><%=jugador2 %></h6>
                    </div>

                    <div class="jugadorEnMesa">
                      <h6><%=jugador3 %></h6>
                    </div>

                    <div class="jugadorEnMesa">
                      <h6><%=jugador4 %></h6>
                    </div>

                </div>
                
                
                
                
                <!-- ACA EMPIEZA A RECORRERSE LAS BAZAS PARA PONER LAS CARTAS DONDE VAN DE CADA UNO -->
                
                
                <%                
                
				byte cantidadCartasTiradasJugador2 = 0;
				byte cantidadCartasTiradasJugador3 = 0;
				byte cantidadCartasTiradasJugador4 = 0;
				for (int i=0; i < bazas.size(); i++) {
					for (MovimientoDTO movimiento: bazas.get(i).getTurnosBaza()) {
						if (movimiento instanceof CartaTiradaDTO) {					
							CartaTiradaDTO cartaTirada = (CartaTiradaDTO) movimiento;
							CartaJugadorDTO cartaJugador = cartaTirada.getCartaJugador(); 
							if (cartaJugador.getJugador().getApodo().equals(jugador1)) {

								
%>


	                <div class="card-deck mb-3">
	
	                    <div class="cartaEnMesa">
	                      <img id=<%="cartaBaza" + bazas.get(i).getNumeroBaza() + "Jugador1"%> src=<%="images/cartas/" + cartaJugador.getCarta().getNombreImagen()%> alt=<%=cartaJugador.getCarta().getNombreImagen()%> draggable="false">
	                    </div>
	<%
				} else if (cartaJugador.getJugador().getApodo().equals(jugador2)) {
	%>
	                    <div class="cartaEnMesa">
	                      <img id=<%="cartaBaza" + bazas.get(i).getNumeroBaza() + "Jugador2"%> src=<%="images/cartas/" + cartaJugador.getCarta().getNombreImagen()%> alt=<%=cartaJugador.getCarta().getNombreImagen()%> draggable="false">
	                    </div>
	<%
					cantidadCartasTiradasJugador2++;
	
				} else if (cartaJugador.getJugador().getApodo().equals(jugador3)) {
	%>
	                    <div class="cartaEnMesa">
						<img id=<%="cartaBaza" + bazas.get(i).getNumeroBaza() + "Jugador3"%> src=<%="images/cartas/" + cartaJugador.getCarta().getNombreImagen()%> alt=<%=cartaJugador.getCarta().getNombreImagen()%> draggable="false">
	                    </div>
	<%
					cantidadCartasTiradasJugador3++;
	
				} else if (cartaJugador.getJugador().getApodo().equals(jugador4)) {
	%>
	                    <div class="cartaEnMesa">
	                      <img id=<%="cartaBaza" + bazas.get(i).getNumeroBaza() + "Jugador4"%> src=<%="images/cartas/" + cartaJugador.getCarta().getNombreImagen()%> alt=<%=cartaJugador.getCarta().getNombreImagen()%> draggable="false">
	                    </div>
	
	                </div>
	<%
					cantidadCartasTiradasJugador4++;

			}
		}
	}
}

%>
			<!-- ACA TERMINA LA RECORRIDA DE BAZAS -->
                <hr>

                <div class="card-deck mb-3">
					<%
					if (!misCartas.get(0).isTirada()) {
					%>
	                    <button class="carta" onclick="this.style.visibility='hidden'">
	                      <img class="carta" src="<%=j1c1 %>">
	                    </button>
	                <%
				    }
				    %>
	                  <%
					if (!misCartas.get(1).isTirada()) {
					%>  
	
	                    <button class="carta" onclick="this.style.visibility='hidden'">
	                      <img class="carta" src="<%=j1c2 %>">
	                    </button>
	 <%
				    }
				    %>
	                  <%
					if (!misCartas.get(2).isTirada()) {
					%> 
	                    <button class="carta" onclick="this.style.visibility='hidden'">
	                      <img class="carta" src="<%=j1c3 %>">
	                    </button>
	                    <%
				    }
				    %>

                </div>


              </div>
            </div>
          </div>

          <div class="col-2 mx-auto text-center">
              <div class="card card-body mb-2">
                <h6>Pareja 1</h6> <h11>(<%=jugador1%> & <%=jugador3%>)</h11>
                <h2><%=puntosNuestros%> </h2>
                <h6>Pareja 2</h6> <h11> (<%=jugador2%> & <%=jugador4%>)</h11>
                <h2><%=puntosEllos%></h2>
                <hr>
                <h6>Turno: <%=jugadorActual.getApodo()%></h6>
                <button type="button" class="btn btn-danger" onclick="location.reload()">Actualizar</button>
                <hr>
                <div>
                  <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Envites
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                      <%
                      for(TipoEnvite envite : envites)
                      {
                      
                      %>
                        <a class="dropdown-item" href="location.href='gestionarMovimiento?movimiento=env&nombreEnvite=<%=envite.name()%>&idJugador=<%=yo.getId()%>&apodoJugador=<%=yo.getApodo()%>&idPartido=<%=miPartido.getId()%>'"><%=envite%></a>
                        
                        <%
                      }
                        %>
                        
                      </div>
                  </div>
                  
                <hr>
                <% 
				    	//Marco los Ganadores de las Bazas
				    	JugadorDTO ganador;
				    
				    	for(int i=0; i<ganadoresBazas.size(); i++)
				    	{
				    		ganador= ganadoresBazas.get(i);
				    		%>  <h6>Ganador Baza <%=i+1%>: <%=ganador.getApodo()%></h6><br />
				    	
				    	<% }
				    	
						if(ganadoresBazas.size()<3){
							//Aun se esta jugando alguna mano
							%>
							<h6>Ganador Baza <%=ganadoresBazas.size()+1%>: En Juego</h6>
						<% }
				    %>  
                </div>
            </div>
          </div>
          
          
				
          <div class="col-12">
            <div class="card card-body mb-2 contexto">
			              <% 
			  for(BazaDTO baza: bazas){
			  	for(MovimientoDTO movimiento: baza.getTurnosBaza())
			  	{
				  %>
				  <tr>
				  	<%
				  		if(movimiento instanceof EnviteDTO)
				  		{
							// es un Envite
				  			%><td>Envite</td>
				  			  <td>El Jugador <%=((EnviteDTO)movimiento).getJugador().getApodo()%> canto <%=((EnviteDTO)movimiento).getTipoEnvite()%></td>
				  			  
				  		<% } else {
				  			// es una carta Tirada
				  		%>
				  			 <td>CartaTirada</td>
					  		 <td>El Jugador <%=((CartaTiradaDTO) movimiento).getCartaJugador().getJugador().getApodo()%> tiro el 
					  		 <%=((CartaTiradaDTO) movimiento).getCartaJugador().getCarta().toString()%></td> 
					  	<%}%>
			
					  	<td><%=movimiento.getFechaHora()%></td>
					  	</tr>  
				<%}
			  }%>
            </div>
          </div> 
          </div>
            
        <hr>
    
    </div>

    <script type="text/javascript">
      var repeater;

      function doWork() {
       $('#more').load('exp1.php');
       repeater = setTimeout(doWork, 1000);
      }

      doWork();
    </script>
    
   
    
</body>
</html></html>
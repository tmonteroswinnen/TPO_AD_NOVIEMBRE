<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<%@page import = "dtos.JugadorDTO" %>
<head>
  <title>Truco - Login</title>
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
    <% 
         JugadorDTO jg = (JugadorDTO) request.getAttribute("jugador");
     %>
      <span><%= jg.getApodo() %></span>
    </div>
    <hr>

    <div class="container bg-faded">
        <div class="row">
          <div class="col-10 mx-auto">
            <div class="card card-body mb-2"> <!-- �sta es la mesa de juego -->
              <div class="container">
                <div class="card-deck mb-3">

                    <button class="cartaEnMesa">
                      <img src="./images/cartas/basto (4).jpg">
                    </button>

                    <button class="cartaEnMesa">
                      <img src="./images/cartas/espada (10).jpg">
                    </button>

                    <button class="cartaEnMesa">
                      <img src="./images/cartas/espada (11).jpg">
                    </button>

                    <button class="cartaEnMesa">
                      <img src="./images/cartas/oro (7).jpg">
                    </button>

                </div>

                <hr>

                <div class="card-deck mb-3">

                    <button class="carta" onclick="this.style.visibility='hidden'">
                      <img class="carta" src="./images/cartas/basto (1).jpg">
                    </button>

                    <button class="carta" onclick="this.style.visibility='hidden'">
                      <img class="carta" src="./images/cartas/espada (1).jpg">
                    </button>

                    <button class="carta" onclick="this.style.visibility='hidden'">
                      <img class="carta" src="./images/cartas/espada (7).jpg">
                    </button>

                </div>


              </div>
            </div>
          </div>

          <div class="col-2 mx-auto text-center">
              <div class="card card-body mb-2">
                <h6>Pareja 1</h6>
                <h2>26</h2>
                <h6>Pareja 2</h6>
                <h2>18</h2>
                <hr>
                <button type="button" class="btn btn-danger" onclick="location.reload()">Actualizar</button>
                <hr>
                <div>
                  <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Envites
                      </button>
                      <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="#">Envido</a>
                        <a class="dropdown-item" href="#">Real Envido</a>
                        <a class="dropdown-item" href="#">Falta envido</a>
                      </div>
                  </div>
                <hr>  
                </div>
            </div>
          </div>

          <div class="col-12">
            <div class="card card-body mb-2 contexto">
              <p>Jugador 1 dijo envido.</p>
              <p>Jugador 3 dijo quiero.</p>
              <p>Jugador 2 gan� el envido con 28 puntos.</p>
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
</html>
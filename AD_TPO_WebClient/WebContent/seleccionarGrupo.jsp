<%@page import="dtos.JugadorDTO"%>
<%@page import="dtos.MiembroGrupoDTO"%>
<%@page import="dtos.GrupoDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <title>Truco - Grupos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <%
	JugadorDTO jugador = (JugadorDTO) request.getAttribute("jugador");
	
	GrupoDTO grupo = (GrupoDTO) request.getAttribute("grupo");

	//Voy a buscar la lista de grupos que tiene y los filtro por administrados.//
	if (jugador.getGrupos()!=null){
	
	//mensaje de debug//
	System.out.println("Grupos size: " + jugador.getGrupos().size());
	
	}else{
		System.out.println("Grupos size: 0");
	}
%>


<script>

	
	function confirmarSeleccionGrupo() {
		var selector = document.getElementById("grupoSelectField");
		var nombreGrupo = selector.options[selector.selectedIndex].text;
		var idGrupo = selector.options[selector.selectedIndex].value;
		
		if(idGrupo!=0){
			if (nombreGrupo){
				location.href='SeleccionarJugadoresCerrado?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>&idGrupo=' + idGrupo + '&nombreGrupo=' + nombreGrupo;
				return true;
				}
		}
		
		document.getElementById("divError").style.display = ''
		return false;	
		
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

    <div class="container bg-faded">
        <h1 class="text-center">Truco web - Grupos</h1>
        <hr>
        <div class="dropdown">
          <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenuButton" 
          data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Mis grupos
          </button>
          <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          
          <%
			for (GrupoDTO g : jugador.getGrupos()) {
		  %>
				<a class="dropdown-item" href="#"><%=g.getId()%> - <%=g.getNombre()%></a>
        <% }%>
            
          </div>
        </div>
        <hr>
        <table class="table table-bordered table-dark">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nombre</th>
              <th scope="col">Categoría</th>
              <th scope="col">Puntos</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th scope="row">1</th>
              <td>Martín</td>
              <td>Novato</td>
              <td>10000</td>
            </tr>
            <tr>
              <th scope="row">2</th>
              <td>Jacob</td>
              <td>Novato</td>
              <td>9000</td>
            </tr>
            <tr>
              <th scope="row">3</th>
              <td>Larry</td>
              <td>Novato</td>
              <td>7000</td>
            </tr>
          </tbody>
        </table>
        <hr>
        <button type="button" class="btn btn-danger">Jugar en éste grupo</button>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dtos.JugadorDTO"%>
<%@page import="dtos.MiembroGrupoDTO"%>
<%@page import="dtos.GrupoDTO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Grupo: <%= ((GrupoDTO) request.getAttribute("grupo")).getNombre() %></title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
<%
	JugadorDTO jugador = (JugadorDTO) request.getAttribute("jugador");
	
	List<MiembroGrupoDTO> miembros = (List<MiembroGrupoDTO>)request.getAttribute("miembrosGrupo");
	
	GrupoDTO grupo = (GrupoDTO) request.getAttribute("grupo");
	
	request.setAttribute("jugador", jugador);
	request.setAttribute("grupo", grupo);
%>
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
        <h1 class="text-center">Grupo: <%=grupo.getNombre()%></h1>
        <hr>
        
        <hr>
        <table class="table table-bordered table-dark">
          <thead>
          
          
            <tr>
              <th scope="col">#</th>
              <th scope="col">Miembro</th>
              <th scope="col">Estado</th>
              <th scope="col">Acciones</th>
            </tr>
          </thead>
          <tbody>
          
  			<% for(MiembroGrupoDTO miembro: miembros){%>
            <tr>
              <th scope="row">1</th>
              <td><%=miembro.getJugador()%></td>
              <td><%if(miembro.isActivo()){%>Activo<%}else{%>Inactivo<%} %></td>
              <td><input type="submit" class="btn btn-danger" value="Eliminar" 
              onclick="location.href='AdministrarGrupo?apodoMiembro=<%=miembro.getJugador()%>
              &idAdministrador=<%=jugador.getId()%>&apodoAdministrador=<%=jugador.getApodo()%>
              &nombreGrupo=<%=grupo.getNombre()%>&action=eliminar'"/></td>
              </tr>
              <%}%>
           
          </tbody>
        </table>
        <form  id="agregarMiembro" action="AdministrarGrupo?idAdministrador=<%=jugador.getId()%>&apodoAdministrador=<%=jugador.getApodo()%>&nombreGrupo=<%=grupo.getNombre()%>" method=post>
      <input type="text" id="campoApodo" name="apodoMiembro" class="form-control"/>
      <input type="submit" value="Agregar Miembro" class="btn btn-default"/>
            
	    <br><br>
    </form>
 <br><br>
<input class="btn btn-default" type="submit" value="Volver al Menu" onclick="location.href='VolverAlMenu?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>'"/>
    </div>
</body>
</html>
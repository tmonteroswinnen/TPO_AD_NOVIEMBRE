<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import= "enums.TipoPartido"%>
<%@ page import= "dtos.JugadorDTO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Esperando Jugadores</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="./css/style.css">
  <%
	TipoPartido tipoPartido = (TipoPartido) request.getAttribute("tipoPartido");
	JugadorDTO jugador = (JugadorDTO) request.getAttribute("jugador");
	Integer idUltimoPartido = (Integer) request.getAttribute("idUltimoPartido");
%>
  <script type="text/javascript">
	setInterval(function() { actualizar() }, 5000); // 4000

	function actualizar() {
		window.location.href='EsperandoPartido?tipoPartido=<%=tipoPartido.name()%>&idJugador=<%=jugador.getId()%>&apodoJugador=<%= jugador.getApodo()%>&idUltimoPartido=<%=idUltimoPartido.intValue()%>'
	}
</script>
</head>
<body>

<p><center><img src="images/loading.svg" width="268" height="212" align="middle"></center></p>
<p>&nbsp;</p>
<div id="contenedor">
  <div align="center">
  
  
  <div class="col-6 mx-auto">
            
              <div class="form-group">
                <label for="apodo">Buscando jugadores...</label>
              </div>
             
  </div>
  </div>
</div>
<p>
  <label></label>
</p>
<p>&nbsp;</p>
<div>
<input class="btn btn-default" type="submit" value="Volver al Menu" onclick="location.href='VolverAlMenu?idJugador=<%=jugador.getId()%>&apodoJugador=<%=jugador.getApodo()%>'"/>
    </div>
</body>
</html>
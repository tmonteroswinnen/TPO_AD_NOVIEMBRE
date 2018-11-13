<!DOCTYPE html>
<html lang="es">
<head>
  <title>Truco - Registro</title>
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
    <h1 class="text-center">Truco web - Registrarse</h1>
    <hr>
    <div class="row">
        <div class="col-6 mx-auto">
            <!-- <div class="card card-body mb-2"> -->
            <form action="RegistroServlet">
              <div class="form-group">
                <label for="apodo">Apodo:</label>
                <input type="text" class="form-control" id="apodo" name="apodo">
              </div>
              <div class="form-group">
                <label for="mail">e-mail:</label>
                <input type="text" class="form-control" id="mail" name="mail">
              </div>
              <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="text" class="form-control" id="contrasena" name="contrasena">
              </div>
              <button type="submit" class="btn btn-default">Registrarse</button>
            </form>
            </div>
        </div>
    <hr>
    </div>
   
    
</body>
</html>
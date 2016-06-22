<%@page import="accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Starter Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">JavaEE</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                    </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">
        <br><br><br>
            <div class="row">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Lista de Tareas</h3>
                    </div>
                    <div class="panel-body">
                        <a href="index.jsp" class="btn btn-primary">Asignar nueva tarea</a>
                        <br>
                        <br>
                        <table class="table table-condensed table-hover">
                            <thead>
                                <th>ID</th>
                                <th>Tarea</th>
                                <th>Responsable</th>
                                <th>Servicio</th>
                                <th>Unidad</th>
                            </thead>
                            <tbody>
                                <% Conexion con = new Conexion();
                                con.setConsulta("select t.*,r.nombre as nombre_responsable, s.nombre as nombre_servicio, u.nombre as nombre_unidad from tareas t, responsables r, servicios s, unidades u where s.servicio_id = u.servicio_id and u.unidad_id = r.unidad_id and t.responsable_id = r.reponsable_id ");
                                while(con.getResultado().next()){
                                    out.println("<tr>");
                                    out.println("<td>" + con.getResultado().getString("tarea_id") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("nombre") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("nombre_responsable") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("nombre_servicio") + "</td>");
                                    out.println("<td>" + con.getResultado().getString("nombre_unidad") + "</td>");
                                    out.println("</tr>");
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
  </body>
</html>

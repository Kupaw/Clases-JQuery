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

        <title>Trabajo JQuery</title>

        <!-- Bootstrap core CSS -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script>
            $(document).ready(function () {
                $('select').select2();
                $('#servicios').append('<option> Seleccionar Servicio</option>');
                $.get("http://localhost:8080/Jquery/Tarea", function (data, status) {
                    $.each(data, function (i, item) {
                        $("#servicios").append("<option value=" + item.servicio_id + ">" + item.nombre + "</option>");
                    });
                });
                $("#servicios").change(function () {
                    $("#unidades").empty();
                    var servicio_id = $("#servicios").val();
                    $.get("http://localhost:8080/Jquery/Tarea?servicio_id=" + servicio_id, function(data, status) {
                        $.each(data, function(i, item) {
                            $("#unidades").append("<option value=" + item.unidad_id + ">" + item.nombre + "</option>");
                        });
                    });
                });
            });
        </script>
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
                    <a class="navbar-brand" href="#">Project name</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div class="container">
            <br><br><br>
            <form>
                <div class="form-group">
                    <label for="servicios">Seleccionar Servicio</label>
                    <select name="servicio_id" id="servicios" class="form-control">

                    </select>
                </div>
                <div class="form-group">
                    <label for="unidades">Seleccionar Unidad</label>
                    <select name="unidad_id" id="unidades" class="form-control">

                    </select>
                </div>
                <div class="form-group">
                    <label for="responsable_id">Seleccionar Responsables</label>
                    <select name="reponsable_id" id="responsables" class="form-control">

                    </select>
                </div>
                <div class="form-group">
                    <label for="servicio">Asignar Tarea</label>
                    <textarea name="tarea" id="tareas" rows="4" class="form-control"></textarea>
                </div>
                <button type="submit" class="btn btn-danger" id="guardar">Asignar Tarea</button>
            </form>
        </div><!-- /.container -->


        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
</html>

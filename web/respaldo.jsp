<%-- 
    Document   : index
    Created on : 13-06-2016, 07:35:30 PM
    Author     : Administrador
--%>

<%@page import="accesodato.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>s
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <title>JSP Page</title>
        <script>
            $(document).ready(function(){
                $.get("http://localhost:8080/Jquery/Tarea", function(data,status){
                    $.each(data, function(i, item){
                        $("#servicios").append("<option value=" + item.servicio_id + ">" + item.nombre + "</option>");
                    });
                });
                $("#guardar").click(function(){
                    alert($("#servicios").val());
                });
            });
        </script>
    </head>
    <body>
        <select id="servicios">
        </select>
        <select id="unidades">
        </select>
        <select id="responsables">
        </select>
        <br />
        <br />
        <label for="tarea">Asignar tarea:</label>
        <input type="text" id="tarea" />
        <input type="button" value="Guardar" id="guardar" />
    </body>
    
</html>

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import accesodato.Conexion;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import negocio.Responsable;
import negocio.Servicio;
import negocio.Unidad;

/**
 *
 * @author Administrador
 */
public class Tarea extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //Conexion
            Conexion con = new Conexion();
            if(request.getParameter("guardar") != null){
                String nombre = request.getParameter("tarea");
                int responsable_id = Integer.parseInt(request.getParameter("reponsable_id"));
                String fecha_tarea = request.getParameter("fecha_tarea");
                con.setInsertar("insert into tareas(nombre,responsable_id,estado,fecha_tarea) values('" + nombre + "','" + responsable_id +"','Activo','" + fecha_tarea + "');");
                response.sendRedirect("index.jsp");
            }
            if(request.getParameter("servicio_id") != null){
                String servicio_id = request.getParameter("servicio_id");
                con.setConsulta("select * from unidades where servicio_id = '" + servicio_id + "'");
                ArrayList lista = new ArrayList();
                try {
                    while(con.getResultado().next()) {
                        Unidad uni = new Unidad();
                        uni.setUnidad_id(con.getResultado().getInt("unidad_id"));
                        uni.setNombre(con.getResultado().getString("nombre"));
                        uni.setEstado(con.getResultado().getString("estado"));
                        uni.setServicio_id(con.getResultado().getInt("servicio_id"));
                        lista.add(uni);
                    }
                } catch (SQLException ex){
                    
                }
                //variable json con arraylist
            String json = new Gson().toJson(lista);
            //setear aplicacion json
            response.setContentType("application/json");
            //encodear a utf8
            response.setCharacterEncoding("UTF-8");
            //mostrar o imprimir el json
            response.getWriter().write(json);
            }
            else if(request.getParameter("unidad_id") != null){
                String unidad_id = request.getParameter("unidad_id");
                con.setConsulta("select * from responsables where unidad_id = '" + unidad_id + "'");
                ArrayList lista = new ArrayList();
                try {
                    while(con.getResultado().next()) {
                        Responsable res = new Responsable();
                        res.setReponsable_id(con.getResultado().getInt("reponsable_id"));
                        res.setNombre(con.getResultado().getString("nombre"));
                        res.setEstado(con.getResultado().getString("estado"));
                        res.setUnidad_id(con.getResultado().getInt("unidad_id"));
                        lista.add(res);
                    }
                } catch (SQLException ex){
                    
                }
                //variable json con arraylist
            String json = new Gson().toJson(lista);
            //setear aplicacion json
            response.setContentType("application/json");
            //encodear a utf8
            response.setCharacterEncoding("UTF-8");
            //mostrar o imprimir el json
            response.getWriter().write(json);
            }
            else {
                con.setConsulta("select * from Servicios");
            ArrayList lista = new ArrayList();
            //Crear objetos y guardarlos en lista
            try {
                while(con.getResultado().next()){
                    Servicio serv = new Servicio();
                    serv.setServicio_id(con.getResultado().getInt("servicio_id"));
                    serv.setNombre(con.getResultado().getString("nombre"));
                    serv.setEstado(con.getResultado().getString("estado"));
                    lista.add(serv);
                }
            } catch (SQLException ex) {
            }
            //variable json con arraylist
            String json = new Gson().toJson(lista);
            //setear aplicacion json
            response.setContentType("application/json");
            //encodear a utf8
            response.setCharacterEncoding("UTF-8");
            //mostrar o imprimir el json
            response.getWriter().write(json);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

package negocio;

import accesodato.Conexion;

public class Tarea {
    private int tarea_id;
    private String nombre;
    private String estado;
    private int reponsable_id;

    public int getTarea_id() {
        return tarea_id;
    }

    public void setTarea_id(int tarea_id) {
        this.tarea_id = tarea_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getReponsable_id() {
        return reponsable_id;
    }

    public void setReponsable_id(int reponsable_id) {
        this.reponsable_id = reponsable_id;
    }
    
}

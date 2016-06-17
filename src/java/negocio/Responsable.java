package negocio;

import accesodato.Conexion;

public class Responsable {
    private int reponsable_id;
    private String nombre;
    private int unidad_id;
    private String estado;

    public int getReponsable_id() {
        return reponsable_id;
    }

    public void setReponsable_id(int reponsable_id) {
        this.reponsable_id = reponsable_id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getUnidad_id() {
        return unidad_id;
    }

    public void setUnidad_id(int unidad_id) {
        this.unidad_id = unidad_id;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}

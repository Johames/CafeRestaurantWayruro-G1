/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.entidad;

/**
 * 
 * @author TOSHIBA
 */
public class AgregarContrato {
    private String nombre;
    private String apellido;
    private String dn;
    private String ncelular;
    private String direcciones;
    private String fechini;
    private String precio;
    private String stado;
    private String idusuario;

    public AgregarContrato() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDn() {
        return dn;
    }

    public void setDn(String dn) {
        this.dn = dn;
    }

    public String getNcelular() {
        return ncelular;
    }

    public void setNcelular(String ncelular) {
        this.ncelular = ncelular;
    }

    public String getDirecciones() {
        return direcciones;
    }

    public void setDirecciones(String direcciones) {
        this.direcciones = direcciones;
    }

    public String getFechini() {
        return fechini;
    }

    public void setFechini(String fechini) {
        this.fechini = fechini;
    }

    public String getPrecio() {
        return precio;
    }

    public void setPrecio(String precio) {
        this.precio = precio;
    }

    public String getStado() {
        return stado;
    }

    public void setStado(String stado) {
        this.stado = stado;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }
    
}

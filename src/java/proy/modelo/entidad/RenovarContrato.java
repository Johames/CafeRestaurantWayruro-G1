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
public class RenovarContrato {
    private int idpersona;
    private String fechini;
    private String precio;
    private String stado;
    private String idusuario;

    public RenovarContrato() {
    }

    public int getIdpersona() {
        return idpersona;
    }

    public void setIdpersona(int idpersona) {
        this.idpersona = idpersona;
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

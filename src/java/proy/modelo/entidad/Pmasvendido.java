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
public class Pmasvendido {
    private String nombreprod;
    private String fechaventa;
    private String cantidad;

    public Pmasvendido() {
    }

    public String getNombreprod() {
        return nombreprod;
    }

    public void setNombreprod(String nombreprod) {
        this.nombreprod = nombreprod;
    }

    public String getFechaventa() {
        return fechaventa;
    }

    public void setFechaventa(String fechaventa) {
        this.fechaventa = fechaventa;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }
    
}

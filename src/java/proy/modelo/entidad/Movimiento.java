package proy.modelo.entidad;
// Generated 28/05/2015 08:11:49 PM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Movimiento generated by hbm2java
 */
public class Movimiento  implements java.io.Serializable {


     private short idMovimiento;
     private Usuario usuario;
     private String tipo;
     private String idDocumento;
     private Date fecha;
     private String importe;

    public Movimiento() {
    }

	
    public Movimiento(short idMovimiento) {
        this.idMovimiento = idMovimiento;
    }
    public Movimiento(short idMovimiento, Usuario usuario, String tipo, String idDocumento, Date fecha, String importe) {
       this.idMovimiento = idMovimiento;
       this.usuario = usuario;
       this.tipo = tipo;
       this.idDocumento = idDocumento;
       this.fecha = fecha;
       this.importe = importe;
    }
   
    public short getIdMovimiento() {
        return this.idMovimiento;
    }
    
    public void setIdMovimiento(short idMovimiento) {
        this.idMovimiento = idMovimiento;
    }
    public Usuario getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public String getIdDocumento() {
        return this.idDocumento;
    }
    
    public void setIdDocumento(String idDocumento) {
        this.idDocumento = idDocumento;
    }
    public Date getFecha() {
        return this.fecha;
    }
    
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    public String getImporte() {
        return this.importe;
    }
    
    public void setImporte(String importe) {
        this.importe = importe;
    }




}


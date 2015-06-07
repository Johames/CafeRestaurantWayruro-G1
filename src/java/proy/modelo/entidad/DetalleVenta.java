package proy.modelo.entidad;

public class DetalleVenta   {

     private int idVenta;
     private int idProducto;
     private String precioUnitario;
     private String cantPlato;
     private String precioTotal;

    public DetalleVenta() {
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(String precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    public String getCantPlato() {
        return cantPlato;
    }

    public void setCantPlato(String cantPlato) {
        this.cantPlato = cantPlato;
    }

    public String getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(String precioTotal) {
        this.precioTotal = precioTotal;
    }

    
}



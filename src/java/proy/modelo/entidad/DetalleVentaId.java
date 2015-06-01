package proy.modelo.entidad;
// Generated 28/05/2015 08:11:49 PM by Hibernate Tools 4.3.1



/**
 * DetalleVentaId generated by hbm2java
 */
public class DetalleVentaId  implements java.io.Serializable {


     private short idVenta;
     private short idProducto;

    public DetalleVentaId() {
    }

    public DetalleVentaId(short idVenta, short idProducto) {
       this.idVenta = idVenta;
       this.idProducto = idProducto;
    }
   
    public short getIdVenta() {
        return this.idVenta;
    }
    
    public void setIdVenta(short idVenta) {
        this.idVenta = idVenta;
    }
    public short getIdProducto() {
        return this.idProducto;
    }
    
    public void setIdProducto(short idProducto) {
        this.idProducto = idProducto;
    }


   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof DetalleVentaId) ) return false;
		 DetalleVentaId castOther = ( DetalleVentaId ) other; 
         
		 return (this.getIdVenta()==castOther.getIdVenta())
 && (this.getIdProducto()==castOther.getIdProducto());
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + this.getIdVenta();
         result = 37 * result + this.getIdProducto();
         return result;
   }   


}


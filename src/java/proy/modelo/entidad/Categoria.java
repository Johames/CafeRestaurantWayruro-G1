package proy.modelo.entidad;
// Generated 28/05/2015 08:11:49 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private int idCategoria;
     private String nombreCat;
     private Set productos = new HashSet(0);

    public Categoria() {
    }

	
    public Categoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    public Categoria(int idCategoria, String nombreCat, Set productos) {
       this.idCategoria = idCategoria;
       this.nombreCat = nombreCat;
       this.productos = productos;
    }
   
    public int getIdCategoria() {
        return this.idCategoria;
    }
    
    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }
    public String getNombreCat() {
        return this.nombreCat;
    }
    
    public void setNombreCat(String nombreCat) {
        this.nombreCat = nombreCat;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}



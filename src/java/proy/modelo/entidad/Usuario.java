package proy.modelo.entidad;
// Generated 28/05/2015 08:11:49 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private int idUsuario;
     private Persona persona;
     private Rol rol;
     private String usuario;
     private String contrasena;
     private String estado;
     private Set ventas = new HashSet(0);
     private Set movimientos = new HashSet(0);
     private Set contratoPensionistas = new HashSet(0);
     private Set productos = new HashSet(0);

    public Usuario() {
    }

	
    public Usuario(Persona persona) {
        this.persona = persona;
    }
    public Usuario(Persona persona, Rol rol, String usuario, String contrasena, String estado, Set ventas, Set movimientos, Set contratoPensionistas, Set productos) {
       this.persona = persona;
       this.rol = rol;
       this.usuario = usuario;
       this.contrasena = contrasena;
       this.estado = estado;
       this.ventas = ventas;
       this.movimientos = movimientos;
       this.contratoPensionistas = contratoPensionistas;
       this.productos = productos;
    }
   
    public int getIdUsuario() {
        return this.idUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    public Persona getPersona() {
        return this.persona;
    }
    
    public void setPersona(Persona persona) {
        this.persona = persona;
    }
    public Rol getRol() {
        return this.rol;
    }
    
    public void setRol(Rol rol) {
        this.rol = rol;
    }
    public String getUsuario() {
        return this.usuario;
    }
    
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public String getContrasena() {
        return this.contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    public String getEstado() {
        return this.estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    public Set getVentas() {
        return this.ventas;
    }
    
    public void setVentas(Set ventas) {
        this.ventas = ventas;
    }
    public Set getMovimientos() {
        return this.movimientos;
    }
    
    public void setMovimientos(Set movimientos) {
        this.movimientos = movimientos;
    }
    public Set getContratoPensionistas() {
        return this.contratoPensionistas;
    }
    
    public void setContratoPensionistas(Set contratoPensionistas) {
        this.contratoPensionistas = contratoPensionistas;
    }
    public Set getProductos() {
        return this.productos;
    }
    
    public void setProductos(Set productos) {
        this.productos = productos;
    }




}



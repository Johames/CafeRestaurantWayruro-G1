package proy.modelo.entidad;

public class Persona  implements java.io.Serializable {


     private short idPersona;
     private String nombres;
     private String apellidos;
     private String dni;
     private String NCelular;
     private String direccion;

    public Persona() {
    }

	
    public Persona(short idPersona) {
        this.idPersona = idPersona;
    }
    public Persona(short idPersona, String nombres, String apellidos, String dni, String NCelular, String direccion) {
       this.idPersona = idPersona;
       this.nombres = nombres;
       this.apellidos = apellidos;
       this.dni = dni;
       this.NCelular = NCelular;
       this.direccion = direccion;
    }
   
    public short getIdPersona() {
        return this.idPersona;
    }
    
    public void setIdPersona(short idPersona) {
        this.idPersona = idPersona;
    }
    public String getNombres() {
        return this.nombres;
    }
    
    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getDni() {
        return this.dni;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getNCelular() {
        return this.NCelular;
    }
    
    public void setNCelular(String NCelular) {
        this.NCelular = NCelular;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }




}



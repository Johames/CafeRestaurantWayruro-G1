package proy.modelo.entidad;
// Generated 28/05/2015 08:11:49 PM by Hibernate Tools 4.3.1



/**
 * ControlPensionista generated by hbm2java
 */
public class ControlPensionista  implements java.io.Serializable {


     private ControlPensionistaId id;
     private ContratoPensionista contratoPensionista;
     private String control;

    public ControlPensionista() {
    }

	
    public ControlPensionista(ControlPensionistaId id, ContratoPensionista contratoPensionista) {
        this.id = id;
        this.contratoPensionista = contratoPensionista;
    }
    public ControlPensionista(ControlPensionistaId id, ContratoPensionista contratoPensionista, String control) {
       this.id = id;
       this.contratoPensionista = contratoPensionista;
       this.control = control;
    }
   
    public ControlPensionistaId getId() {
        return this.id;
    }
    
    public void setId(ControlPensionistaId id) {
        this.id = id;
    }
    public ContratoPensionista getContratoPensionista() {
        return this.contratoPensionista;
    }
    
    public void setContratoPensionista(ContratoPensionista contratoPensionista) {
        this.contratoPensionista = contratoPensionista;
    }
    public String getControl() {
        return this.control;
    }
    
    public void setControl(String control) {
        this.control = control;
    }




}


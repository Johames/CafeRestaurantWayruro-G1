/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package consola;


import com.mchange.v2.c3p0.test.ListTablesTest;
import proy.modelo.entidad.Usuario;
import proy.modelo.dao.Pensionistadao;
import proy.modelo.dao.Usuariodao;
import proy.modelo.daoImpl.PensionistadoaImpl;
import proy.modelo.daoImpl.UsuariodaoImpl;
import proy.modelo.entidad.Listar_pensionista;
import proy.modelo.entidad.Persona;

/**
 *
 * @author TOSHIBA
 */
public class NewMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        NewMain main = new NewMain();
        
        //main.agregar();
        //main.comprobar();
        main.buscar();
        
    }
    
    /*public void agregar (){
        Pensionistadao pen = new PensionistadoaImpl();
        Persona persona = new Persona();
        
        persona.setNombres("Juan");
        persona.setApellidos("Sandoval Cardenas");
        persona.setDni("86738624");
        persona.setNCelular("987365274");
        persona.setDireccion("Jr. Mejia 354");
        
        if(pen.RenovarContrato(co)){
            System.out.println("Se Agregó Correctamente");
        } else {
            System.out.println("Ocurrió un Error");
        }
        
    }
    
    public void buscar(String dni){
        Pensionistadao pen = new PensionistadoaImpl();
    }*/
    
    
    public void comprobar(){
        Usuariodao user = new UsuariodaoImpl();
        String id_usuario = "";
        //usuario us = new usuario();
        id_usuario = user.ComprobarUsuario("admin", "1234");
        System.out.println("ID : "+id_usuario);
    }
    
    public void buscar(){
        Pensionistadao dao = new PensionistadoaImpl();
        
        for (Listar_pensionista pensionista : dao.ListarPensionista()) {
            System.out.println(pensionista.getNombres());
        }
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import proy.modelo.dao.Personadao;
import proy.modelo.entidad.Persona;
/**
 *
 * @author TOSHIBA
 */
public class PersonadaoImpl implements Personadao{

    public Connection  abrirConexion(){
        return conexion.OracleConexion.conectar();
    }
    
    public  void cerrarConexion(){
        try {
            conexion.OracleConexion.conectar().close();
        } catch (Exception e) {
        }
    }
    
    public void guardar(){
        try {
            abrirConexion().commit();
        } catch (Exception e) {
        }
    }
    
    public void revertir(){
        try {
            abrirConexion().rollback();
        } catch (Exception e) {
        }
    }
    
    @Override
    public boolean EliminarPersona(int id) {
        boolean flat = false;
        Statement st = null;
        String query = "delete FROM PERSONA WHERE ID_PERSONA ="+id;
        
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            flat = false;
            try {
                revertir();
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public Persona BuscarPensionista(String dni) {
        Statement st = null;
        ResultSet rs = null;
        String query = "SELECT * FROM persona WHERE dni='"+dni+"'";
        Persona persona = null;
        
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {   
                persona = new Persona();  
                persona.setNombres(rs.getString("nombres"));
                persona.setApellidos(rs.getString("apelllidos"));
                persona.setDni(rs.getString("dni"));
                persona.setNCelular(rs.getString("ncelular"));
                persona.setDireccion(rs.getString("direccion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return persona;
    }
    
}

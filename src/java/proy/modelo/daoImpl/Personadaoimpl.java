/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import proy.modelo.dao.Personadao;
import proy.modelo.entidad.Listar_Usuario;
import proy.modelo.entidad.Persona;

/**
 *
 * @author USUARIO
 */
public class Personadaoimpl implements Personadao {
public Connection abrirConexion() {
        return conexion.OracleConexion.conectar();
    }

    public void cerrarConexion() {
        try {
            conexion.OracleConexion.conectar().close();
        } catch (Exception e) {
        }
    }

    public void guardar() {
        try {
            abrirConexion().commit();
        } catch (Exception e) {
        }
    }

    public void revertir() {
        try {
            abrirConexion().rollback();
        } catch (Exception e) {
        }
    }
    @Override
    public List<Persona> buscarpordni(String dni,String nombres,String apellidos) {
       List<Persona> lista = new ArrayList<Persona>();
        Statement st = null;
        ResultSet rs = null;
        Persona listar = null;
        String query = " select id_persona,nombres,apellidos,dni,direccion from persona where dni like '%"+dni+"%'"
                + " and  nombres like '%"+nombres+"%'and apellidos like '%"+apellidos+"%'";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                listar = new Persona();
                listar.setIdPersona(rs.getShort("id_persona"));
                listar.setNombres(rs.getString("nombres"));
                listar.setApellidos(rs.getString("apellidos"));
                listar.setDni(rs.getString("dni"));
                listar.setDireccion(rs.getString("direccion"));

                lista.add(listar);
            }
            cerrarConexion();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
            System.out.println(e.getMessage());
        }
        return lista;
    }

    @Override
    public boolean registrarpersona(Persona persona) {
        boolean flat = false;
        Statement st = null;
        String query = "insert into persona values('','"+persona.getNombres()+"','"+persona.getApellidos()
                +"','"+persona.getDni()+"','"+persona.getNCelular()+"','"+persona.getDireccion()+"')";
        
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
    
}

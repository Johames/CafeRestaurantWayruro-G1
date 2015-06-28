/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import java.sql.Connection;
import java.sql.Statement;
import proy.modelo.dao.Controldao;
import proy.modelo.entidad.Controldia;

/**
 *
 * @author TOSHIBA
 */
public class ControldaoImpl implements Controldao{

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
    public boolean AgregarControl(Controldia control) {
        boolean flat = false;
        Statement st= null;
        String query = " begin controldia('"+control.getOpc()+"', '"+control.getIdContrato()+"');end; ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                revertir();
                cerrarConexion();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import java.sql.Connection;
import java.sql.ResultSet;
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

    @Override
    public String ComprobarControl(String idc) {
        String control = null;
        String query = "select control from control_pensionista where id_contrato='"+idc+"' and fecha= (select to_char(sysdate, 'dd/mm/yyyy') from dual) ";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            if (rs.next()) {
                control = rs.getString("control");
            }
            cerrarConexion();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return control;
    }
    
}

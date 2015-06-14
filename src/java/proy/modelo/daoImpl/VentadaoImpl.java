/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import java.sql.Connection;
import java.sql.Statement;
import proy.modelo.dao.Ventadao;
import proy.modelo.entidad.Agregar_Venta;
import proy.modelo.entidad.Venta;

public class VentadaoImpl implements Ventadao{

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
    public boolean AgregarVenta(Agregar_Venta agregarv) {
     
     boolean estado=false;
     Statement st=null;
     String query="BEGIN REGISTROVENTA('"+agregarv.getIdpersona()+"',"
                    + "'"+agregarv.getTipo()+"',"
                    + "'"+agregarv.getIdusuario()+"',"
                    + "'"+agregarv.getIdproducto()+"',"
                    + "'"+agregarv.getPrecio()+"',"
                    + "'"+agregarv.getCantidad()+"',"
                    + "'"+agregarv.getControlp()+"'); END;";
        try {
        st=abrirConexion().createStatement();
        st.executeUpdate(query);
            abrirConexion().commit();
            abrirConexion().close();
            estado=true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                abrirConexion().rollback();
                abrirConexion().close();
                estado=false;
            } catch (Exception ex) {
            }
        }
           
    return estado;
    }
    
}

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
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import proy.modelo.dao.Categoriadao;
import proy.modelo.entidad.Categoria;
import proy.modelo.entidad.Producto;
import proy.modelo.util.HibernateUtil;

/**
 *
 * @author TOSHIBA
 */
public class CategoriadaoImpl implements Categoriadao{
    
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
    public List<Categoria> ListarCategoria() {
        /*List<Categoria> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Categoria>();
            Query query = session.createQuery("FROM Categoria");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;*/
        List<Categoria> lista = new ArrayList<Categoria>();
        Statement st = null;
        ResultSet rs = null;
        Categoria cat = null;
        String query = "select id_categoria as id, nombre_cat as categoria from categoria ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                cat = new Categoria();
                cat.setIdCategoria(rs.getShort("id"));
                cat.setNombreCat(rs.getString("categoria"));
                lista.add(cat);
            }
            abrirConexion().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                abrirConexion().close();
            } catch (Exception ex) {
                
            }
        }
        return lista;
    }

    @Override
    public boolean AgregarCategoria(Categoria cat) {
        boolean estado = false;
        Statement st= null;
        String query="insert into CATEGORIA values ('', '"+cat.getNombreCat()+"') ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                revertir();
                cerrarConexion();
                estado = false;
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    
    
}

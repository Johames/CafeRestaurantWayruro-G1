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
import org.hibernate.Transaction;
import proy.modelo.entidad.Producto;
import proy.modelo.dao.Productodao;
import proy.modelo.entidad.Categoria;
import proy.modelo.util.HibernateUtil;


/**
 *
 * @author TOSHIBA
 */
public class ProductodaoImpl implements Productodao{

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
    public List<Producto> ListarPlatos() {
        List<Producto> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Producto>();
            Query query = session.createQuery("FROM PRODUCTO where idCategoria='1'");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
       
    }

    @Override
    public List<Producto> ListarBebidas() {
        List<Producto> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Producto>();
            Query query = session.createQuery("FROM Producto where idCategoria='2'");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public List<Producto> ListPostres() {
        List<Producto> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Producto>();
            Query query = session.createQuery("FROM Producto where idCategoria='3'");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public boolean EliminarProducto(int id) {
    boolean flat = false;
        Statement st = null;
        String query = "delete FROM Producto WHERE ID_PRODUCTO ="+id;
        
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
    public boolean AgregarProducto(Producto producto) {
    boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            transaction = session.beginTransaction();
            session.save(producto);
            transaction.commit();
            session.close();
            flat=true;
        } catch (Exception e) {
            e.printStackTrace();
            flat=false;
            transaction.rollback();
            session.close();
        }
        return flat;
    
    }

    @Override
    public List<Categoria> ListarCategoria() {
        List<Categoria> lista = null;
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
        return lista;
    }
        
}

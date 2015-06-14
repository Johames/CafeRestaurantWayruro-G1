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
import proy.modelo.entidad.Listar_pensionista;
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
    public List<Producto> ListProductos(String nombre) {
        List<Producto> lista = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        String query = "select nombre_producto as producto from producto where nombre_producto like '%"+nombre+"%'";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pro = new Producto();
                pro.setNombreProducto(rs.getString("producto"));
                lista.add(pro);
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
        boolean stado = false;
        Statement st= null;
        String query="insert into PRODUCTO values ('', '"+producto.getNombreProducto()+"','"+producto.getPrecio()+"',"+producto.getIdCategoria()+","+producto.getIdUsuario()+") ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            stado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                revertir();
                cerrarConexion();
                stado = false;
            } catch (Exception ex) {
            }
        }
        return stado;
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

    @Override
    public List<Producto> ListarProductos() {
        List<Producto> list = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        String query = "select nombre_producto as producto, precio from producto ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pro = new Producto();
                pro.setNombreProducto(rs.getString("producto"));
                pro.setPrecio(rs.getString("precio"));
                list.add(pro);
            }
            abrirConexion().close();
        } catch (Exception e) {
            e.printStackTrace();
            try {
                abrirConexion().close();
            } catch (Exception ex) {
                
            }
        }
        return list;
    }
        
}

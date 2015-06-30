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
import proy.modelo.entidad.Pmasvendido;
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
    public List<Producto> ListarProductos() {
        List<Producto> list = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        String query = "select id_producto as id, nombre_producto as producto, precio, id_categoria as idc,"
                + " id_usuario as idu from producto ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pro = new Producto();
                pro.setIdProducto(rs.getString("id"));
                pro.setNombreProducto(rs.getString("producto"));
                pro.setPrecio(rs.getString("precio"));
                pro.setIdCategoria(rs.getString("idc"));
                pro.setIdUsuario(rs.getString("idu"));
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

    @Override
    public List<Producto> Listar(String idCategoria) {
        List<Producto> lista = new ArrayList<Producto>();
        Statement st = null;
        ResultSet rs = null;
        Producto pro = null;
        String query = "select id_producto as id, nombre_producto as producto, precio, id_categoria as idc,"
                + " id_usuario as idu from producto where id_categoria='"+idCategoria+"' ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pro = new Producto();
                 pro.setIdProducto(rs.getString("id"));
                pro.setNombreProducto(rs.getString("producto"));
                pro.setPrecio(rs.getString("precio"));
                pro.setIdCategoria(rs.getString("idc"));
                pro.setIdUsuario(rs.getString("idu"));
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
    public List<Pmasvendido> PmasVendido() {
        List<Pmasvendido> list = new ArrayList<Pmasvendido>();
        Statement st = null;
        ResultSet rs = null;
        Pmasvendido pmv = null;
        String query = " select p.nombre_producto as nombre, coalesce(to_char(v.fecha_venta, 'dd/mm/yyyy'),' ') as fecha, count(p.id_producto) as total " +
                        " from producto p, venta v, venta_detalle dv " +
                        " where  p.id_producto=dv.id_producto and dv.id_venta=v.id_venta " +
                        " group by p.nombre_producto, v.fecha_venta " +
                        " order by v.fecha_venta ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                pmv = new Pmasvendido();
                pmv.setNombreprod(rs.getString("nombre"));
                pmv.setFechaventa(rs.getString("fecha"));
                pmv.setCantidad(rs.getString("total"));
                list.add(pmv);
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

     @Override
    public boolean UpdateProducto(Producto producto, String id) {
    
     boolean estado = false;
        Statement st = null;
        String query = "update producto set nombre_producto='"+producto.getNombreProducto()
                +"',precio='"+producto.getPrecio()+"',id_categoria="+producto.getIdCategoria()
                +",id_usuario='"+producto.getIdUsuario()+"' where id_producto='"+id+"'";
       
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query); 
            abrirConexion().commit();
            abrirConexion().close();
            estado = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                abrirConexion().rollback();
                estado=false;
                abrirConexion().close();
                
            } catch (Exception ex) {
            }
        }
        
        return estado;
    }
      
        
}

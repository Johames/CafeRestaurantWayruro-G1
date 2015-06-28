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
import proy.modelo.dao.detalledao;
import proy.modelo.entidad.Detalle;
import proy.modelo.entidad.Producto;

/**
 *
 * @author TOSHIBA
 */
public class detalledaoImpl implements detalledao{

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
    public boolean AgregarDetalle(Detalle detalle) {
        boolean estado = true;
        Statement st=null;
        String query=" insert into venta_detalle values('"+detalle.getIdVenta()+"','"+detalle.getIdProducto()+"','"+detalle.getPrecioUnitario()+"','"+detalle.getCantProducto()+"') ";
        try {
        st=abrirConexion().createStatement();
        st.executeUpdate(query);
            guardar();
            cerrarConexion();
            estado=true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                revertir();
                cerrarConexion();
                estado=false;
            } catch (Exception ex) {
            }
        } 
    return estado;
    }

    @Override
    public List<Detalle> ListarDetalle(String id) {
        Detalle detalle = null;
        List<Detalle> lista = new ArrayList<>();
        Statement st = null;
        ResultSet rs = null;
        String query =" select p.nombre_producto as nombre, vd.precio_unitario as precio, vd.cant_producto as cantidad, sum(vd.precio_unitario*vd.cant_producto) as subtotal from producto p, venta_detalle vd where p.id_producto=vd.id_producto and vd.id_venta="+id+" group by p.nombre_producto, vd.precio_unitario, vd.cant_producto ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            while(rs.next()){
                detalle = new Detalle();
                detalle.setNombreProducto(rs.getString("nombre"));
                detalle.setPrecioUnitario(rs.getString("precio"));
                detalle.setCantProducto(rs.getString("cantidad"));
                detalle.setSubtotal(rs.getString("subtotal"));
                lista.add(detalle);
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return lista;
    }

    @Override
    public Producto BuscarProducto(String id) {
        Statement st = null;
        ResultSet rs = null;
        String query = " select p.id_producto as id, p.nombre_producto as nombre, p.precio as precio from producto p where id_producto='"+id+"'";
        Producto producto = null;
        
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {   
                producto = new Producto();  
                producto.setIdProducto(rs.getString("id"));
                producto.setNombreProducto(rs.getString("nombre"));
                producto.setPrecio(rs.getString("precio"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return producto;
    }

    @Override
    public boolean EliminarDetalle(String idv, String idp) {
        boolean flat = false;
        Statement st = null;
        String query = " delete from venta_detalle where id_venta = '"+idv+"' and id_producto = '"+idp+"' ";
        
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar(); 
            cerrarConexion();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            flat = false;
            System.out.println(e.getMessage());
            try {
                revertir();
                cerrarConexion();
            } catch (Exception ex) {
                System.out.println(ex.getMessage());
            }
        }
        return flat;
    }
    
}

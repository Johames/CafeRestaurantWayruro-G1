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
import proy.modelo.entidad.Tipo_Venta;
import proy.modelo.entidad.Total_venta;

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
        String query ="select p.nombre_producto as nombre, p.id_producto, vd.precio_unitario as precio, vd.cant_producto as cantidad, sum(vd.precio_unitario*vd.cant_producto) as subtotal from producto p, venta_detalle vd where p.id_producto=vd.id_producto and vd.id_venta="+id+" group by p.nombre_producto, p.id_producto, vd.precio_unitario, vd.cant_producto ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            while(rs.next()){
                detalle = new Detalle();
                detalle.setNombreProducto(rs.getString("nombre"));
                detalle.setIdProducto(rs.getString("id_producto"));
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

    @Override
    public boolean ModificarDetalle(Detalle detalle, String idp, String idv) {
        boolean estado = true;
        Statement st = null;
        String query = "UPDATE venta_detalle SET cant_producto='"+
                detalle.getCantProducto()+"' WHERE id_venta='"+idv+"' and id_producto='"+idp+"' ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            estado = true;
            System.out.println(query);
        } catch (Exception e) {
            e.printStackTrace();
            estado = false;
            try {
                revertir();
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return estado;
    }

    @Override
    public Detalle BuscarProductoVendido(String idv, String idp) {
        Statement st = null;
        ResultSet rs = null;
        String query="select vd.id_venta, vd.precio_unitario, vd.cant_producto, vd.id_producto, p.nombre_producto from venta_detalle vd, producto p where p.id_producto=vd.id_producto and vd.id_producto='"+idp+"' and vd.id_venta='"+idv+"' ";
        Detalle detalle = null;
        
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {   
                detalle = new Detalle();  
                detalle.setIdVenta(rs.getString("id_venta"));
                detalle.setPrecioUnitario(rs.getString("precio_unitario"));
                detalle.setCantProducto(rs.getString("cant_producto"));
                detalle.setIdProducto(rs.getString("id_producto"));
                detalle.setNombreProducto(rs.getString("nombre_producto"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return detalle;
    }

    @Override
    public boolean EliminarVenta(String idv) {
        boolean flat = false;
        Statement st = null;
        String query = "begin eliminarventa ('"+idv+"');end; ";
        
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

    @Override
    public Total_venta total(String idventa) {
        Total_venta total_venta = null;
        Statement st = null;
        ResultSet rs = null;
        String query = " select sum(dv.cant_producto * dv.precio_unitario) as total from producto p, venta v, venta_detalle dv where v.id_venta=dv.id_venta and dv.id_producto=p.id_producto and v.id_venta='"+idventa+"' ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {
                total_venta = new Total_venta();
                total_venta.setTotal(rs.getString("total"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return total_venta;
    }

    @Override
    public Tipo_Venta Tipo(String idventa) {
        Tipo_Venta tipo_Venta = null;
        Statement st = null;
        ResultSet rs = null;
        String query = " select v.tipo from venta v where id_venta='"+idventa+"' ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {
                tipo_Venta = new Tipo_Venta();
                tipo_Venta.setTipo(rs.getString("tipo"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return tipo_Venta;
    }
    
}

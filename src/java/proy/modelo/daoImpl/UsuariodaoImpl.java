/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import proy.modelo.dao.Usuariodao;
import proy.modelo.entidad.Agregar_Usuario;
import proy.modelo.entidad.Listar_Usuario;
import proy.modelo.entidad.Rol;
import proy.modelo.entidad.Usuario;
import proy.modelo.util.HibernateUtil;

/**
 *
 * @author TOSHIBA
 */
public class UsuariodaoImpl implements Usuariodao {

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
    public String ComprobarUsuario(String usuario, String contrasena) {
        String idUsuario = null;
        String query = "SELECT id_usuario FROM Usuario WHERE upper(usuario)='"+usuario.toUpperCase()+"' AND contrasena='"+contrasena+"' and estado='1'";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            if (rs.next()) {
                idUsuario = rs.getString("id_usuario");
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
        return idUsuario;
    }

    @Override
    public boolean AgregarUsuario(Agregar_Usuario agregar_Usuario) {
        boolean stado = false;
        Statement st= null;
        String query="begin registrarusuario('"+agregar_Usuario.getNombre()+"','"+agregar_Usuario.getApellido()+"' "
                + ", '"+agregar_Usuario.getDn()+"','"+agregar_Usuario.getNcelular()+"','"+agregar_Usuario.getDirecciones()+"'"
                + ",'"+agregar_Usuario.getUsuar()+"','"+agregar_Usuario.getContra()+"','"+agregar_Usuario.getStado()+"'"
                + ",'"+agregar_Usuario.getRol()+"');end; ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            stado = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
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
    public List<Listar_Usuario> ListarUsuario() {
        List<Listar_Usuario> lista = new ArrayList<Listar_Usuario>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Usuario listar = null;
        String query = " select us.id_usuario, p.nombres as nombres, p.apellidos as apellidos, us.usuario as usuario, us.contrasena,us.estado as stado, r.nombre_rol as rol "
                + " from persona p, usuario us, rol r "
                + " where p.id_persona=us.id_usuario and us.id_rol=r.id_rol ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                listar = new Listar_Usuario();
                
                listar.setIdUsuario(rs.getString("id_usuario"));
                listar.setNombres(rs.getString("nombres"));
                listar.setApellidos(rs.getString("apellidos"));
                listar.setUsuario(rs.getString("usuario"));
                listar.setContrasena(rs.getString("contrasena"));
                listar.setEstado(rs.getString("stado"));
                listar.setNombre_rol(rs.getString("rol"));

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
    public boolean EliminarUsuario(String id_usuario) {
        boolean estad = false;
        Statement st = null;
        String query = "update USUARIO  set estado='0' where id_usuario='" + id_usuario + "'";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query); 
            abrirConexion().commit();
            abrirConexion().close();
            estad = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                abrirConexion().rollback();
                estad = false;
                abrirConexion().close();
            } catch (Exception ex) {
            }
        }
        return estad;
    }

    @Override
    public List<Rol> ListarRol() {
        List<Rol> lista = new ArrayList<Rol>();
        Statement st = null;
        ResultSet rs = null;
        Rol rol = null;
        String query = " select id_rol as id, nombre_rol as rol "
                + " from rol ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                rol = new Rol();
                rol.setIdRol(rs.getShort("id"));
                rol.setNombreRol(rs.getString("rol"));

                lista.add(rol);
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
    public boolean ModificarUsuario(Usuario usuario, String id) { 
     boolean estad = false;
        Statement st = null;
        String query = "update usuario set usuario='"+usuario.getUsuario()+"',contrasena='"+usuario.getContrasena()+"', id_rol='"+usuario.getIdRol()+"' where id_usuario='"+id+"'";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query); 
            abrirConexion().commit();
            abrirConexion().close();
            estad = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                abrirConexion().rollback();
                estad = false;
                abrirConexion().close();
            } catch (Exception ex) {
            }
        }
        return estad;    
       
    }
   
}

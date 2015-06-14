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
    public boolean AgregarUsuario(Usuario usuario) {
        Statement st = null;
        boolean flat = false;
        String query = "INSERT INTO Cliente VALUES ()";
        System.out.println(query); 
       try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            abrirConexion().commit();
            abrirConexion().close();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                abrirConexion().rollback();
                abrirConexion().close();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<Listar_Usuario> ListarUsuario() {
        List<Listar_Usuario> lista = new ArrayList<Listar_Usuario>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Usuario listar = null;
        String query = " select p.nombres as nombres, p.apellidos as apellidos, us.usuario as usuario, r.nombre_rol as rol "
                + " from persona p, usuario us, rol r "
                + " where p.id_persona=us.id_usuario and us.id_rol=r.id_rol ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                listar = new Listar_Usuario();
                
                listar.setNombres(rs.getString("nombres"));
                listar.setApellidos(rs.getString("apellidos"));
                listar.setUsuario(rs.getString("usuario"));
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
    public boolean EliminarUsuario(int id) {
        boolean flat = false;
        Statement st = null;
        String query = "delete FROM USUARIO WHERE ID_USUARIO =" + id;

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
    public List<Rol> ListarRol() {
        List<Rol> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Rol>();
            Query query = session.createQuery("FROM Rol");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

}

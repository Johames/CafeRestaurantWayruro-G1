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
        String query = "SELECT id_usuario FROM Usuario WHERE upper(usuario) = '" + usuario.toUpperCase() + "' AND contrasena = '" + contrasena + "'";
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
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return idUsuario;
    }

    @Override
    public boolean AgregarUsuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Listar_Usuario> ListarUsuario() {
        List<Listar_Usuario> lista = new ArrayList<Listar_Usuario>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Usuario listar = null;
        String query = "select u.id_persona as id p.NOMBRES as nombres, p.APELLIDOS as apellidos, u.USUARIO as usuario, u.CONTRASENA as con, r.NOMBRE_ROL as rol"
                + "from PERSONA p, USUARIO u, ROL r "
                + "where p.ID_PERSONA=u.ID_USUARIO and u.ID_ROL = r.ID_ROL ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                listar =new Listar_Usuario();

                listar.setIdUsuario(rs.getString("id"));
                listar.setNombres(rs.getString("nombres"));
                listar.setApellidos(rs.getString("apellidos"));
                listar.setUsuario(rs.getString("usuario"));
                listar.setContrasena(rs.getString("con"));
                listar.setNombre_rol(rs.getString("rol"));

                lista.add(listar);
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

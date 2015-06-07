/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.daoImpl;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import proy.modelo.dao.Usuariodao;
import proy.modelo.entidad.Usuario;
import proy.modelo.util.HibernateUtil;

/**
 *
 * @author TOSHIBA
 */
public class UsuariodaoImpl  implements Usuariodao{
    
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
    public Usuario ComprobarUsuario(String usuario, String contrasena) {
        Usuario user = null;
        Session session = null;
        SessionFactory sf = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            Query query = session.createQuery("from Usuario where usuario='"+usuario+"' and contrasena='"+contrasena+"'");
            user = (Usuario)query.uniqueResult();
            session.close();
        } catch (Exception e) {
            System.out.println("Error"+e.getMessage());
            e.printStackTrace();
            session.close();
            
        }
        return user;
    }

    @Override
    public boolean AgregarUsuario(Usuario usuario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Usuario> ListarUsuario() {
        List<Usuario> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Usuario>();
            Query query = session.createQuery("FROM Usuario");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
    }

    @Override
    public boolean EliminarUsuario(int id) {
        boolean flat = false;
        Statement st = null;
        String query = "delete FROM USUARIO WHERE ID_USUARIO ="+id;
        
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
    
}

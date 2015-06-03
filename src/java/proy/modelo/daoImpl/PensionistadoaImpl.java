
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
import proy.modelo.dao.Pensionistadao;
import proy.modelo.entidad.Persona;
import proy.modelo.util.HibernateUtil;

/**
 *
 * @author TOSHIBA
 */
public class PensionistadoaImpl implements Pensionistadao {
    
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
    public List<Persona> ListarPensionista() {
        List<Persona> lista = null;
        SessionFactory sf = null;
        Session session = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            lista = new ArrayList<Persona>();
            Query query = session.createQuery("FROM Persona");
            lista = query.list();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.close();
        }
        return lista;
        
    }

    @Override
    public boolean agregarpensionista(Persona persona) {
        boolean flat = false;
        SessionFactory sf = null;
        Session session = null;
        Transaction transaction = null;
        try {
            sf = HibernateUtil.getSessionFactory();
            session = sf.openSession();
            transaction = session.beginTransaction();
            session.save(persona);
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
    public List<Persona> buscarPensionista(String dni) {
    List<Persona> lista=new ArrayList<Persona>();
        Persona u=null;
        Statement st=null;
        ResultSet rs=null;
        String query="SELECT p.nombres,p.apellidos,p.dni,p.N_CELULAR FROM PERSONA  WHERE dni='"+dni+"'";
         try {
            st=abrirConexion().createStatement();
            rs=st.executeQuery(query);
             while (rs.next()) {
                 u=new Persona();
                 u.setNombres(rs.getString("nombreS"));
                 u.setApellidos(rs.getString("apellidos"));                 
                 u.setDni(rs.getString("dni"));
                 u.setNCelular(rs.getString("ncelular"));
                 u.setDireccion(rs.getString("Direccion"));
                 lista.add(u);
             }
             abrirConexion().close();
        } 
         catch (Exception e) {
            e.printStackTrace();
             try {
                  abrirConexion().close(); 
             } catch (Exception ex) {
               
             }
        }
         return lista;   
    }

}

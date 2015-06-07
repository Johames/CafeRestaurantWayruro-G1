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
import proy.modelo.entidad.ContratoPensionista;
import proy.modelo.entidad.Listar_pensionista;
import proy.modelo.entidad.Persona;
import proy.modelo.util.HibernateUtil;

public class PensionistadoaImpl implements Pensionistadao {

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
    public List<Listar_pensionista> ListarPensionista() {
        List<Listar_pensionista> lista = new ArrayList<Listar_pensionista>();
        Statement st = null;
        ResultSet rs = null;
        Listar_pensionista cp = null;
        String query = "select cp.id_contrato as id, p.nombres as name, p.apellidos as ape, p.dni as dn, "
                + "p.n_celular as celu, p.direccion as dire, cp.fecha_inicio as fi, cp.fecha_fin as ff "
                + "from persona p, CONTRATO_PENSIONISTA cp "
                + "where p.id_persona=cp.id_persona order by cp.id_contrato";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            //rs = st.executeQuery(query1);
            while (rs.next()) {
                //p = new Persona();
                cp = new Listar_pensionista();
                cp.setIdContrato(rs.getString("id"));
                cp.setNombres(rs.getString("name"));
                cp.setApellidos(rs.getString("ape"));
                cp.setDni(rs.getString("dn"));
                cp.setNCelular(rs.getString("celu"));
                cp.setDireccion(rs.getString("dire"));
                cp.setFechaInicio(rs.getString("fi"));
                cp.setFechaFin(rs.getString("ff"));
                lista.add(cp);
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
    public boolean EliminarPensionista(int id) {
     boolean flat = false;
        Statement st = null;
        String query = "delete FROM  WHERE  ="+id;
        
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
    public List<Listar_pensionista> buscarPensionista(String dni) {
        List<Listar_pensionista> lista = new ArrayList<Listar_pensionista>();
        Listar_pensionista cp = null;
        Statement st = null;
        ResultSet rs = null;
        String query = "select cp.id_contrato as id, p.nombres as name, p.apellidos as ape, p.dni as dn, "
                + "p.n_celular as celu, p.direccion as dire, cp.fecha_inicio as fi, cp.fecha_fin as ff "
                + "from persona p, CONTRATO_PENSIONISTA cp "
                + "where p.id_persona=cp.id_persona and p."+dni+" ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                cp.setIdContrato(rs.getString("id"));
                cp.setNombres(rs.getString("name"));
                cp.setApellidos(rs.getString("ape"));
                cp.setDni(rs.getString("dn"));
                cp.setNCelular(rs.getString("celu"));
                cp.setDireccion(rs.getString("dire"));
                cp.setFechaInicio(rs.getString("fi"));
                cp.setFechaFin(rs.getString("ff"));
                lista.add(cp);
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
    public boolean agregarpensionista(Persona persona) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}

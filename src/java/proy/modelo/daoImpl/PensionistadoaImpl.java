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
import proy.modelo.entidad.AgregarContrato;
import proy.modelo.entidad.ContratoPensionista;
import proy.modelo.entidad.Listar_pensionista;
import proy.modelo.entidad.Persona;
import proy.modelo.entidad.RenovarContrato;
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
        String query = "select cp.id_contrato as idc, cp.id_persona as id, p.nombres as name, p.apellidos as ape, p.dni as dn, "
                + "p.n_celular as celu, p.direccion as dire, cp.fecha_inicio as fi, cp.fecha_fin as ff, cp.precio_pension as pp, cp.fecha_pago as fp,"
                + "trunc(to_date(cp.fecha_fin))-trunc(to_date(to_char(sysdate, 'dd/mm/yyyy'))) as vigencia "
                + "from persona p, CONTRATO_PENSIONISTA cp "
                + "where p.id_persona=cp.id_persona and " 
                + "(select to_char(sysdate,'dd/mm/yyyy')from dual)>=(cp.fecha_inicio) " 
                + "and (select to_char(sysdate,'dd/mm/yyyy')from dual)<=(cp.fecha_fin) ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                cp = new Listar_pensionista();
                cp.setIdContrato(rs.getString("idc"));
                cp.setIdPersona(rs.getString("id"));
                cp.setNombres(rs.getString("name"));
                cp.setApellidos(rs.getString("ape"));
                cp.setDni(rs.getString("dn"));
                cp.setNCelular(rs.getString("celu"));
                cp.setDireccion(rs.getString("dire"));
                cp.setFechaInicio(rs.getString("fi"));
                cp.setFechaFin(rs.getString("ff"));
                cp.setPrecioPension(rs.getString("pp"));
                cp.setFechaPago(rs.getString("fp"));
                cp.setVigencia(rs.getString("vigencia"));
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
    public boolean RenovarContrato(RenovarContrato renovarContrato) {
        boolean estado = false;
        Statement st= null;
        String query = " begin renovarcontrato("+renovarContrato.getIdpersona()+" "
                + ", '"+renovarContrato.getFechini()+"','"+renovarContrato.getPrecio()+"' "
                + ", '"+renovarContrato.getStado()+"','"+renovarContrato.getIdusuario()+"');end; ";
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
    public boolean agregarContrato(AgregarContrato agregarContrato) {
        boolean flat = false;
        Statement st= null;
        String query = "begin registrarcontrato('"+agregarContrato.getNombre()+"','"+agregarContrato.getApellido()+"' "
                + ", '"+agregarContrato.getDn()+"','"+agregarContrato.getNcelular()+"','"+agregarContrato.getDirecciones()+"' "
                + ", '"+agregarContrato.getFechini()+"','"+agregarContrato.getPrecio()+"','"+agregarContrato.getStado()+"' "
                + ",'"+agregarContrato.getIdusuario()+"');end; ";
        try {
            st = abrirConexion().createStatement();
            st.executeUpdate(query);
            guardar();
            cerrarConexion();
            flat = true;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            try {
                revertir();
                cerrarConexion();
                flat = false;
            } catch (Exception ex) {
            }
        }
        return flat;
    }

    @Override
    public List<Listar_pensionista> ListarInactivos() {
        List<Listar_pensionista> list = new ArrayList<Listar_pensionista>();
        Statement st = null;
        ResultSet rs = null;
        Listar_pensionista cp = null;
        String query = "select cp.id_contrato as idc, cp.id_persona as id, p.nombres as name, p.apellidos as ape, p.dni as dn, "
                + "p.n_celular as celu, p.direccion as dire, cp.fecha_inicio as fi, cp.fecha_fin as ff, cp.precio_pension as pp, cp.fecha_pago as fp "
                + "from persona p, CONTRATO_PENSIONISTA cp "
                + "where p.id_persona=cp.id_persona and " 
                + "(select to_char(sysdate,'dd/mm/yyyy')from dual)>=(cp.fecha_inicio) " 
                + "and (select to_char(sysdate,'dd/mm/yyyy')from dual)>=(cp.fecha_fin) ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                cp = new Listar_pensionista();
                cp.setIdContrato(rs.getString("idc"));
                cp.setIdPersona(rs.getString("id"));
                cp.setNombres(rs.getString("name"));
                cp.setApellidos(rs.getString("ape"));
                cp.setDni(rs.getString("dn"));
                cp.setNCelular(rs.getString("celu"));
                cp.setDireccion(rs.getString("dire"));
                cp.setFechaInicio(rs.getString("fi"));
                cp.setFechaFin(rs.getString("ff"));
                cp.setPrecioPension(rs.getString("pp"));
                cp.setFechaPago(rs.getString("fp"));
                list.add(cp);
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

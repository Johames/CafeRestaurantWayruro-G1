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
import proy.modelo.entidad.Listar_Asistencias;
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
                + " p.n_celular as celu, p.direccion as dire, cp.fecha_inicio as fi, cp.fecha_fin as ff, cp.precio_pension as pp, coalesce(to_char(cp.fecha_pago, 'dd/mm/yyyy'),' ') as fp, "
                + " trunc(to_date(cp.fecha_fin))-trunc(to_date(to_char(sysdate, 'dd/mm/yyyy'))) as vigencia "
                + " from persona p, CONTRATO_PENSIONISTA cp "
                + " where p.id_persona=cp.id_persona and "
                + " (select to_char(sysdate,'dd/mm/yyyy')from dual)>=(cp.fecha_inicio) "
                + " and (select to_char(sysdate,'dd/mm/yyyy')from dual)<=(cp.fecha_fin) order by cp.id_contrato desc ";

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
    public boolean EliminarPensionista(String idcontrato) {
        boolean flat = false;
        Statement st = null;
        String query = "begin eliminarcontrato ('" + idcontrato + "');end; ";

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
    public boolean RenovarContrato(RenovarContrato renovarContrato) {
        boolean estado = false;
        Statement st = null;
        String query = " begin renovarcontrato(" + renovarContrato.getIdpersona() + " "
                + " ,to_date('" + renovarContrato.getFechini() + "', 'yyyy-mm-dd'),'" + renovarContrato.getPrecio() + "' "
                + " , '" + renovarContrato.getStado() + "'," + renovarContrato.getIdusuario() + ", '" + renovarContrato.getTip() + "');end; ";
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
        Statement st = null;
        String query = " begin registrarcontrato('" + agregarContrato.getNombre() + "',"
                + "'" + agregarContrato.getApellido() + "' "
                + " , '" + agregarContrato.getDn() + "',"
                + "'" + agregarContrato.getNcelular() + "',"
                + "'" + agregarContrato.getDirecciones() + "' "
                + " , to_date('" + agregarContrato.getFechini() + "', "
                + "'yyyy-mm-dd'),'" + agregarContrato.getPrecio() + "',"
                + "'" + agregarContrato.getStado() + "' "
                + " , " + agregarContrato.getIdusuario() + ", "
                + "'" + agregarContrato.getTip() + "');end; ";
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
        String query = " select cp.id_contrato as idc, cp.id_persona as id, p.nombres as name, p.apellidos as ape, p.dni as dn, "
                + " p.n_celular as celu, p.direccion as dire, cp.fecha_inicio as fi, cp.fecha_fin as ff, cp.precio_pension as pp, cp.fecha_pago as fp "
                + " from persona p, CONTRATO_PENSIONISTA cp "
                + " where p.id_persona=cp.id_persona and "
                + " (select to_char(sysdate,'dd/mm/yyyy')from dual)>=(cp.fecha_inicio) "
                + " and (select to_char(sysdate,'dd/mm/yyyy')from dual)>=(cp.fecha_fin) order by cp.id_contrato desc ";

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

    @Override
    public List<Listar_Asistencias> ListarAsistenciasDia() {
        List<Listar_Asistencias> list = new ArrayList<Listar_Asistencias>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Asistencias la = null;
        String query = " select nombres, apellidos, id_contrato, fecha, "
                + " case de "
                + "	when '0' then 'no Desayuno' "
                + "	when '1' then 'Desayuno' "
                + "	else 'ninguno' "
                + " end as desayuno, "
                + " case al "
                + "	when '0' then 'no Almorzó' "
                + "	when '1' then 'Almorzó' "
                + "	else 'ninguno' "
                + " end as almuerzo, "
                + " case ce "
                + "	when '0' then 'no Cenó' "
                + "	when '1' then 'Cenó' "
                + "	else 'ninguno' "
                + " end as cena "
                + " from view_controldia ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                la = new Listar_Asistencias();
                la.setNombres(rs.getString("nombres"));
                la.setApellidos(rs.getString("apellidos"));
                la.setIdContrato(rs.getString("id_contrato"));
                la.setFecha(rs.getString("fecha"));
                la.setDesayuno(rs.getString("desayuno"));
                la.setAlmuerzo(rs.getString("almuerzo"));
                la.setCena(rs.getString("cena"));
                list.add(la);
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
    public List<Listar_Asistencias> ListarAsistenciasMes() {
        List<Listar_Asistencias> list = new ArrayList<Listar_Asistencias>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Asistencias la = null;
        String query = " select nombres, apellidos, id_contrato, fecha, "
                + " case de "
                + "	when '0' then 'no Desayuno' "
                + "	when '1' then 'Desayuno' "
                + "	else 'ninguno' "
                + " end as desayuno, "
                + " case al "
                + "	when '0' then 'no Almorzó' "
                + "	when '1' then 'Almorzó' "
                + "	else 'ninguno' "
                + " end as almuerzo, "
                + " case ce "
                + "	when '0' then 'no Cenó' "
                + "	when '1' then 'Cenó' "
                + "	else 'ninguno' "
                + " end as cena "
                + " from view_controlmes ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                la = new Listar_Asistencias();
                la.setNombres(rs.getString("nombres"));
                la.setApellidos(rs.getString("apellidos"));
                la.setIdContrato(rs.getString("id_contrato"));
                la.setFecha(rs.getString("fecha"));
                la.setDesayuno(rs.getString("desayuno"));
                la.setAlmuerzo(rs.getString("almuerzo"));
                la.setCena(rs.getString("cena"));
                list.add(la);
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
    public List<Listar_Asistencias> ListarAsistencias() {
        List<Listar_Asistencias> list = new ArrayList<Listar_Asistencias>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Asistencias la = null;
        String query = " select nombres, apellidos, id_contrato, fecha, "
                + " case de "
                + "	when '0' then 'no Desayuno' "
                + "	when '1' then 'Desayuno' "
                + "	else 'ninguno' "
                + " end as desayuno, "
                + " case al "
                + "	when '0' then 'no Almorzó' "
                + "	when '1' then 'Almorzó' "
                + "	else 'ninguno' "
                + " end as almuerzo, "
                + " case ce "
                + "	when '0' then 'no Cenó' "
                + "	when '1' then 'Cenó' "
                + "	else 'ninguno' "
                + " end as cena "
                + " from view_control ";

        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                la = new Listar_Asistencias();
                la.setNombres(rs.getString("nombres"));
                la.setApellidos(rs.getString("apellidos"));
                la.setIdContrato(rs.getString("id_contrato"));
                la.setFecha(rs.getString("fecha"));
                la.setDesayuno(rs.getString("desayuno"));
                la.setAlmuerzo(rs.getString("almuerzo"));
                la.setCena(rs.getString("cena"));
                list.add(la);
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
    public boolean ModificarFechaP(String idpersona) {
        boolean flat = false;
        Statement st = null;
        String query = " update CONTRATO_PENSIONISTA set estado='1', "
                + "fecha_pago= (select to_char(sysdate, 'dd/mm/yyyy')from dual) "
                + "where id_contrato='"+idpersona+"'";
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
    public Persona MostrarPersona(String idpersona) {
        Persona per = null;
        Statement st = null;
        ResultSet rs = null;
        String query = " select p.id_persona as id, p.nombres, p.apellidos, p.dni, p.n_celular, p.direccion from persona p where id_persona='"+idpersona+"' ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {
                per = new Persona();
                per.setIdPersona(rs.getString("id"));
                per.setNombres(rs.getString("nombres"));
                per.setApellidos(rs.getString("apellidos"));
                per.setDni(rs.getString("dni"));
                per.setNCelular(rs.getString("n_celular"));
                per.setDireccion(rs.getString("direccion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return per;
    }

    @Override
    public boolean ModificarPersona(Persona per, String idpersona) {
        boolean estado = true;
        Statement st = null;
        String query = " update persona set nombres='"+per.getNombres()+"', apellidos='"+per.getApellidos()+"', dni='"+per.getDni()+"', n_celular='"+per.getNCelular()+"', direccion='"+per.getDireccion()+"' where id_persona="+idpersona+" ";
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
    public ContratoPensionista MostrarContrato(String idcontrato) {
        ContratoPensionista conp = null;
        Statement st = null;
        ResultSet rs = null;
        String query = " select to_char(fecha_inicio, 'yyyy-mm-dd') as fecha_inicio, to_char(fecha_fin, 'yyyy-mm-dd') as fecha_fin, cp.precio_pension, cp.estado, cp.id_usuario from contrato_pensionista cp where id_contrato='"+idcontrato+"' ";
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            cerrarConexion();
            if (rs.next()) {
                conp = new ContratoPensionista();
                conp.setFechaInicio(rs.getString("fecha_inicio"));
                conp.setFechaFin(rs.getString("fecha_fin"));
                conp.setPrecioPension(rs.getString("precio_pension"));
                conp.setEstado(rs.getString("estado"));
                conp.setIdusuario(rs.getString("id_usuario"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                cerrarConexion();
            } catch (Exception ex) {
            }
        }
        return conp;
    }

    @Override
    public boolean ModificarContrato(ContratoPensionista conp, String idcontrato) {
        boolean estado = true;
        Statement st = null;
        String query = " begin modificarcontrato('"+idcontrato+"', to_date('"+conp.getFechaInicio()+"', 'yyyy-mm-dd'), to_date('"+conp.getFechaFin()+"', 'yyyy-mm-dd'), '"+conp.getPrecioPension()+"', '"+conp.getEstado()+"', '"+conp.getIdusuario()+"');end; ";
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

}

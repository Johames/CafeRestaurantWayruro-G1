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
import proy.modelo.dao.Movimientosdao;
import proy.modelo.entidad.Listar_Movimientos;
import proy.modelo.entidad.Listar_pensionista;
import proy.modelo.entidad.Movimiento;

/**
 *
 * @author TOSHIBA
 */
public class MovimientosdaoImpl implements Movimientosdao{

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
    public List<Listar_Movimientos> Listar() {
        List<Listar_Movimientos> lista = new ArrayList<Listar_Movimientos>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Movimientos mov = null;
        String query = "select m.id_movimiento as idm, decode(m.tipo, 'c', 'Contrato', 'venta') as registro, "
                + " m.id_documento as idc, m.fecha as fec, m.importe as imp, u.usuario as us "
                + " from movimiento m, usuario u "
                + " where m.id_usuario=u.id_usuario "
                + " order by m.id_movimiento desc, m.fecha desc";
        
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                mov = new Listar_Movimientos();
                mov.setIdMovimiento(rs.getString("idm"));
                mov.setTipo(rs.getString("registro"));
                mov.setIdDocumento(rs.getString("idc"));
                mov.setFecha(rs.getString("fec"));
                mov.setImporte(rs.getString("imp"));
                mov.setUsuario(rs.getString("us"));
                lista.add(mov);
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
    public List<Listar_Movimientos> MovdelMes() {
        List<Listar_Movimientos> list = new ArrayList<Listar_Movimientos>();
        Statement st = null;
        ResultSet rs = null;
        Listar_Movimientos mov = null;
        String query = "select m.id_movimiento as idm, decode(m.tipo, 'c', 'Contrato', 'venta') as registro, "
                + " m.id_documento as idc, m.fecha as fec, m.importe as imp, u.usuario as us "
                + " from movimiento m, usuario u "
                + " where m.id_usuario=u.id_usuario and to_char(m.fecha, 'mm')=to_char(sysdate, 'mm') "
                + " order by m.id_movimiento desc, m.fecha desc";
        
        try {
            st = abrirConexion().createStatement();
            rs = st.executeQuery(query);
            while (rs.next()) {
                mov = new Listar_Movimientos();
                mov.setIdMovimiento(rs.getString("idm"));
                mov.setTipo(rs.getString("registro"));
                mov.setIdDocumento(rs.getString("idc"));
                mov.setFecha(rs.getString("fec"));
                mov.setImporte(rs.getString("imp"));
                mov.setUsuario(rs.getString("us"));
                list.add(mov);
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

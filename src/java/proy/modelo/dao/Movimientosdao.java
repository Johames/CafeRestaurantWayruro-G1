/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.AgregarMov;
import proy.modelo.entidad.Listar_Movimientos;
import proy.modelo.entidad.Movimiento;

/**
 *
 * @author TOSHIBA
 */
public interface Movimientosdao {
    public List<Listar_Movimientos> Listar();
    public List<Listar_Movimientos> MovdelMes();
    public boolean AgregarMovimiento(AgregarMov agregarMov);
}

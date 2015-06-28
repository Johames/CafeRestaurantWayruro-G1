/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Listar_Movimientos;

/**
 *
 * @author TOSHIBA
 */
public interface Movimientosdao {
    public List<Listar_Movimientos> Listar();
    public List<Listar_Movimientos> MovdelMes();
}

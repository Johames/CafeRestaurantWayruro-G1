/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import proy.modelo.entidad.Controldia;

/**
 *
 * @author TOSHIBA
 */
public interface Controldao {
    public boolean AgregarControl(Controldia control);
    public String ComprobarControl(String idc);
}

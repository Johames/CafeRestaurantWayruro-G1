/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import proy.modelo.entidad.Agregar_Venta;
import proy.modelo.entidad.Venta;

/**
 *
 * @author USUARIO
 */
public interface Ventadao {
    
    public boolean AgregarVenta(Agregar_Venta agregarv);
}

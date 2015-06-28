/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Detalle;
import proy.modelo.entidad.Producto;

/**
 *
 * @author TOSHIBA
 */
public interface detalledao {
    public boolean AgregarDetalle(Detalle detalle);
    public List<Detalle> ListarDetalle(String id);
    public Producto BuscarProducto(String id);
    public boolean EliminarDetalle(String idv, String idp);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Detalle;
import proy.modelo.entidad.Producto;
import proy.modelo.entidad.Tipo_Venta;
import proy.modelo.entidad.Total_venta;

/**
 *
 * @author TOSHIBA
 */
public interface detalledao {
    public boolean AgregarDetalle(Detalle detalle);
    public List<Detalle> ListarDetalle(String id);
    public Producto BuscarProducto(String id);
    public boolean EliminarDetalle(String idv, String idp);
    public boolean ModificarDetalle(Detalle detalle, String idp, String idv);
    public Detalle BuscarProductoVendido(String idv, String idp);
    public boolean EliminarVenta(String idv);
    public Total_venta total(String idventa);
    public Tipo_Venta Tipo(String idventa);
}

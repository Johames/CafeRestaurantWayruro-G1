/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Categoria;
import proy.modelo.entidad.Pmasvendido;
import proy.modelo.entidad.Producto;


/**
 *
 * @author TOSHIBA
 */
public interface Productodao {
    public boolean EliminarProducto(int id);
    public boolean  AgregarProducto(Producto producto);
    public List<Producto> ListarProductos();
    public List<Producto> Listar(String idCategoria);
    public List<Pmasvendido> PmasVendido();
    public boolean UpdateProducto(Producto producto, String id);
}

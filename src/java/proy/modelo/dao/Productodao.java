/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Producto;


/**
 *
 * @author TOSHIBA
 */
public interface Productodao {
    public List<Producto> ListarPlatos();
    public List<Producto> ListarBebidas();
    public List<Producto> ListPostres();
    public boolean EliminarProducto(int id);
    public boolean  AgregarProducto(Producto producto);
    
}

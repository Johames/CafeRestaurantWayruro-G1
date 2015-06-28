/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Categoria;

/**
 *
 * @author TOSHIBA
 */
public interface Categoriadao { 
    
    public List<Categoria> ListarCategoria();
    public boolean AgregarCategoria(Categoria cat);
    
}

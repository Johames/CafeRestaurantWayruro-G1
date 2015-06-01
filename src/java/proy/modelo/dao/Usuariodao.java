/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Usuario;

/**
 *
 * @author TOSHIBA
 */
public interface Usuariodao {
    public Usuario ComprobarUsuario(String usuario, String contrasena);
    public List<Usuario> ListarUsuario();
    public boolean AgregarUsuario(Usuario usuario);
    public boolean EliminarUsuario(int id);
        
}

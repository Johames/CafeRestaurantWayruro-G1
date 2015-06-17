/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Agregar_Usuario;
import proy.modelo.entidad.Listar_Usuario;
import proy.modelo.entidad.Rol;
import proy.modelo.entidad.Usuario;

/**
 *
 * @author TOSHIBA
 */
public interface Usuariodao {
    public String ComprobarUsuario(String usuario, String contrasena);
    public List<Listar_Usuario> ListarUsuario();
    public boolean AgregarUsuario(Agregar_Usuario agregar_Usuario);
    public boolean EliminarUsuario(int id);
    public List<Rol> ListarRol();
}

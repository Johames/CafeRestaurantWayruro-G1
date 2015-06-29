/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.Persona;

/**
 *
 * @author USUARIO
 */
public interface Personadao {
   public boolean registrarpersona(Persona persona);
   public List<Persona> buscarpordni(String dni,String nombres,String apellidos);
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import proy.modelo.entidad.Persona;

/**
 *
 * @author TOSHIBA
 */
public interface Personadao {
    public boolean EliminarPersona(int id);
    public Persona BuscarPensionista(String dni);
}

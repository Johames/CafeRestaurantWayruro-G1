/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.ContratoPensionista;
import proy.modelo.entidad.Listar_pensionista;
import proy.modelo.entidad.Persona;

/**
 *
 * @author TOSHIBA
 */
public interface Pensionistadao {
    
    public List<Listar_pensionista> ListarPensionista();
    public boolean EliminarPensionista(int id);
    public boolean agregarpensionista(Persona persona);
    //public Persona BuscarPensionista(String dni);
    public List<Listar_pensionista> buscarPensionista(String dni);
}

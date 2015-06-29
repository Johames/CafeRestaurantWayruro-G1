/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proy.modelo.dao;

import java.util.List;
import proy.modelo.entidad.AgregarContrato;
import proy.modelo.entidad.ContratoPensionista;
import proy.modelo.entidad.Listar_Asistencias;
import proy.modelo.entidad.Listar_pensionista;
import proy.modelo.entidad.RenovarContrato;

/**
 *
 * @author TOSHIBA
 */
public interface Pensionistadao {
    
    public List<Listar_pensionista> ListarPensionista();
    public boolean EliminarPensionista(String idcontrato);
    public boolean RenovarContrato(RenovarContrato renovarContrato);
    public boolean agregarContrato(AgregarContrato agregarContrato);
    public List<Listar_pensionista> ListarInactivos();
    public List<Listar_Asistencias> ListarAsistenciasDia();
    public List<Listar_Asistencias> ListarAsistenciasMes();
    public List<Listar_Asistencias> ListarAsistencias();
    public boolean ModificarFechaP (String idpersona);
}

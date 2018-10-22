/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import modelo.dto.Equipo;

/**
 *
 * @author Duoc
 */
@Stateless
public class EquipoFacade extends AbstractFacade<Equipo> {

    @PersistenceContext(unitName = "ligaGamer2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EquipoFacade() {
        super(Equipo.class);
    }
    
    public boolean existeEquipo(String nombre){
        Query query = em.createQuery("SELECT e FROM Equipo u WHERE e.nombre = :nombre");
        query.setParameter("nombre", nombre);
        return query.getResultList().size() > 0;
    }
    
    public boolean actualizarIntegrantes(Equipo g){
        Query query = em.createQuery("UPDATE Equipo e SET e.numeroIntegrantes = e.numeroIntegrantes + 1 WHERE e.id = :id");
        
        query.setParameter("id", g.getId());
        query.executeUpdate();
        return true;
    }
    
}

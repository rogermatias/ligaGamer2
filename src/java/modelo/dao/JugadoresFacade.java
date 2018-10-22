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
import modelo.dto.Jugadores;

/**
 *
 * @author Duoc
 */
@Stateless
public class JugadoresFacade extends AbstractFacade<Jugadores> {

    @PersistenceContext(unitName = "ligaGamer2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public JugadoresFacade() {
        super(Jugadores.class);
    }
    
    public boolean existeJugador(String nick){
        Query query = em.createQuery("SELECT j FROM Jugadores j WHERE j.nick = :nick");
        query.setParameter("nick", nick);
        return query.getResultList().size() > 0;
    }
    
    public boolean darBaja(Jugadores g){
        Query query = em.createQuery("UPDATE Jugadores j SET j.vigente = :vigente WHERE j.id = :id");
        query.setParameter("vigente", g.getVigente());
        query.setParameter("id", g.getId());
        
        query.executeUpdate();
        return true;
    }
    
}

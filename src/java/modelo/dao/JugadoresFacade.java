/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
    
}

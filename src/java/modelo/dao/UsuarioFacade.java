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
import modelo.dto.Usuario;

/**
 *
 * @author Duoc
 */
@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "ligaGamer2PU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
     // METODO PARA VER SI EXISTE UN USUARIO 
    public boolean existeUsuario(String user, String pass){
        Query query = em.createQuery("SELECT u FROM Usuarios u WHERE u.user = :user");
        query.setParameter("user", user);
        return query.getResultList().size() > 0;
    }
    
}

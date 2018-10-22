/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.util.List;
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
    public boolean existeUsuario(String user){
        Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.user = :user");
        query.setParameter("user", user);
        return query.getResultList().size() > 0;
    }
    
    public boolean actualizarEquipo (Usuario e){
        Query query = em.createQuery("UPDATE equipo FROM Usuario u WHERE u.user = :user and u.pass = :pass");
        
        return query.getResultList().size() > 0;
    }
    public Usuario buscarUsuario(String user, String pass){
        Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.user = :user and u.pass = :pass");
        query.setParameter("user", user);
        query.setParameter("pass", pass);
        List<Usuario> list = query.getResultList();
        for (Usuario aux : list) {
                if (aux.getUser().equals(user) && aux.getPass().equals(pass)) {
                    return aux;
                }
            }
        return null;
    }
    
    public boolean modificarAdmin(Usuario g){
        Query query = em.createQuery("UPDATE Usuario u SET u.nombre = :nombre, u.edad = :edad, u.user = :user, u.pass = :pass WHERE u.id = :id");
        query.setParameter("nombre", g.getNombre());
        query.setParameter("edad", g.getEdad());
        query.setParameter("user", g.getUser());
        query.setParameter("pass", g.getPass());
        query.setParameter("id", g.getId());
        
        query.executeUpdate();
        return true;
    }
    
    public boolean darBaja(Usuario g){
        Query query = em.createQuery("UPDATE Usuario u SET u.vigente = :vigente WHERE u.id = :id");
        query.setParameter("vigente", g.getVigente());
        query.setParameter("id", g.getId());
        
        query.executeUpdate();
        return true;
    }
}

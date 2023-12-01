package web.dao;

import java.util.HashSet;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import web.modelo.Usuario;


@Repository
public class UsuarioDao implements UserDetailsService{

    @PersistenceContext
    private EntityManager manager;

    public void adiciona(Usuario Usuario) {
        manager.persist(Usuario);
    }

    public void altera(Usuario Usuario) {
        manager.merge(Usuario);
    }

    public List<Usuario> buscaPorEmail(String email) {
        return manager.createQuery("select u from Usuario u where u.email = :email", Usuario.class)
                .setParameter("email", email)
                .getResultList();
    }
    
    public Usuario buscaPorEmailSingle(String email) {
        try {
            return manager.createQuery("select u from Usuario u where u.email = :email", web.modelo.Usuario.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
           
            return null;
        }
    }
    
    public Usuario buscaPorId(int id) {
        return manager.find(Usuario.class, id);
    }

    public void remove(int id) {
        manager.createQuery("delete from Usuario u where u.id = :id")
                .setParameter("id", id)
                .executeUpdate();
    }

    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Usuario usuario = buscaPorEmailSingle(email);
        System.out.println(usuario);
        if (usuario != null) {

            User user = new User(usuario.getEmail(), usuario.getSenha(), new HashSet<>());
            return user;
        }
        return null;
    }

	}



	

	


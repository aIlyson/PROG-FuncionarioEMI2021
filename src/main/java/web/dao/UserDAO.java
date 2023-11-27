package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import web.modelo.User;

@Repository
public class UserDAO implements UserDetailsService{

    @PersistenceContext
    private EntityManager manager;

    public void adiciona(User user) {
        manager.persist(user);
    }

    public void altera(User user) {
        manager.merge(user);
    }

    public List<User> buscaPorEmail(String email) {
        return manager.createQuery("select u from User u where u.email = :email", User.class)
                .setParameter("email", email)
                .getResultList();
    }
    
    public User buscaPorEmailSingle(String email) {
        try {
            return manager.createQuery("select u from User u where u.email = :email", User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
           
            return null;
        }
    }
    
    public User buscaPorId(int id) {
        return manager.find(User.class, id);
    }

    public void remove(int id) {
        manager.createQuery("delete from User u where u.id = :id")
                .setParameter("id", id)
                .executeUpdate();
    }

    public User verificaLogin(String email, String senha) {
        return manager.createQuery("select u from User u where u.email = :email and u.senha = :senha", User.class)
                .setParameter("email", email)
                .setParameter("senha", senha)
                .getResultList()
                .stream()
                .findFirst()
                .orElse(null);
    }

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
}

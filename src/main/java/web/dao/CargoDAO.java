package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.Cargo;

@Transactional
@Repository
public class CargoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public void adiciona(Cargo cargo) {
		manager.persist(cargo);
	}

	public void altera(Cargo cargo) {
		manager.merge(cargo);
	}

	public List<Cargo> lista() {
		return manager.createQuery("select c from Cargo c ", Cargo.class).getResultList();
	}

	public List<Cargo> buscaPorNome(String nome) {
		return manager.createQuery("select c from Cargo c where c.nome = :nome", Cargo.class).setParameter("nome", nome)
				.getResultList();
	}

	public String buscaNomePorId(int id) {
		return manager.createQuery("select c.nome from Cargo c where c.id = :id", String.class).setParameter("id", id)
				.getSingleResult();
	}

	public Cargo buscaPorId(int id) {
		return manager.find(Cargo.class, id);
	}

	public void remove(int id) {
		manager.createQuery("delete from Cargo c where c.id = :id").setParameter("id", id).executeUpdate();
	}

}

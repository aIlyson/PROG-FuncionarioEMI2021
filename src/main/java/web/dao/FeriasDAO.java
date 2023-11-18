package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.Ferias;

@Repository
@Transactional
public class FeriasDAO {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Ferias ferias) {
		manager.persist(ferias);
	}

	public void altera(Ferias ferias) {
		manager.merge(ferias);
	}

	public List<Ferias> lista() {
		return manager.createQuery("select f from Ferias f", Ferias.class).getResultList();
	}

	public Ferias buscaPorId(int id) {
		return manager.find(Ferias.class, id);
	}

	public void remove(int id) {
		manager.createQuery("delete from Ferias f where f.id = :id").setParameter("id", id).executeUpdate();
	}
}

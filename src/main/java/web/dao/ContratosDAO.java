package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.Contratos;

@Repository
@Transactional
public class ContratosDAO {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Contratos contratos) {
		manager.persist(contratos);
	}

	public void altera(Contratos contratos) {
		manager.merge(contratos);
	}

	public List<Contratos> lista() {
		return manager.createQuery("select c from Contratos c", Contratos.class).getResultList();
	}

	public Contratos buscaPorId(int id) {
		return manager.find(Contratos.class, id);
	}

	public List<Contratos> buscaPorMatricula(String matricula) {
		return manager.createQuery("select c from Contratos c where c.matricula = :matricula", Contratos.class)
				.setParameter("matricula", matricula).getResultList();
	}

	public void remove(int id) {
		manager.createQuery("delete from Contratos c where c.id = :id").setParameter("id", id).executeUpdate();
	}
}

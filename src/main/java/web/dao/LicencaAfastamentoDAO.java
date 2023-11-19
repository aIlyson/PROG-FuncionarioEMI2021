package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.LicencaAfastamento;

@Repository
@Transactional
public class LicencaAfastamentoDAO {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(LicencaAfastamento licencaafastamento) {
		manager.persist(licencaafastamento);
	}

	public void altera(LicencaAfastamento licencaafastamento) {
		manager.merge(licencaafastamento);
	}

	public List<LicencaAfastamento> lista() {
		return manager.createQuery("select l from LicencaAfastamento l", LicencaAfastamento.class).getResultList();
	}

	public LicencaAfastamento buscaPorId(int id) {
		return manager.find(LicencaAfastamento.class, id);
	}

	public List<LicencaAfastamento> listaFuncionariosComLicencas() {
		return manager
				.createQuery("select l from LicencaAfastamento l join fetch l.funcionarios f where f.id is not null",
						LicencaAfastamento.class)
				.getResultList();
	}

	public List<LicencaAfastamento> listaLicencasPorFuncionario(int funcionarioId) {
		return manager.createQuery("select l from LicencaAfastamento l where l.funcionarios.id = :funcionarioId",
				LicencaAfastamento.class).setParameter("funcionarioId", funcionarioId).getResultList();
	}

	public void remove(int id) {
		manager.createQuery("delete from LicencaAfastamento l where l.id = :id").setParameter("id", id).executeUpdate();
	}
}

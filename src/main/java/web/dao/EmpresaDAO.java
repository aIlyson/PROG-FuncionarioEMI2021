package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.Empresa;

@Repository
@Transactional
public class EmpresaDAO {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Empresa empresa) {
		manager.persist(empresa);
	}

	public void altera(Empresa empresa) {
		manager.merge(empresa);
	}

	public List<Empresa> lista() {
		return manager.createQuery("select e from Empresa e", Empresa.class).getResultList();
	}

	public Empresa buscaPorId(int id) {
		return manager.find(Empresa.class, id);
	}

	public List<Empresa> buscaPorCnpj(String cnpj) {
		return manager.createQuery("select e from Empresa e where e.cnpj = :cnpj", Empresa.class)
				.setParameter("cnpj", cnpj).getResultList();
	}

	public void remove(int id) {
		manager.createQuery("delete from Empresa e where e.id = :id").setParameter("id", id).executeUpdate();
	}
}

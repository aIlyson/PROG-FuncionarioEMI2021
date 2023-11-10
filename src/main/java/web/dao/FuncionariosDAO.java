package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.Funcionarios;

@Repository
@Transactional
public class FuncionariosDAO {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Funcionarios funcionario) {
		manager.persist(funcionario);
	}

	public void altera(Funcionarios funcionario) {
		manager.merge(funcionario);
	}

	public List<Funcionarios> lista() {
		return manager.createQuery("select f from Funcionarios f", Funcionarios.class).getResultList();
	}

	public Funcionarios buscaPorId(int id) {
		return manager.find(Funcionarios.class, id);
	}

	public List<Funcionarios> buscaPorEmail(String email) {
		return manager.createQuery("select f from Funcionarios f where f.email = :email", Funcionarios.class)
				.setParameter("email", email).getResultList();
	}

	public void remove(int id) {
		manager.createQuery("delete from Funcionarios f where f.id = :id").setParameter("id", id).executeUpdate();
	}
}

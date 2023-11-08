package web.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import web.modelo.Endereco;

@Transactional
@Repository
public class EnderecoDAO {

	@PersistenceContext
	private EntityManager manager;

	public void adiciona(Endereco endereco) {
	    if (endereco.getCep() != null && endereco.getCep().length() > 9) {
	        throw new IllegalArgumentException("CEP deve ter no máximo 9 caracteres");
	    }
	    manager.persist(endereco);
	}


	public void altera(Endereco endereco) {
		manager.merge(endereco);
	}

	public List<Endereco> listar() {
		return manager.createQuery("select e from Endereco e", Endereco.class).getResultList();
	}

	public List<Endereco> buscarPorCep(String cep) {
		return manager.createQuery("select e from Endereco e where e.cep = :cep", Endereco.class)
				.setParameter("cep", cep).getResultList();
	}

	public String buscarCepPorId(int id) {
		return manager.createQuery("select e.cep from Endereco e where e.id = :id", String.class)
				.setParameter("id", id).getSingleResult();
	}

	public Endereco buscarPorId(int id) {
		return manager.find(Endereco.class, id);
	}

	public void remover(int id) {
		manager.createQuery("delete from Endereco e where e.id = :id").setParameter("id", id).executeUpdate();
	}
}
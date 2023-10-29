package web.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;


@Entity
public class Empresa {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@NotNull
    private String nome;
    
	@NotNull
	private String cnpj;

	private String email;
	
	@NotNull
	@ManyToOne
	private Endereco endereco;

    public int getIdEmpresa() {
        return id;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.id = idEmpresa;
    }

    public String getNomeEmpresa() {
        return nome;
    }

    public void setNomeEmpresa(String nomeEmpresa) {
        this.nome = nomeEmpresa;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

    @Override
    public String toString() {
        return "Empresa{" +
                "idEmpresa=" + id +
                ", nomeEmpresa='" + nome + '\'' +
                ", cnpj='" + cnpj + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

}

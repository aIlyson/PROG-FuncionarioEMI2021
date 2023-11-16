package web.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


@Entity
public class Empresa {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@NotNull
	@Column(unique = true)
	private String cnpj;
	
	@NotNull
	private String razao;
	
	@Size(max = 12)
	@NotNull
	private String cep;
    
	@NotNull
    private String nome;
	
	@NotNull
    private String cidade;
    
	@NotNull
	private String estado;

	private String email;
	
    public int getId() {
        return id;
    }

    public void setId(int idEmpresa) {
        this.id = idEmpresa;
    }


    public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }
    

    public String getRazao() {
        return razao;
    }

    public void setRazao(String razao) {
        this.razao = razao;
    }
    

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }
    

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Empresa{" +
                "id=" + id +
                ", nomeEmpresa='" + nome + '\'' + 
                ", cnpj='" + cnpj + '\'' +
                ", cep='" + cep + '\'' +
                ", estado='" + estado + '\'' +
                ", cidade='" + cidade + '\'' +
                ", razao='" + razao + '\'' +
                ", email='" + email + '\'' +
                '}';
    }

}

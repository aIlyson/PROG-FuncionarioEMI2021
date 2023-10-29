package web.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Dependentes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idDependentes;
	
	@NotNull
	@Size(max = 50)
    private String nome;
    
	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataNascimento;
	
	@NotNull
	@ManyToOne
	private Funcionarios funcionarios;
	
	@NotNull
	@ManyToOne
	private Endereco endereco;

    public int getIdDependentes() {
        return idDependentes;
    }

    public void setIdDependentes(int idDependentes) {
        this.idDependentes = idDependentes;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
    
	public Funcionarios getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(Funcionarios funcionarios) {
		this.funcionarios = funcionarios;
	}
	
	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

    @Override
    public String toString() {
        return "Dependente{" +
                "idDependentes=" + idDependentes +
                ", nome='" + nome + '\'' +
                ", dataNascimento=" + dataNascimento +
                '}';
    }

}

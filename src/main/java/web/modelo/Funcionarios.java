package web.modelo;

import java.util.Date;

import javax.persistence.Column;
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
public class Funcionarios {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idFuncionarios;
	
	@NotNull
	@Size(max = 50)
    private String nome;
	
	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataNascimento;
    
	@NotNull
    private boolean status;
    
	@Column(unique = true)
    private String email;
    
	@NotNull
	@ManyToOne
	private Endereco endereco;

    public int getIdFuncionarios() {
        return idFuncionarios;
    }

    public void setIdFuncionarios(int idFuncionarios) {
        this.idFuncionarios = idFuncionarios;
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

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
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
        return "Funcionario{" +
                "idFuncionarios=" + idFuncionarios +
                ", nome='" + nome + '\'' +
                ", dataNascimento=" + dataNascimento +
                ", status=" + status +
                ", email='" + email + '\'' +
                '}';
    }

}

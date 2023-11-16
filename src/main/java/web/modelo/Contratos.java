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

import org.springframework.format.annotation.DateTimeFormat;


@Entity
public class Contratos {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	@NotNull
    private int status;
    
	@NotNull
	@Column(unique = true)
    private String matricula;
    
	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataInicio;
	
	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataEncerramento;
	
	@NotNull
	@ManyToOne
	private Funcionarios funcionarios;
	
	@NotNull
	@ManyToOne
	private Cargo cargo;
	
	@NotNull
	@ManyToOne
	private Empresa empresa;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataEncerramento() {
        return dataEncerramento;
    }

    public void setDataEncerramento(Date dataEncerramento) {
        this.dataEncerramento = dataEncerramento;
    }
    
	public Funcionarios getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(Funcionarios funcionarios) {
		this.funcionarios = funcionarios;
	}
    
	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

	@Override
	public String toString() {
	    return "Contrato{" +
	            "id=" + id +
	            ", status=" + status +
	            ", matricula='" + matricula + '\'' +
	            ", dataInicio=" + dataInicio +
	            ", dataEncerramento=" + dataEncerramento +
	            ", funcionarios=" + funcionarios +
	            ", cargo=" + cargo +
	            ", empresa=" + empresa +
	            '}';
	}


}

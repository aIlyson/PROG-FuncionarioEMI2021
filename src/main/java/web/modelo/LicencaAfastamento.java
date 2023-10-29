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

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class LicencaAfastamento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idLicenca;
	
	@NotNull
    private String tipoLicenca;
    
	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataInicio;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataFim;
	
	@NotNull
	@ManyToOne
	private Funcionarios funcionarios;

    public int getIdLicenca() {
        return idLicenca;
    }

    public void setIdLicenca(int idLicenca) {
        this.idLicenca = idLicenca;
    }

    public String getTipoLicenca() {
        return tipoLicenca;
    }

    public void setTipoLicenca(String tipoLicenca) {
        this.tipoLicenca = tipoLicenca;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }
    
	public Funcionarios getFuncionarios() {
		return funcionarios;
	}

	public void setFuncionarios(Funcionarios funcionarios) {
		this.funcionarios = funcionarios;
	}

    @Override
    public String toString() {
        return "Licenca{" +
                "idLicenca=" + idLicenca +
                ", tipoLicenca='" + tipoLicenca + '\'' +
                ", dataInicio=" + dataInicio +
                ", dataFim=" + dataFim +
                '}';
    }

}

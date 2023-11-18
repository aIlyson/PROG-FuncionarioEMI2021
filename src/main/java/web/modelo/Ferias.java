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
public class Ferias {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataInicio;
    
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dataEncerramento;
	
	@NotNull
	@ManyToOne
	private Contratos contratos;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

	public Contratos getContratos() {
		return contratos;
	}

	public void setContratos(Contratos contratos) {
		this.contratos = contratos;
	}
	
    @Override
    public String toString() {
        return "Ferias{" +
                "id=" + id +
                ", dataInicio=" + dataInicio +
                ", dataEncerramento=" + dataEncerramento +
                '}';
    }

}

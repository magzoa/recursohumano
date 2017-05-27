package py.enterprisesoft.api.entidad;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Ausencia {
	@Id
	private Integer codigo;
	private Persona codPersona;
	private Date fechaInicio;
	private Date fechaFin;
    private String descripcion;
    private TipoAusencia tipoAusencia;
	
    
    public Ausencia() {
		super();
		this.codigo = 0;
		this.codPersona = new Persona();
		this.fechaInicio = new Date();
		this.fechaFin = new Date();
		this.descripcion = "";
		this.tipoAusencia = new TipoAusencia();	}


	public Ausencia(Integer codigo, Persona codPersona, Date fechaInicio, Date fechaFin, String descripcion,
			TipoAusencia tipoAusencia) {
		super();
		this.codigo = codigo;
		this.codPersona = codPersona;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.descripcion = descripcion;
		this.tipoAusencia = tipoAusencia;
	}


	public Integer getCodigo() {
		return codigo;
	}


	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}


	public Persona getCodPersona() {
		return codPersona;
	}


	public void setCodPersona(Persona codPersona) {
		this.codPersona = codPersona;
	}


	public Date getFechaInicio() {
		return fechaInicio;
	}


	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}


	public Date getFechaFin() {
		return fechaFin;
	}


	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public TipoAusencia getTipoAusencia() {
		return tipoAusencia;
	}


	public void setTipoAusencia(TipoAusencia tipoAusencia) {
		this.tipoAusencia = tipoAusencia;
	}


	@Override
	public String toString() {
		return "Ausencia [codigo=" + codigo + ", codPersona=" + codPersona + ", fechaInicio=" + fechaInicio
				+ ", fechaFin=" + fechaFin + ", descripcion=" + descripcion + ", tipoAusencia=" + tipoAusencia + "]";
	}
    
	
	
	
    
    

}

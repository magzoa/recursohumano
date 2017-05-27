package py.enterprisesoft.api.entidad;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity

public class Liquidacion implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private Integer numero;
	
	@OneToMany(mappedBy="numeroLiquidacion", cascade={CascadeType.PERSIST}, orphanRemoval=true)
	private Collection<LiquidacionDetalle> liquidaciondetalle;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="liq_codper")
	private Persona codigoPersona;
	private Date fecha;
	private Double monto;
	private String observacion;
	
	public Liquidacion() {
		super();
		this.numero = 0;
		this.codigoPersona = new Persona();
		this.fecha = new Date ();
		this.monto = new Double(0);
		this.observacion = "";
	}

	public Liquidacion(Integer numero, Date fecha, Double monto,Persona codigoPersona, String observacion) {
		super();
		this.numero = numero;
		this.codigoPersona = codigoPersona;
		this.fecha = fecha;
		this.monto = monto;
		this.observacion = observacion;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public Persona getCodigoPersona() {
		return codigoPersona;
	}

	public void setCodigoPersona(Persona codigoPersona) {
		this.codigoPersona = codigoPersona;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}



	@Override
	public String toString() {
		return "Liquidacion [numero=" + numero + ", codigoPersona=" + codigoPersona + ", fecha=" + fecha + ", monto="
				+ monto + ", observacion=" + observacion + "]";
	}

	
	
	
}

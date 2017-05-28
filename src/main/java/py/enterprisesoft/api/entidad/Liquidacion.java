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

import py.enterprisesoft.api.model.general.General;
@Entity

public class Liquidacion extends General implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy="liquidacion")
	private Collection<LiquidacionDetalle> liquidaciondetalle;
	
	@ManyToOne()
	private Personal personal;
	private Date fecha;
	private Double monto;
	private String observacion;
	
	public Liquidacion() {
		super();
//		this.personal = new Personal();
//		this.fecha = new Date ();
//		this.monto = new Double(0);
		this.observacion = "";
	}

	public Collection<LiquidacionDetalle> getLiquidaciondetalle() {
		return liquidaciondetalle;
	}

	public void setLiquidaciondetalle(Collection<LiquidacionDetalle> liquidaciondetalle) {
		this.liquidaciondetalle = liquidaciondetalle;
	}

	public Personal getCodigoPersona() {
		return personal;
	}

	public void setCodigoPersona(Personal codigoPersona) {
		this.personal = codigoPersona;
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

	
	
	
}

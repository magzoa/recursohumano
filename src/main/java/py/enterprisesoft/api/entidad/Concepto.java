package py.enterprisesoft.api.entidad;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import py.enterprisesoft.api.model.general.General;

@Entity
public class Concepto extends General {
	
	
	@OneToMany(mappedBy="concepto")
	private Collection <LiquidacionDetalle> liquidaciondetalle;


	private String descripcion;

	public Concepto() {
		super();
		this.descripcion = "";
	}

	public Collection<LiquidacionDetalle> getLiquidaciondetalle() {
		return liquidaciondetalle;
	}

	public void setLiquidaciondetalle(Collection<LiquidacionDetalle> liquidaciondetalle) {
		this.liquidaciondetalle = liquidaciondetalle;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	
	
}

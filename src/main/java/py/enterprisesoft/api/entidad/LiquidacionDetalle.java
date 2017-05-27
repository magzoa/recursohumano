package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import py.enterprisesoft.api.model.general.General;

@Entity

public class LiquidacionDetalle extends General{

	
	
	@ManyToOne()
	private Liquidacion liquidacion;
	
	@ManyToOne()
	private Concepto concepto;

	private Double montoParcial;
	
	public LiquidacionDetalle() {
		super();
		this.concepto = new Concepto();
		this.liquidacion = new Liquidacion();
		this.montoParcial = new Double(0);
	}

	

	public Liquidacion getLiquidacion() {
		return liquidacion;
	}



	public void setLiquidacion(Liquidacion liquidacion) {
		this.liquidacion = liquidacion;
	}



	

	public Concepto getConcepto() {
		return concepto;
	}



	public void setConcepto(Concepto concepto) {
		this.concepto = concepto;
	}



	public Double getMontoParcial() {
		return montoParcial;
	}

	public void setMontoParcial(Double montoParcial) {
		this.montoParcial = montoParcial;
	}
	
	
	
}

package py.enterprisesoft.api.entidad;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity

public class LiquidacionDetalle implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	private Integer idLiquidacionDetalle;
	
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="lqd_nroliquidacion")
	private Liquidacion numeroLiquidacion;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="lqd_codconcepto")
	private Concepto codigoConcepto;

	private Double montoParcial;
	
	public LiquidacionDetalle() {
		super();
		this.idLiquidacionDetalle =0;
		this.codigoConcepto = new Concepto();
		this.numeroLiquidacion = new Liquidacion();
		this.montoParcial = new Double(0);
	}
	public LiquidacionDetalle(Integer idLiquidacionDetalle, Concepto codigoConcepto, Liquidacion numeroLiquidacion, Double montoParcial) {
		super();
		this.idLiquidacionDetalle = idLiquidacionDetalle;
		this.codigoConcepto = codigoConcepto;
		this.numeroLiquidacion = numeroLiquidacion;
		this.montoParcial = montoParcial;
		
	}
	
	
	public Integer getIdLiquidacionDetalle() {
		return idLiquidacionDetalle;
	}
	public void setIdLiquidacionDetalle(Integer idLiquidacionDetalle) {
		this.idLiquidacionDetalle = idLiquidacionDetalle;
	}
	public Concepto getCodigoConcepto() {
		return codigoConcepto;
	}
	public void setCodigoConcepto(Concepto codigoConcepto) {
		this.codigoConcepto = codigoConcepto;
	}
	public Liquidacion getNumeroLiquidacion() {
		return numeroLiquidacion;
	}
	public void setNumeroLiquidacion(Liquidacion numeroLiquidacion) {
		this.numeroLiquidacion = numeroLiquidacion;
	}
	public Double getMontoParcial() {
		return montoParcial;
	}
	public void setMontoParcial(Double montoParcial) {
		this.montoParcial = montoParcial;
	}
	@Override
	public String toString() {
		return "LiquidacionDetalle [codigoConcepto=" + codigoConcepto + ", numeroLiquidacion=" + numeroLiquidacion
				+ ", montoParcial=" + montoParcial + "]";
	}
	
	
	
}

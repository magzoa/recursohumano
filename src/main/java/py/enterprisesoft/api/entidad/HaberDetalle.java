/**
 * 
 */
package py.enterprisesoft.api.entidad;

/**
 * @author cvargas
 *
 */
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity

public class HaberDetalle implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Id
	private Integer numero;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="had_nrohaber")
	private Haber numeroHaber;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="had_codconcep")
	private Concepto codigoConcepto;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="had_nroliq")
	private Liquidacion numeroLiquidacion;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="had_coddescue")
	private Descuento codigoDescuento;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="had_codboni")
	private Bonificacion codigoBonificacion;
	
	
	
	public HaberDetalle() {
		// TODO Auto-generated constructor stub
		
		super();
		this.numeroHaber = new Haber();
		this.codigoConcepto = new Concepto();
		this.numeroLiquidacion = new Liquidacion();
		this.codigoDescuento = new Descuento() ;
		this.codigoBonificacion = new Bonificacion();
		
	}

	public HaberDetalle(Haber numeroHaber, Concepto codigoConcepto, Liquidacion numeroLiquidacion,
			Descuento codigoDescuento, Bonificacion codigoBonificacion) {
		super();
		this.numeroHaber = numeroHaber;
		this.codigoConcepto = codigoConcepto;
		this.numeroLiquidacion = numeroLiquidacion;
		this.codigoDescuento = codigoDescuento;
		this.codigoBonificacion = codigoBonificacion;
	}

	

	public Haber getNumeroHaber() {
		return numeroHaber;
	}

	public void setNumeroHaber(Haber numeroHaber) {
		this.numeroHaber = numeroHaber;
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

	public Descuento getCodigoDescuento() {
		return codigoDescuento;
	}

	public void setCodigoDescuento(Descuento codigoDescuento) {
		this.codigoDescuento = codigoDescuento;
	}

	public Bonificacion getCodigoBonificacion() {
		return codigoBonificacion;
	}

	public void setCodigoBonificacion(Bonificacion codigoBonificacion) {
		this.codigoBonificacion = codigoBonificacion;
	}

	@Override
	public String toString() {
		return "HaberDetalle [numero=" + numeroHaber + ", codigoConcepto=" + codigoConcepto + ", numeroLiquidacion="
				+ numeroLiquidacion + ", codigoDescuento=" + codigoDescuento + ", codigoBonificacion="
				+ codigoBonificacion + "]";
	}
    
	
	
}

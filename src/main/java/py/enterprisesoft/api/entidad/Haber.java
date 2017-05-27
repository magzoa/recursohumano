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
public class Haber implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	private Integer numero;
	

	@OneToMany(mappedBy="numeroHaber", cascade={CascadeType.PERSIST}, orphanRemoval=true)
	private Collection<HaberDetalle> haberdetalle;
	
	private Float monto;
	private Date fecha;
	private String observacion;
	
	@ManyToOne(cascade={CascadeType.PERSIST})
	@JoinColumn(name="hab_codrubro")
	private Rubro codigoRubro;
	
	public Haber() {
		super();
		this.numero = 0;
		this.monto = new Float(0);
		this.fecha = new Date();
		this.observacion = "";
		this.codigoRubro= new Rubro();
	}

	public Haber(Integer numero, Float monto, Date fecha, String observacion, Rubro codigoRubro) {
		super();
		this.numero = numero;
		this.monto = monto;
		this.fecha = fecha;
		this.observacion = observacion;
		this.codigoRubro = codigoRubro;
	}

	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	
	public Float getMonto() {
		return monto;
	}

	public void setMonto(Float monto) {
		this.monto = monto;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}
	

	public Rubro getCodigoRubro() {
		return codigoRubro;
	}

	public void setCodigoRubro(Rubro codigoRubro) {
		this.codigoRubro = codigoRubro;
	}

	@Override
	public String toString() {
		return "Haber [numero=" + numero + ", monto=" + monto + ", fecha="
				+ fecha + ", observacion=" + observacion + ", codigoRubro=" + codigoRubro + "]";
	}



}

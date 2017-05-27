package py.enterprisesoft.api.entidad;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
@Entity
@Table(name="rhco_tipobonificacion")

public class TipoBonificacion {
	
	@Id
	@Column(name="tbon_cod")
	private Integer codigo;
	
	@OneToMany(mappedBy="codigoTipoBonificacion", cascade={CascadeType.PERSIST}, orphanRemoval=true)
	private Collection<Bonificacion> bonificacion;
	
	@Column(name="tbon_des")
	private String descripcion;
	
	@Column(name="tbon_porcentaje")
	private Float porcentaje;
	
	public TipoBonificacion() {
		super();
		this.codigo = 0;
		this.descripcion = "";
		this.porcentaje = new Float(0);
	}

	public TipoBonificacion(Integer codigo, String descripcion, Float porcentaje) {
		super();
		this.codigo = codigo;
		this.descripcion = descripcion;
		this.porcentaje = porcentaje;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public void setCodigo(Integer codigo) {
		this.codigo = codigo;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Float getPorcentaje() {
		return porcentaje;
	}

	public void setPorcentaje(Float porcentaje) {
		this.porcentaje = porcentaje;
	}

	@Override
	public String toString() {
		return "TipoBonificacion[codigo=" + codigo + ", descripcion=" + descripcion + ", porcentaje=" + porcentaje + "]";
	}

	
	
}

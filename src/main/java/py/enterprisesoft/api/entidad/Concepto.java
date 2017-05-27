package py.enterprisesoft.api.entidad;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
public class Concepto {
	@Id
	private Integer codigo;
	
	@OneToMany(mappedBy="codigoConcepto", cascade={CascadeType.PERSIST}, orphanRemoval=true)
	private Collection<LiquidacionDetalle> liquidaciondetalle;


	private String descripcion;

	public Concepto() {
		super();
		this.codigo = 0;
		this.descripcion = "";
	}



	public Concepto(Integer codigo, String descripcion) {
		super();
		this.codigo = codigo;
		this.descripcion = descripcion;
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



	@Override
	public String toString() {
		return "Concepto [codigo=" + codigo + ", descripcion=" + descripcion + "]";
	}

	
	
	
}

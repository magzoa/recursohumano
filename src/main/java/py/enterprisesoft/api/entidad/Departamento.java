package py.enterprisesoft.api.entidad;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity

public class Departamento {
	
	@Id
	private Integer codigo;
	
	@OneToMany(mappedBy="codigoDepartamento", cascade={CascadeType.PERSIST}, orphanRemoval=true)
	private Collection<Cargo> cargo;
	
	private String descripcion;
	
	
	public Departamento() {
		super();
		this.codigo = 0;
		this.descripcion = "";	
		}
	public Departamento(Integer codigo, String descripcion) {
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
		return "Departamento [codigo=" + codigo + ", descripcion=" + descripcion + "]";
	}
	
	
}

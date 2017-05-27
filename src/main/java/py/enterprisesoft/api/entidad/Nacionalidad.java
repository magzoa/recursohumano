package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="rhrl_persona")
public class Nacionalidad {
	
	private Integer codigo;
	private String descripcion;
	public Nacionalidad() {
		super();
		this.codigo = 0;
		this.descripcion = "";	
		}
	public Nacionalidad(Integer codigo, String descripcion) {
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
		return "Nacionalidad [codigo=" + codigo + ", descripcion=" + descripcion + "]";
	}
	
	
}

package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TipoEntradaSalida {
	@Id
	private Integer codigo;
	private String descripcion;
	public TipoEntradaSalida() {
		super();
		this.codigo = 0;
		this.descripcion = "";	}
	public TipoEntradaSalida(Integer codigo, String descripcion) {
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
		return "TipoEntradaSalida [codigo=" + codigo + ", descripcion=" + descripcion + "]";
	}
	
}

package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;

import py.enterprisesoft.api.model.general.General;

@Entity
public class TipoDocumento extends General {
	
	//bi-directional many-to-one association to Pedido
	
	//@OneToMany(mappedBy="persona", cascade={CascadeType.PERSIST}, orphanRemoval=true)
	
	
	private String descripcion;
	
	public TipoDocumento() {
		super();
		this.descripcion = "";	
		}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
	
}

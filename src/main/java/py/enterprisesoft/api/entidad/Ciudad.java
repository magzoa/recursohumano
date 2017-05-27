package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;
import javax.persistence.Id;

import py.enterprisesoft.api.model.general.General;

@Entity
public class Ciudad  extends General{
	
	private String descripcion;
	
	
	public Ciudad() {
		this.descripcion = "";	
		}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
}

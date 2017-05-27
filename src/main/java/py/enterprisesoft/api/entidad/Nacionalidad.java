package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import py.enterprisesoft.api.model.general.General;

@Entity
public class Nacionalidad extends General {
	
	private String descripcion;
	public Nacionalidad() {
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

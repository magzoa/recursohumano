package py.enterprisesoft.api.entidad;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import py.enterprisesoft.api.model.general.General;
@Entity
public class Rubro extends General implements Serializable{
	
	private static final long serialVersionUID = 1L;


	
	private String descripcion;
	
	public Rubro() {
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

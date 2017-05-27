package py.enterprisesoft.api.entidad;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import py.enterprisesoft.api.model.general.General;

@Entity

public class Departamento extends General {
	
	
	@OneToMany(mappedBy="departamento")
	private Collection<Cargo> cargo;
	
	private String descripcion;
	
	
	public Departamento() {
		super();
		this.descripcion = "";	
		}


	public Collection<Cargo> getCargo() {
		return cargo;
	}


	public void setCargo(Collection<Cargo> cargo) {
		this.cargo = cargo;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	
	
	
	
}

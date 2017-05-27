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

public class Funcion extends General{
	
	
	@OneToMany(mappedBy="funcion")
	private Collection<Cargo> cargo;
	
	private String descripcion;
	
	
	public Funcion() {
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

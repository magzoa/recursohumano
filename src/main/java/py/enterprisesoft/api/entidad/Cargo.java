package py.enterprisesoft.api.entidad;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import py.enterprisesoft.api.model.general.General;

@Entity
public class Cargo extends General{
	
	private String descripcion;

	@ManyToOne()
	private Funcion funcion;

	@ManyToOne()
	private Departamento departamento;

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	

	public Funcion getFuncion() {
		return funcion;
	}

	public void setFuncion(Funcion funcion) {
		this.funcion = funcion;
	}

	public Departamento getDepartamento() {
		return departamento;
	}

	public void setDepartamento(Departamento departamento) {
		this.departamento = departamento;
	}

		
	
	

	
	
}

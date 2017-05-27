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
public class Salario extends General {
	
	
	@OneToMany(mappedBy="salario")
	private Collection<Contrato> contrato;
		
	private String descripcion;
	
	private Double monto;
	
	public Salario() {
		super();
		this.descripcion = "";	
		this.monto = new Double(0);	
		}

	public Collection<Contrato> getContrato() {
		return contrato;
	}

	public void setContrato(Collection<Contrato> contrato) {
		this.contrato = contrato;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Double getMonto() {
		return monto;
	}

	public void setMonto(Double monto) {
		this.monto = monto;
	}
	

	
}

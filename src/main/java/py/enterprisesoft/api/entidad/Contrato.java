package py.enterprisesoft.api.entidad;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import py.enterprisesoft.api.model.general.General;

@Entity
public class Contrato extends General {
	
	private Integer numero;
	private String descripcion;
	
	@ManyToOne()
	private Salario salario;
	
	@ManyToOne()
	private Personal personal;
	@ManyToOne()
	private Cargo cargo;
	private Date fechaIngreso;
	
	public Contrato() {
		this.numero = 0;
		this.descripcion = "";
//		this.salario = new Salario();
//		this.personal = new Personal();
//		this.cargo = new Cargo();
//		this.fechaIngreso = new Date();	
		}

	public Contrato(Integer numero, String descripcion, Salario codSalario, Personal codPersona, Cargo codCargo,
			Date fechaIngreso) {
		super();
		this.numero = numero;
		this.descripcion = descripcion;
		this.salario = codSalario;
		this.personal = codPersona;
		this.cargo = codCargo;
		this.fechaIngreso = fechaIngreso;
	}

	
	public Integer getNumero() {
		return numero;
	}

	public void setNumero(Integer numero) {
		this.numero = numero;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	

	public Salario getSalario() {
		return salario;
	}

	public void setSalario(Salario salario) {
		this.salario = salario;
	}

	public Personal getPersonal() {
		return personal;
	}

	public void setPersonal(Personal personal) {
		this.personal = personal;
	}

	public Personal getCodigoPersona() {
		return personal;
	}

	public void setCodigoPersona(Personal codigoPersona) {
		this.personal = codigoPersona;
	}

	
	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public Date getFechaIngreso() {
		return fechaIngreso;
	}

	public void setFechaIngreso(Date fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	@Override
	public String toString() {
		return "Contrato [numero=" + numero + ", descripcion=" + descripcion + ", codPersona=" + personal
				+ ", codCargo=" + cargo + ", fechaIngreso=" + fechaIngreso + "]";
	}

}

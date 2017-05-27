package py.enterprisesoft.api.model.general;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

/**
 * @author Magno Portillo
 * @since 31/10/2016
 * 
 *        Clase que contiene todos los atributos correspondiente
 * 
 *        a una persona dentro del sistema
 */

@MappedSuperclass
public abstract class Persona extends General {
	


	private static final long serialVersionUID = 1L;

	@NotBlank
	private String nombre;

	private String apellido;

	private String direccion;

	@Column(unique = true)
	private String ci;

	@Column(unique = true)
	private String telefono;
	@Column(unique = true)
	private String celular;
	@Column(unique = true)
	@Email
	private String email;
	
	
	public Persona() {
		super();
		this.nombre = "";
		this.apellido = "";
		this.direccion = "";
		this.ci = "";
		this.telefono = "";
		this.celular = "";
		this.email = "";
	}
	
	

	public Persona(String nombre, String apellido, String direccion, String ci, String telefono, String celular,
			String email) {
		super();
		this.nombre = nombre;
		this.apellido = apellido;
		this.direccion = direccion;
		this.ci = ci;
		this.telefono = telefono;
		this.celular = celular;
		this.email = email;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getCi() {
		return ci;
	}

	public void setCi(String ci) {
		this.ci = ci;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCelular() {
		return celular;
	}

	public void setCelular(String celular) {
		this.celular = celular;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}



	@Override
	public String toString() {
		return "Persona [nombre=" + nombre + ", apellido=" + apellido + ", direccion=" + direccion + ", ci=" + ci
				+ ", telefono=" + telefono + ", celular=" + celular + ", email=" + email + ", toString()="
				+ super.toString() + "]";
	}
	

}

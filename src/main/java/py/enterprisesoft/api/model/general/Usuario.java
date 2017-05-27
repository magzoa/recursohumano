package py.enterprisesoft.api.model.general;

import javax.persistence.Entity;

/**
 * @author Magno Portillo
 * @since 02/10/2016
 */

@Entity
public class Usuario extends Persona {

	private String estado;

	private String pass;

	private String obs;
	
	

	
	public Usuario() {
		super();
		this.estado = "";
		this.pass = "";
		this.obs = "";
		
	}
	

	public Usuario(String estado, String pass, String obs) {
		super();
		this.estado = estado;
		this.pass = pass;
		this.obs = obs;
		
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getObs() {
		return obs;
	}

	public void setObs(String obs) {
		this.obs = obs;
	}

	

}

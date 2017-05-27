package py.enterprisesoft.api.model.general;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * @author Magno Portillo
 * @since 31/10/2016
 */

@MappedSuperclass
public abstract class General {

	//@JsonIgnore
	//private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	public General() {
		super();
		this.id = 0;
	}
	

	public General(Integer id) {
		super();
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "General [id=" + id + "]";
	}
	
	

}

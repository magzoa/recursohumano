package py.enterprisesoft.api.entidad;

import java.util.Arrays;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import py.enterprisesoft.api.model.general.Persona;
@Entity
public class Personal extends Persona{
	

	private Date fecha_nacimiento;
	private String nacionalidad;
	private String estadoCivil;
	private String sexo;
	private String estado;	
	private String observacion;
	
	

	private byte[] imagen;
	
	
	@OneToMany(mappedBy="personal")
	private Collection<Liquidacion> liquidacion;
	
	
	
	@OneToMany(mappedBy="personal")
	private Collection<Contrato> contrato;
	
	
	@ManyToOne()
	private TipoDocumento tipodocumento;


	public Date getFecha_nacimiento() {
		return fecha_nacimiento;
	}


	public void setFecha_nacimiento(Date fecha_nacimiento) {
		this.fecha_nacimiento = fecha_nacimiento;
	}


	public String getNacionalidad() {
		return nacionalidad;
	}


	public void setNacionalidad(String nacionalidad) {
		this.nacionalidad = nacionalidad;
	}


	public String getEstadoCivil() {
		return estadoCivil;
	}


	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}


	public String getSexo() {
		return sexo;
	}


	public void setSexo(String sexo) {
		this.sexo = sexo;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}


	public String getObservacion() {
		return observacion;
	}


	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}


	public byte[] getImagen() {
		return imagen;
	}


	public void setImagen(byte[] imagen) {
		this.imagen = imagen;
	}


	public Collection<Liquidacion> getLiquidacion() {
		return liquidacion;
	}


	public void setLiquidacion(Collection<Liquidacion> liquidacion) {
		this.liquidacion = liquidacion;
	}


	public Collection<Contrato> getContrato() {
		return contrato;
	}


	public void setContrato(Collection<Contrato> contrato) {
		this.contrato = contrato;
	}


	public TipoDocumento getTipodocumento() {
		return tipodocumento;
	}


	public void setTipodocumento(TipoDocumento tipodocumento) {
		this.tipodocumento = tipodocumento;
	}


	@Override
	public String toString() {
		return "Personal [fecha_nacimiento=" + fecha_nacimiento + ", nacionalidad=" + nacionalidad + ", estadoCivil="
				+ estadoCivil + ", sexo=" + sexo + ", estado=" + estado + ", observacion=" + observacion + ", imagen="
				+ Arrays.toString(imagen) + ", liquidacion=" + liquidacion + ", contrato=" + contrato
				+ ", tipodocumento=" + tipodocumento + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
	}

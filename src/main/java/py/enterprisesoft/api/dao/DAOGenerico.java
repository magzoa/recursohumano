package py.enterprisesoft.api.dao;

import java.util.List;

import javax.persistence.EntityManager;

/**
 * @author Magno Portillo
 * @since 02/10/2016
 * Modificado el método guardar 08_03_2017
 */



public abstract class DAOGenerico<T> {

	private Class<T> entityClass;

	public DAOGenerico(Class<T> entityClass) {
		this.entityClass = entityClass;
	}

	protected abstract EntityManager getEntityManager();

	public void insertar(T entity) {
		getEntityManager().persist(entity);// Es manipulado por EM
	}

	// METODO PARA ACTUALIZAR
	public void actualizar(T entity) {
		getEntityManager().merge(entity);// actualiza
	}

	// METODO PARA BUSCAR
	public T buscar(Object id) {
		// System.out.println("Entidad: "+getEntityManager().find(entityClass,
		// id));
		return getEntityManager().find(entityClass, id);

	}

	// METODO PARA GUARDAR
	public void guardar(T entity) {
		
		    	Object id = getEntityManager().getEntityManagerFactory().getPersistenceUnitUtil().getIdentifier(entity);    	
		    	
		    	System.out.println("El id en guardar es: "+id);
		    	if(id!=null){
		    	if(buscar(id)==null){   	   	
		        	getEntityManager().persist(entity);
		    	}else{  	   	
		        	getEntityManager().merge(entity);
		    	}
		    	}else{
		    		getEntityManager().persist(entity);
		    	}
	}

	// METODO QUE RETORNA UNA LISTA DE UNA ENTIDAD
	public List<T> getLista() {
		return getEntityManager().createQuery("from " + entityClass.getSimpleName(), entityClass).getResultList();

	}

	// Inicia la transaccion
	public void iniciarTransaccion() {
		if (!getEntityManager().getTransaction().isActive()) {
			getEntityManager().getTransaction().begin();
		}
	}

	// Cierra la transaccion
	public void finalizarTransaccion() {
		if (getEntityManager().getTransaction().isActive()) {
			getEntityManager().getTransaction().commit();// Cierre de la
															// transaccion
		}
	}

	// Mantiene los datos en una copia antes de pasar a la bd
	public void sincronizar() {
		getEntityManager().flush();
	}

	// Cerrar el EM
	public void cerrarEM() {
		if (getEntityManager().isOpen()) {
			getEntityManager().close();
		}
	}

	// Metodo para eliminar
	public void eliminar(T entity) {

		getEntityManager().remove(getEntityManager().contains(entity) ? entity : getEntityManager().merge(entity)

		);

	}

	public void revertirTransaccion() {
		if (getEntityManager().isOpen()) {
			// Revierte en caso de utilizar Flush
			getEntityManager().getTransaction().rollback();
		}

	}

	
	
	// public void cerrarFactory(){
	// if(getFactory().isOpen()){
	// getFactory().close();
	//
	// }
	//
	// }

}

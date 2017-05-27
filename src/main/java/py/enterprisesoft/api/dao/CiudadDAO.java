package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Ciudad;



@Repository
public class CiudadDAO extends DAOGenerico<Ciudad> {

	@PersistenceContext
	private EntityManager em;

	public CiudadDAO() {

		super(Ciudad.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

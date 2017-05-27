package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Nacionalidad;


@Repository
public class NacionalidadDAO extends DAOGenerico<Nacionalidad> {

	@PersistenceContext
	private EntityManager em;

	public NacionalidadDAO() {

		super(Nacionalidad.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

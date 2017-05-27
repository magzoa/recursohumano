package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.EstadoCivil;


@Repository
public class EstadoCivilDAO extends DAOGenerico<EstadoCivil> {

	@PersistenceContext
	private EntityManager em;

	public EstadoCivilDAO() {

		super(EstadoCivil.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

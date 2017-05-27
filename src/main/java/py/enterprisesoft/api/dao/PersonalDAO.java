package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Personal;
import py.enterprisesoft.api.model.general.Persona;

@Repository
public class PersonalDAO extends DAOGenerico<Personal> {

	@PersistenceContext
	private EntityManager em;

	public PersonalDAO() {

		super(Personal.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

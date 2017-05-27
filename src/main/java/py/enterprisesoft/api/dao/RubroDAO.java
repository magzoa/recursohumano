package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Rubro;


@Repository
public class RubroDAO extends DAOGenerico<Rubro> {

	@PersistenceContext
	private EntityManager em;

	public RubroDAO() {

		super(Rubro.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Concepto;


@Repository
public class ConceptoDAO extends DAOGenerico<Concepto> {

	@PersistenceContext
	private EntityManager em;

	public ConceptoDAO() {

		super(Concepto.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

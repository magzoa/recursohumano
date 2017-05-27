package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Contrato;



@Repository
public class ContratoDAO extends DAOGenerico<Contrato> {

	@PersistenceContext
	private EntityManager em;

	public ContratoDAO() {

		super(Contrato.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

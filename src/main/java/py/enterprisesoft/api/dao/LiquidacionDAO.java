package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Liquidacion;



@Repository
public class LiquidacionDAO extends DAOGenerico<Liquidacion> {

	@PersistenceContext
	private EntityManager em;

	public LiquidacionDAO() {

		super(Liquidacion.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

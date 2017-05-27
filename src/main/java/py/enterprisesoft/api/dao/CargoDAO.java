package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Cargo;



@Repository
public class CargoDAO extends DAOGenerico<Cargo> {

	@PersistenceContext
	private EntityManager em;

	public CargoDAO() {

		super(Cargo.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

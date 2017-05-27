package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Funcion;


@Repository
public class FuncionDAO extends DAOGenerico<Funcion> {

	@PersistenceContext
	private EntityManager em;

	public FuncionDAO() {

		super(Funcion.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Salario;

@Repository
public class SalarioDAO extends DAOGenerico<Salario> {

	@PersistenceContext
	private EntityManager em;

	public SalarioDAO() {

		super(Salario.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

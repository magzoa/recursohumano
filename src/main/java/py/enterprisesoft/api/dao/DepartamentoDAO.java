package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.Departamento;


@Repository
public class DepartamentoDAO extends DAOGenerico<Departamento> {

	@PersistenceContext
	private EntityManager em;

	public DepartamentoDAO() {

		super(Departamento.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

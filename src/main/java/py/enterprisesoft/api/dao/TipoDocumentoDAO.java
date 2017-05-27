package py.enterprisesoft.api.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import py.enterprisesoft.api.entidad.TipoDocumento;



@Repository
public class TipoDocumentoDAO extends DAOGenerico<TipoDocumento> {

	@PersistenceContext
	private EntityManager em;

	public TipoDocumentoDAO() {

		super(TipoDocumento.class);
	}

	@Override
	protected EntityManager getEntityManager() {
		// TODO Auto-generated method stub
		return em;
	}

}

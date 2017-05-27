package py.enterprisesoft.api.controller;

import java.util.List;

import javax.sql.DataSource;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import py.enterprisesoft.api.dao.UsuarioDAO;
import py.enterprisesoft.api.error.InvalidRequestException;
import py.enterprisesoft.api.model.general.Usuario;

@RestController
@Transactional
@RequestMapping("/usuario")
public class UsuarioController {
	@Autowired
	private UsuarioDAO usuarioDao;
	@Autowired
	private DataSource dataSource;

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Usuario> registrar(@Valid  @RequestBody Usuario usuario,BindingResult bindingResult) {
		
		
		if(bindingResult.hasErrors()){
			
			 throw new InvalidRequestException("Complete correctamente para registrar un Usuario", bindingResult);
		}
		
		
		usuarioDao.guardar(usuario);
		return new ResponseEntity<Usuario>(usuario, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Usuario>> buscarTodos() {
		List<Usuario> usuarios = usuarioDao.getLista();
		return new ResponseEntity<List<Usuario>>(usuarios, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Usuario> buscarPorLogin(@PathVariable String login) {
		Usuario usuario = usuarioDao.buscar(login);
		return new ResponseEntity<Usuario>(usuario, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Usuario> eliminar(@PathVariable String login) {
		Usuario usuario = usuarioDao.buscar(login);
		if (usuario == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		usuarioDao.eliminar(usuario);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Usuario>> excluirMasivo(@RequestBody List<Usuario> usuarios) {

		for (Usuario usu : usuarios) {
			usuarioDao.eliminar(usu);
			;

		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//----------------------Prueba reporte ------------------
	
	
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	public  ModelAndView listadoUsuario(@PathVariable("reportname")final String reportname
										,@RequestParam(value="format",required=false) final String format
										
			) {

	ModelMap modelMap=new ModelMap();
	    modelMap.put("dev", dataSource);
	    modelMap.put("format",format);	 
	 ModelAndView  modelAndView=new ModelAndView();
	    modelAndView = new ModelAndView(reportname, modelMap);
	 
	    return modelAndView;
	}

}

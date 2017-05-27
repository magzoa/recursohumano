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

import py.enterprisesoft.api.dao.FuncionDAO;
import py.enterprisesoft.api.entidad.Funcion;
import py.enterprisesoft.api.error.InvalidRequestException;


@RestController
@Transactional
@RequestMapping("/funcion")
public class FuncionController {
	@Autowired
	private FuncionDAO funcionDao;
	@Autowired
	private DataSource dataSource;

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Funcion> registrar(@Valid  @RequestBody Funcion funcion,BindingResult bindingResult) {
		
		
		if(bindingResult.hasErrors()){
			
			 throw new InvalidRequestException("Complete correctamente para registrar un Funcion", bindingResult);
		}
		
		
		funcionDao.guardar(funcion);
		return new ResponseEntity<Funcion>(funcion, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Funcion>> buscarTodos() {
		List<Funcion> funcions = funcionDao.getLista();
		return new ResponseEntity<List<Funcion>>(funcions, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Funcion> buscarPorLogin(@PathVariable String login) {
		Funcion funcion = funcionDao.buscar(login);
		return new ResponseEntity<Funcion>(funcion, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Funcion> eliminar(@PathVariable String login) {
		Funcion funcion = funcionDao.buscar(login);
		if (funcion == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		funcionDao.eliminar(funcion);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Funcion>> excluirMasivo(@RequestBody List<Funcion> funcions) {

		for (Funcion usu : funcions) {
			funcionDao.eliminar(usu);
			;

		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//----------------------Prueba reporte ------------------
	
	
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	public  ModelAndView listadoFuncion(@PathVariable("reportname")final String reportname
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

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

import py.enterprisesoft.api.dao.PersonalDAO;
import py.enterprisesoft.api.entidad.Personal;
import py.enterprisesoft.api.error.InvalidRequestException;

@RestController
@Transactional
@RequestMapping("/personal")
public class PersonalController {
	@Autowired
	private PersonalDAO personalDao;
	@Autowired
	private DataSource dataSource;

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Personal> registrar(@Valid  @RequestBody Personal personal,BindingResult bindingResult) {
		
		
		if(bindingResult.hasErrors()){
			
			 throw new InvalidRequestException("Complete correctamente para registrar un Personal", bindingResult);
		}
		
		
		personalDao.guardar(personal);
		return new ResponseEntity<Personal>(personal, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Personal>> buscarTodos() {
		List<Personal> personals = personalDao.getLista();
		return new ResponseEntity<List<Personal>>(personals, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Personal> buscarPorLogin(@PathVariable String login) {
		Personal personal = personalDao.buscar(login);
		return new ResponseEntity<Personal>(personal, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Personal> eliminar(@PathVariable String login) {
		Personal personal = personalDao.buscar(login);
		if (personal == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		personalDao.eliminar(personal);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Personal>> excluirMasivo(@RequestBody List<Personal> personals) {

		for (Personal usu : personals) {
			personalDao.eliminar(usu);
			;

		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//----------------------Prueba reporte ------------------
	
	
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	public  ModelAndView listadoPersonal(@PathVariable("reportname")final String reportname
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

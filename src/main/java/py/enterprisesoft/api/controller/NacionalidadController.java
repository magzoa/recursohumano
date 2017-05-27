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

import py.enterprisesoft.api.dao.NacionalidadDAO;
import py.enterprisesoft.api.entidad.Nacionalidad;
import py.enterprisesoft.api.error.InvalidRequestException;


@RestController
@Transactional
@RequestMapping("/nacionalidad")
public class NacionalidadController {
	@Autowired
	private NacionalidadDAO nacionalidadDao;
	@Autowired
	private DataSource dataSource;

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Nacionalidad> registrar(@Valid  @RequestBody Nacionalidad nacionalidad,BindingResult bindingResult) {
		
		
		if(bindingResult.hasErrors()){
			
			 throw new InvalidRequestException("Complete correctamente para registrar un Nacionalidad", bindingResult);
		}
		
		
		nacionalidadDao.guardar(nacionalidad);
		return new ResponseEntity<Nacionalidad>(nacionalidad, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Nacionalidad>> buscarTodos() {
		List<Nacionalidad> nacionalidads = nacionalidadDao.getLista();
		return new ResponseEntity<List<Nacionalidad>>(nacionalidads, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Nacionalidad> buscarPorLogin(@PathVariable String login) {
		Nacionalidad nacionalidad = nacionalidadDao.buscar(login);
		return new ResponseEntity<Nacionalidad>(nacionalidad, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Nacionalidad> eliminar(@PathVariable String login) {
		Nacionalidad nacionalidad = nacionalidadDao.buscar(login);
		if (nacionalidad == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		nacionalidadDao.eliminar(nacionalidad);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Nacionalidad>> excluirMasivo(@RequestBody List<Nacionalidad> nacionalidads) {

		for (Nacionalidad usu : nacionalidads) {
			nacionalidadDao.eliminar(usu);
			;

		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//----------------------Prueba reporte ------------------
	
	
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	public  ModelAndView listadoNacionalidad(@PathVariable("reportname")final String reportname
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

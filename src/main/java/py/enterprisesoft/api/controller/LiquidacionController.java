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

import py.enterprisesoft.api.dao.LiquidacionDAO;
import py.enterprisesoft.api.entidad.Liquidacion;
import py.enterprisesoft.api.error.InvalidRequestException;


@RestController
@Transactional
@RequestMapping("/liquidacion")
public class LiquidacionController {
	@Autowired
	private LiquidacionDAO liquidacionDao;
	@Autowired
	private DataSource dataSource;

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Liquidacion> registrar(@Valid  @RequestBody Liquidacion liquidacion,BindingResult bindingResult) {
		
		
		if(bindingResult.hasErrors()){
			
			 throw new InvalidRequestException("Complete correctamente para registrar un Liquidacion", bindingResult);
		}
		
		
		liquidacionDao.guardar(liquidacion);
		return new ResponseEntity<Liquidacion>(liquidacion, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Liquidacion>> buscarTodos() {
		List<Liquidacion> liquidacions = liquidacionDao.getLista();
		return new ResponseEntity<List<Liquidacion>>(liquidacions, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Liquidacion> buscarPorLogin(@PathVariable String login) {
		Liquidacion liquidacion = liquidacionDao.buscar(login);
		return new ResponseEntity<Liquidacion>(liquidacion, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Liquidacion> eliminar(@PathVariable String login) {
		Liquidacion liquidacion = liquidacionDao.buscar(login);
		if (liquidacion == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		liquidacionDao.eliminar(liquidacion);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Liquidacion>> excluirMasivo(@RequestBody List<Liquidacion> liquidacions) {

		for (Liquidacion usu : liquidacions) {
			liquidacionDao.eliminar(usu);
			;

		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//----------------------Prueba reporte ------------------
	
	
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	public  ModelAndView listadoLiquidacion(@PathVariable("reportname")final String reportname
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

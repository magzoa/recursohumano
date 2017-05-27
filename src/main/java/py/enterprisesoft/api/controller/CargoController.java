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

import py.enterprisesoft.api.dao.CargoDAO;
import py.enterprisesoft.api.entidad.Cargo;
import py.enterprisesoft.api.error.InvalidRequestException;


@RestController
@Transactional
@RequestMapping("/cargo")
public class CargoController {
	@Autowired
	private CargoDAO cargoDao;
	@Autowired
	private DataSource dataSource;

	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Cargo> registrar(@Valid  @RequestBody Cargo cargo,BindingResult bindingResult) {
		
		
		if(bindingResult.hasErrors()){
			
			 throw new InvalidRequestException("Complete correctamente para registrar un Cargo", bindingResult);
		}
		
		
		cargoDao.guardar(cargo);
		return new ResponseEntity<Cargo>(cargo, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Cargo>> buscarTodos() {
		List<Cargo> cargos = cargoDao.getLista();
		return new ResponseEntity<List<Cargo>>(cargos, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.GET, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Cargo> buscarPorLogin(@PathVariable String login) {
		Cargo cargo = cargoDao.buscar(login);
		return new ResponseEntity<Cargo>(cargo, HttpStatus.OK);
	}

	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Cargo> eliminar(@PathVariable String login) {
		Cargo cargo = cargoDao.buscar(login);
		if (cargo == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		cargoDao.eliminar(cargo);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/eliminar_masivo", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<Cargo>> excluirMasivo(@RequestBody List<Cargo> cargos) {

		for (Cargo usu : cargos) {
			cargoDao.eliminar(usu);
			;

		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//----------------------Prueba reporte ------------------
	
	
	@RequestMapping(value="{reportname}", method=RequestMethod.GET)
	public  ModelAndView listadoCargo(@PathVariable("reportname")final String reportname
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

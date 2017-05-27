package py.enterprisesoft.api.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RestController
public class HomeController {

	@RequestMapping(value="/",method = RequestMethod.GET)
	public ModelAndView index() {

		return new ModelAndView("view/templates/index");

	}
	
	//verificar para habilitar por clase html5 Mode
//	@RequestMapping(value="/enterprisesoft/**",method=RequestMethod.GET)
//    public ModelAndView appHtml5Mode() {
//		System.out.println("Ingrese en Html 5Mode");
//		return new ModelAndView("view/templates/index");
//    }
	
//	@RequestMapping(method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
//	public ResponseEntity<Producto> registrar(@RequestBody String valor,BindingResult bindingResult) {
//		
//		
//		System.out.println(valor);
//		
//	//System.out.println("Producto "+producto.toString());
//		
//		//ObjectMapper map=new ObjectMapper();
//		Producto pro=new Producto();
//		try {
//			
//			//Codigo para verificar el objeto que llega
//		 pro= (Producto) new ObjectMapper().readValue(valor, Producto.class);
//		

}

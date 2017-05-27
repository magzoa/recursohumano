package py.enterprisesoft.api.error;

import java.util.ArrayList;
import java.util.List;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class MyExceptionHandler extends ResponseEntityExceptionHandler {

	@ExceptionHandler({ InvalidRequestException.class })
	protected ResponseEntity<Object> handleInvalidRequest(RuntimeException e, WebRequest request) {
		InvalidRequestException ire = (InvalidRequestException) e;
		List<FieldErrorResource> fieldErrorResources = new ArrayList<>();

		List<FieldError> fieldErrors = ire.getErrors().getFieldErrors();
		for (FieldError fieldError : fieldErrors) {
			FieldErrorResource fieldErrorResource = new FieldErrorResource();
			fieldErrorResource.setResource(fieldError.getObjectName());
			fieldErrorResource.setField(fieldError.getField());
			fieldErrorResource.setCode(fieldError.getCode());
			fieldErrorResource.setMessage(fieldError.getDefaultMessage());
			fieldErrorResources.add(fieldErrorResource);
		}

		ErrorResource error = new ErrorResource("Datos Invalidos ", ire.getMessage());
		error.setFieldErrors(fieldErrorResources);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		System.out.println("Ingrese a error hanler");

		return handleExceptionInternal(e, error, headers, HttpStatus.UNPROCESSABLE_ENTITY, request);
	}


	 @ExceptionHandler(value=DataIntegrityViolationException.class)
	 public ResponseEntity<Object>
	 defaultErrorHandler(DataIntegrityViolationException e, WebRequest request)
	 {
		 
		 if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) !=null){
			 
			 System.out.println("Ingrese a AnnotationUtils"+e.getClass());
		 throw e;
		 }
		 
			
			
			
			FieldErrorResource fieldErrorResource = new FieldErrorResource();
			
			String msj=e.getMostSpecificCause().getMessage();
			
			String mensaje1=msj;
			String mensaje2=msj;
			String atributo=msj;
			
			
			int mfin=msj.indexOf("«");//Posicion del final del parrafo1
			
			
			int mini2=msj.indexOf("Detail:");
			mini2=mini2+7;
			int mfin2=msj.indexOf(".");//Posicion del final del parrafo2
			
			mensaje1=msj.substring(0,mfin);
			mensaje2=msj.substring(mini2, mfin2);
			
			int pos=atributo.indexOf("(");
			
			pos++;
			int pos2=atributo.indexOf(")");
			
			
			atributo=atributo.substring(pos,pos2);
			
			List<FieldErrorResource> fieldErrorResources = new ArrayList<>();
			
			fieldErrorResource.setResource("objeto");
			fieldErrorResource.setField(atributo.trim());
			fieldErrorResource.setCode("Identificador duplicado");
			fieldErrorResource.setMessage(mensaje2.trim());
			
			
			fieldErrorResources.add(fieldErrorResource);
			
			String mco=mensaje1+", "+mensaje2;
			
			ErrorResource error = new ErrorResource("Identificador Duplicado",mco.trim());
			
			error.setFieldErrors(fieldErrorResources);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			System.out.println("Ingrese a error hanler Unique  ");
			
			e.printStackTrace();
	
	
	 return handleExceptionInternal(e, error, headers, HttpStatus.CONFLICT, request);//409
	 }
	 
	 
	 /*
	 public static final String DEFAULT_ERROR_VIEW = "error";

	 @ExceptionHandler(value=DataIntegrityViolationException.class)
	 public ModelAndView
	 defaultErrorHandler(HttpServletRequest req, DataIntegrityViolationException e) throws Exception
	 {
//	 If the exception is annotated with @ResponseStatus rethrow it and let
//	 the framework handle it - like the OrderNotFoundException example
//	 at the start of this post.
//	 AnnotationUtils is a Spring Framework utility class.
//	 if (AnnotationUtils.findAnnotation(e.getClass(), ResponseStatus.class) !=
//	 null){
//	 throw e;
//	 }

	 System.out.println("Ingrese a manejador de Exception en total");
	
	
//	 System.out.println(e.getLocalizedMessage());
//	
//	 System.out.println(e.getCause());
//	 System.out.println(e.getMessage());
//	 System.out.println(e.getCause().getMessage());
	 System.out.println(e.getMostSpecificCause().getMessage());
	 System.out.println(e.getRootCause().getLocalizedMessage());
	 System.out.println(e.getRootCause().getMessage());
	 System.out.println(e.getRootCause().getCause());
	 
	
	 // Otherwise setup and send the user to a default error-view.
	 ModelAndView mav = new ModelAndView();
	 mav.addObject("exception", e);
	 mav.addObject("url", req.getRequestURL());
	
	
	 mav.setViewName(DEFAULT_ERROR_VIEW);
	 return mav;
	 }*/

}

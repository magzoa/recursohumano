

//Funcion cuando pierde el foco
$("#descripcion").blur(function(){
	var validator = $("#departamentoform").validate();
	validator.form();	
});

//Funcion cuando pierde el foco
$("#cargo").blur(function(){
	var validator = $("#departamentoform").validate();
	validator.form();	
});

$(document).ready(function(){
	
	// Extension materialize.css
jQuery(function ($) {
$.validator.setDefaults({
    errorClass: 'invalid',
    validClass: "valid",
    errorPlacement: function (error, element) {
        $(element).closest("#departamentoform")   //     Deve señalarse por el id !!!!!!!!!!!
            .find("label[for='"+element.attr("id")+"']")
            .attr('data-error', error.text());
        console.log(error.text()); 
    }

});

$("#departamentoform").validate({
    
	errorClass: 'invalid',
    validClass: "valid",
	rules: {
        
        descripcion: {
	        required: true
	    },
	    cargo:{   
	    	 required: true
	    }
	    
    }
,errorClass: 'invalid',
validClass: "valid",

//	    $(placement).append(error)
messages: {
    descripcion:{
    	required: "La descripción es obligatoria"
    },
    cargo:{
    	required:"El cargo es obligatorio"
    }
    
}

});
	
	
	
	
//	$("#departamentoform").each(function(){
//		$("#departamentoform").validate();
//	});
	
	});
});
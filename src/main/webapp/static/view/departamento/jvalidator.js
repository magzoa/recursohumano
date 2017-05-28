

//Funcion cuando pierde el foco
$("#descripcion").blur(function(){
	var validator = $("#registroform").validate();
	validator.form();	
});

$(document).ready(function(){
	
	// Extension materialize.css
jQuery(function ($) {
$.validator.setDefaults({
    errorClass: 'invalid',
    validClass: "valid",
    errorPlacement: function (error, element) {
        $(element).closest("#registroform")   //     Deve señalarse por el id !!!!!!!!!!!
            .find("label[for='"+element.attr("id")+"']")
            .attr('data-error', error.text());
        console.log(error.text()); 
    }

});

$("#registroform").validate({
    
	errorClass: 'invalid',
    validClass: "valid",
	rules: {
        
        descripcion: {
	        required: true
	    },
	    monto:{   
	    	 required: true
	    }
	    
    }
,errorClass: 'invalid',
validClass: "valid",

//	    $(placement).append(error)
messages: {
    descripcion:{
    	required: "La descripción es obligatoria"
    }
    
}

});
	
	
	
	
//	$("#registroform").each(function(){
//		$("#registroform").validate();
//	});
	
	});
});


//Funcion cuando pierde el foco
$("#pass1").blur(function(){
	var validator = $("#registroform").validate();
	validator.form();	
});

//Funcion cuando pierde el foco
$("#pass").blur(function(){
	var validator = $("#registroform").validate();
	validator.form();	
});




// $("#pass").change(function(){
  
// });



$(document).ready(function(){
	// Elk formulier met class validate, validatie uitvoeren
	
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
//		,
//    submitHandler: function (form) {
//        console.log('form ok');
//    }
});

$("#registroform").validate({
    
	errorClass: 'invalid',
    validClass: "valid",
	rules: {
        
        pass1: {
	        required: true,
	        minlength: 5
	    },
	    pass: {
	        required: true,
	        minlength: 5,
	        equalTo: "#pass1"
	    },
	    email:{   
	    	 required: true,
	    	 email: true
	    },
	    nombre:{
	    	required:true,
	    	minlength:2
	    	
	    }
	    
    }
,errorClass: 'invalid',
validClass: "valid",

//	    $(placement).append(error)
messages: {
	    pass1: {
        required: "Por favor ingrese la contraseña.",
        minlength: "La contraseña deve contener al menos 5 caracteres."
    },
    pass: {
        required: "Favor confirme la constraseña.",
        minlength: "La contraseña deve contener al menos 5 caracteres.",
        equalTo: "Las contraseñas no coinciden."
    },
    email:{
    	required: "Correo es obligatorio",
    	email:"Formato invalido"
    },
    nombre:{
    	required:"Nombre es obligatorio",
    	minlength:"El nombre deve contener al menos 2 caracteres"
    	
    }
    
}

});
	
	
	
	
//	$("#registroform").each(function(){
//		$("#registroform").validate();
//	});
	
	});
});
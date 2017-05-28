

$(document).ready(function(){
	// Elk formulier met class validate, validatie uitvoeren
	
	// Extension materialize.css
	jQuery(function ($) {
$.validator.setDefaults({
    errorClass: 'invalid',
    validClass: "valid",
    errorPlacement: function (error, element) {
        $(element).closest("#registroformgrupo")   //     Deve señalarse por el id !!!!!!!!!!!
            .find("label[for='"+element.attr("id")+"']")
            .attr('data-error', error.text());
        console.log(error.text()); 
    }
//		,
//    submitHandler: function (form) {
//        console.log('form ok');
//    }
});

$("#registroformgrupo").validate({
    
	errorClass: 'invalid',
    validClass: "valid",
	rules: {
		descripcion_grupo:{
	    	required:true,
	    	minlength:2
	    	
	    }
	    
    }
,errorClass: 'invalid',
validClass: "valid",

messages: {
	descripcion_grupo:{
    	required:"Descripcion es obligatorio",
    	minlength:"La descripcion deve contener al menos 2 caracteres"
    	
    }
    
}

});

	
	});
});
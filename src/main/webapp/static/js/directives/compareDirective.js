/**
 * 
 */

angular.module("menu").directive("compareTo", function() {
    return {
        require: "ngModel",
        scope: {
          otherModelValue: "=compareTo"
        },
        link: function(scope, element, attributes, ngModel) {

        	console.log("Ingrese en validacion"+ngModel.$viewValue);
        	
        	
        	
        	
          ngModel.$validators.compareTo = function(modelValue) {
        	  
        	  if(modelValue == scope.otherModelValue){
        		
        	  }else{
        		  
        		  console.log("Ingrese"); 		  
//        		  $("label[for='pass']").attr("value","OTRO TEXTO");
        		  
            	  $("#pass").addClass("invalid");
            	    $("#pass").prop("aria-invalid", "true"); 
        		  
        	  }
        	  
        	  
        	  
        	  
        	  
            return modelValue == scope.otherModelValue;
          };

          scope.$watch("otherModelValue", function() {
            ngModel.$validate();
          });
        }
      };
    });
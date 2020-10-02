
(function ($) {
    "use strict";

    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(e){
      e.preventDefault();
      var check = validate_form();

      if (check === true) {
        $.ajax({
            type: "POST",
            url: '/api/v1/contacts',
            data: $(this).serialize(),
            success: function (data) {
              $('.success').html('Contact Saved Successfully!');
              $('#simple_form').trigger("reset");
            },
            error: function (textStatus, errorThrown) {
              $('.error').html(errorThrown);
            }
        })
//        .done(function( data ) {
//          debugger;
//          $('.success').html('Contact Saved Successfully!');
//          $('#simple_form').trigger("reset");
//          return false;
//        }).error(function(data){
//          debugger;
//        });
        
        return false;
      }else {
        return false;
      }
      
    });

    function validate_form() {
      var check = true;

      for(var i=0; i<input.length; i++) {
          if(validate(input[i]) == false){
              showValidate(input[i]);
              check=false;
          }
      }

      return check;      
    }

    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    

})(jQuery);

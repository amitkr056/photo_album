//   original concept: http://www.zurb.com/playground/inline-form-labels
//   <label for="field1" class="inlined">Inline Label Field</label>
//   <input type="text" class="input-text" id="field1" />


$(document).ready(function(){


// Not working: 
// TODO
//         Event.observe(window, 'load', function () {
//             setTimeout(function(){
//                 if (!input.value.empty()) {
//                     input.previous().addClassName('has-text');
//                 }
//             }, 200);
//         });


    $("label.inlined + .input-text").each(function (type) {
        $(this).focus(function () {
            $(this).prev("label.inlined").addClass("focus");
        });
        $(this).keypress(function () {
            $(this).prev("label.inlined").addClass("has-text").removeClass("focus");
        });
        $(this).blur(function () {
            if($(this).val() == "") {
                $(this).prev("label.inlined").removeClass("has-text").removeClass("focus");
            }
        });
    });

    // adds focus to the create and cancel buttons while creating new single location
    $(".fncyBtn").each(function(){
        var inlineLabel = $(this).find("span");
        var inlineInput = $(this)

        inlineInput.focus(function () {
            inlineLabel.addClass("focus");
        });
        inlineInput.keypress(function () {
            inlineLabel.addClass("has-text").removeClass("focus");
        });
        inlineInput.blur(function () {
            if($(this).val() == "") {
                inlineLabel.removeClass("has-text").removeClass("focus");
            }
        });

    });

    
// using existing markup structure
    $(".inlineLabel").each(function (type) {
        
        var inlineLabel = $(this).find("label");
        var inlineInput = $(this).find("input");
        
        if ( inlineInput.val() != '' ) {
          inlineLabel.addClass('has-text');
        }
        
        // has any children that are a span.required
        if ($(this).children("span").hasClass("required")) {
            $(this).addClass("reqBox");
        };
        
        inlineInput.focus(function () {
            $(this).parent('div').addClass("focusBox");
            inlineLabel.addClass("focus");
        });
        inlineInput.keypress(function () {
            inlineLabel.addClass("has-text").removeClass("focus");
            $(this).parent('div').addClass("focusBoxText").removeClass("focusBox");
        });
        inlineInput.blur(function () {
            if($(this).val() == "") {
                inlineLabel.removeClass("has-text").removeClass("focus");
                $(this).parent('div').removeClass("focusBoxText").removeClass("focusBox");
                inlineLabel.removeClass("has-text").removeClass("focus");
            }
        });
    });
});




$(document).ready(function(){
$("#lookup_query").focus(function () {
  if( $(this).val() == 'Search...' ) {
    $(this).val('');
  } else {
    $(this).select();
  }
});

$("#lookup_query").blur(function () {
  if( $(this).val() == '') {
    $(this).val('Search...');
  }
});

});


/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {

    // if user clicked on button, the overlay layer or the dialogbox, close the dialog
    //$('a.btn-ok, a.#cancel_button, .close').click(function () {
    //    $('#dialog-overlay, #dialog-box').hide();
    //    return false;
    //});
    // if user resize the window, call the same function again
    // to make sure the overlay fills the screen and dialogbox aligned to center
    $(window).resize(function () {
        //only do it if the dialog box is not hidden
        if (!$('#dialog-box').is(':hidden')) show_dialog_box();
    });
    
    $('#cancel_edit').click(function() {
        $('#template_name').val('edit_canceled');
        $('#edit_template').submit();
        return false;
    });

    window.setTimeout(function(){
        $('#textareaEg_tbl').css('width', '630px');
        $('#textareaEg_tbl').css('height', '300px');
        $('#textareaEg_ifr').css('height', '300px');
    },1000);

    $('#ok_button').click(function(){
        $('#dialog-overlay, #dialog-box').hide();
        $('#edit_template').submit();
    });


});

function close_modal_dialog_box() {
    $('#dialog-overlay, #dialog-box').hide();
        return false;
}

//Popup dialog
function show_dialog_box() {

    // get the screen height and width
    var maskHeight = $(document).height();
    var maskWidth = $(window).width();

    // calculate the values for center alignment
    var dialogTop =  (maskHeight/2) - ($('#dialog-box').height());
    var dialogLeft = (maskWidth/2) - ($('#dialog-box').width()/2);

    // assign values to the overlay and dialog box
    $('#dialog-overlay').css({
        height:maskHeight,
        width:maskWidth
    }).show();
    $('#dialog-box').css({
        top:dialogTop + 100,
        left:dialogLeft
    }).show();
    $(window).scrollLeft(0);
}
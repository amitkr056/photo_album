
$.colorbox({
  height:        '420px',
  width:         '420px',
  inner_width:   '380px',
  opacity:       0.4,
  transition:    'elastic',
  speed:         500,
  inline:        true,
  photo:         false,
  iframe:        false,
  escKey:        false,
  overlayClose:  false,        
  href:          '#creation_modal',
  title:         '<h2>Create New Photo Album</h2>',
  onLoad:        function() {
    $('#cboxClose').unbind();
    $('#cboxClose').click(function() {
      $.colorbox.close();
    });
  },
  onCleanup:     function() {}
});

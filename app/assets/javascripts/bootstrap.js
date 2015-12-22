jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();

  $('.datepicker').datepicker({
      format: 'dd.mm.yyyy',
      clearBtn: true,
      language: 'ru',
      autoclose: true
  });
});

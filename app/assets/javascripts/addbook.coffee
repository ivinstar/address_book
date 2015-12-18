class @Addbook
  constructor: ->
    for func of @initializers
      do @initializers[func]

  @helpers:
    startDatetimepicker: ($input) ->
      options =
        format: gon.I18n[$input.data('type')].formats.js

      $input.datetimepicker(options);


  initializers:
    dateTimePicker: =>
      helpers = @helpers

      $('.datepicker-input:not([ng-datetimepicker])').each ->
        $input = $(this)

        helpers.startDatetimepicker $input


$ => @addbookInstance = new @Addbook()
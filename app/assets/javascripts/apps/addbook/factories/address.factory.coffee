addbookApp.factory 'Address', ($resource) ->
  return () ->

    fetch: ->
      $resource('/api/addresses/').query()
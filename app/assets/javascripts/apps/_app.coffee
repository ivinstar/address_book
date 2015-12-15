@addbookApp = angular.module 'addbookApp',
  [
    'ngResource'
    'ngRoute'
  ]

addbookApp.config [
  '$compileProvider'
  ($compileProvider) ->
    $compileProvider.aHrefSanitizationWhitelist /^\s*(https?|ftp|mailto|sip|chrome-extension):/
  # Angular before v1.2 uses $compileProvider.urlSanitizationWhitelist(...)
]

addbookApp.config [
  '$httpProvider'
  ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
    $httpProvider.defaults.headers.common.Accept = 'application/json'
]

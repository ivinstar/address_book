addbookApp.controller 'langCtrl', ($scope, $attrs) ->
  $scope.lang =
    selected: 'ru'
    languages: {'ru','en'}


  $scope.ngChangeLang = () ->
    console.log('czxczxc')
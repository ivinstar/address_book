addbookApp.controller 'addressesCtrl', ($scope, $filter, $attrs, Address) ->
  obj = new Address

  $scope.addresses = obj.fetch()
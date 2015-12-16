addbookApp.controller 'addressesCtrl', ($scope, $attrs, Address) ->
  params = {}
  params.q = {}

  $scope.collection = () ->
    $scope.addresses = Address.query(params)


  $scope.search = () ->
    params.q.city_cont = $scope.city_cont
    params.q.house_eq = $scope.house_eq
    params.q.street_like = $scope.street_like
    params.q.zipcode_cont = $scope.zipcode_cont
    params.q.country_cont = $scope.country_cont
    this.collection()


  $scope.sort = () ->
    params.q.s = 'city asc'
    this.collection()


  $scope.clean = (field) ->
    params.q[field] = null
    $scope[field] = null
    this.collection()
addbookApp.controller 'addressesCtrl', ($scope, $attrs, Address) ->
  $scope.search = {}
  $scope.params = {}
  $scope.params.q = {}

  $scope.collection = () ->
    $scope.addresses = Address.query($scope.params)


  $scope.doSearch = () ->
    $scope.params.q.city_cont = $scope.search.city_cont
    $scope.params.q.house_eq = $scope.search.house_eq
    $scope.params.q.street_like = $scope.search.street_like
    $scope.params.q.zipcode_cont = $scope.search.zipcode_cont
    $scope.params.q.country_cont = $scope.search.country_cont
    this.collection()


  $scope.doSort = () ->
    console.log($scope.city_sort)
    #params.q.s = 'city asc'
    #this.collection()


  $scope.doReset = (field) ->
    $scope.params.q[field] = null
    $scope['search'][field] = null
    this.collection()


  $scope.doEnter = (event) ->
    if event.keyCode == 13
      this.doSearch()
    else
      null

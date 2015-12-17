addbookApp.controller 'addressesCtrl', ($scope, $attrs, Address) ->
  $scope.search = {}
  $scope.sort = {}
  $scope.params = { q : {} }

  $scope.collection = () ->
    $scope.addresses = Address.query($scope.params)


  $scope.doSearch = () ->
    for i,j of $scope.search
      $scope.params.q[i] = j
    this.collection()


  $scope.doSort = (field) ->
    direction = switch $scope.sort.direction
      when undefined then 'asc'
      when 'asc' then 'desc'
      when 'desc' then 'asc'
    $scope.sort.direction = direction
    #$scope.sort['sort_field'] = field
    $scope.params.q.s = [field,direction].join(' ')
    this.collection()


  $scope.doReset = (field) ->
    $scope.params.q[field] = null
    $scope.search[field] = null
    this.collection()


  $scope.doEnter = (event) ->
    if event.keyCode == 13
      this.doSearch()
    else
      null

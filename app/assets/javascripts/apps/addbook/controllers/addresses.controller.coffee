addbookApp.controller 'addressesCtrl', ($scope, $attrs, Address) ->
  $scope.search = {}
  $scope.sort = {}
  $scope.page = {current:1,active:false}
  $scope.params = { q : {} }

  $scope.collection = () ->
    $scope.addresses = Address.query $scope.params, success = () ->
      $scope.loading = false;


  $scope.doSearch = () ->
    $scope.loading = true;
    for i,j of $scope.search
      $scope.params.q[i] = j
    this.doPage(1)
    this.collection()


  $scope.doSort = (field) ->
    direction = if $scope.sort.direction == 'asc' then 'desc' else 'asc'
    $scope.sort.direction = direction
    $scope.params.q.s = [field,direction].join(' ')
    this.collection()


  $scope.doReset = (field) ->
    $scope.params.q[field] = null
    $scope.search[field] = null
    this.collection()

  $scope.doPage = (page) ->
    $scope.params.page = page
    $scope.page.current = parseInt(page)
    $scope.page.range = [$scope.page.current..$scope.page.current+3]
    $scope.page.active = !$scope.page.active
    this.collection()


  $scope.doEnter = (event) ->
    if event.keyCode == 13
      this.doSearch()
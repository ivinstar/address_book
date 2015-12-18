addbookApp.directive 'listPagination', ->
  pagination =
    replace: true
    template: $.tmpl('pagination').outerHTML()
    link: (scope, elements, attrs) ->
      scope.currentPage = 1
      scope.itemsPerPage = +attrs.itemsPerPage or 10

      scope.prevPage = ->
        if scope.currentPage > 0
          scope.currentPage--

      scope.prevPageDisabled = ->
        if scope.currentPage == 1 then 'disabled' else ''

      scope.pageCount = ->
        paginated_entities = scope['filtered_' + attrs.paginatedEntities] or scope['filtered_entities']
        Math.ceil(paginated_entities.length / scope.itemsPerPage) - 1

      scope.nextPage = ->
        if scope.currentPage <= scope.pageCount()
          scope.currentPage++

      scope.nextPageDisabled = ->
        if scope.currentPage == scope.pageCount() + 1 then 'disabled' else ''

      scope.setPage = (page) ->
        scope.currentPage = page

      scope.range = ->
        range = []
        i = 0
        while i <= scope.pageCount()
          range.push i + 1
          i++
        range

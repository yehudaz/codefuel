@IndexCtrl = ($scope, $http) ->
  $scope.lastServerRequestParams = {filters:{date_range: {start_date:"2014-02-10",end_date:"2014-02-16"}}}
  $http(
    method: 'POST'
    url: 'http://localhost:3001/revenue/revenue_per_products.json'
    params: $scope.lastServerRequestParams
  ).success((data, status) ->
    $scope.title = status + ' ' + data.result
    $scope.data = data
    return
  ).error (data, status) ->
    $scope.data = data or "Request failed"
    $scope.title = status
    return

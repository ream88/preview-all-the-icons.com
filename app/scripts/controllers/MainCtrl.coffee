@MainCtrl = ($scope, $http) ->
  $scope.wallpapers = []

  $http.get('json/ios7.json').success (response) ->
    $scope.wallpapers = response

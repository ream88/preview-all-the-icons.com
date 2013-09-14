describe 'MainCtrl', ->
  scope = $httpBackend = $controller = null

  beforeEach module 'previewAllTheIcons'
  beforeEach inject ($rootScope, $injector) ->
    scope = $rootScope.$new()
    $httpBackend = $injector.get('$httpBackend')
    $controller = $injector.get('$controller')


  it 'loads wallpapers', ->
    $httpBackend.expect('GET', 'json/ios7.json').respond('["image.png"]')
    MainCtrl = $controller('MainCtrl', $scope: scope)

    expect(scope.wallpapers.length).toBe 0
    $httpBackend.flush()
    expect(scope.wallpapers.length).not.toBe 0


  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

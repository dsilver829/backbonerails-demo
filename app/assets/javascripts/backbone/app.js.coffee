@Demo = do (Backbone, Marionette) ->
	
	App = new Marionette.Application

  App.rootRoute = "users"
	
	App.addRegions
		headerRegion: "#header-region"
		mainRegion: "#main-region"
		footerRegion: "#footer-region"

  App.reqres.addHandler "get:current:user", ->
    App.currentUser

  App.on "initialize:before", (options) ->
    @currentUser = App.request "set:current:user", options.currentUser
	
	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()
	
	App.on "initialize:after", (options) ->
		if Backbone.history
			Backbone.history.start()
      @navigate(rootRoute) if @getCurrentRoute() is ""

  App.navigate = (route) ->
    Backbone.history.navigate route

  App.getCurrentRoute = ->
    Backbone.history.fragment
	
	App
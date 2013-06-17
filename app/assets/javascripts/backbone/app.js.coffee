@Demo = do (Backbone, Marionette) ->
	
	App = new Marionette.Application
	
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
	
	App
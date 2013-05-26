@Demo.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
#  @startWithParent = false

  API =
    showFooter: ->
      FooterApp.Show.Controller.showFooter()

#  App.addInitializer ->
#    API.showFooter()

#  FooterApp.on "start", ->
#    API.showFooter()

  App.commands.addHandler "footer:show", ->
    API.showFooter()

class AdminInitializer
  constructor: ->
    @init_something()

  init_something: ->
    # do something


$(document).on 'ready', ->
  new AdminInitializer()

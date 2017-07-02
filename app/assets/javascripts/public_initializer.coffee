class PublicInitializer
  constructor: ->
    @init_map()

  init_map: ->
    $('#show-map .button').on 'click', ->
      $('.problems').toggleClass 'hide'
      $('.show-map').toggleClass 'hide'
      $('.hide-map').toggleClass 'hide'
      resizeMap()
      return


$(document).on 'ready', ->
  new PublicInitializer()

noflo = require 'noflo'

class Player extends noflo.Component
  constructor: ->
    @inPorts =
      track: new noflo.Port 'object'
    @outPorts =
      element: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.track.on 'data', (track) =>
      playBtn = document.createElement 'button'
      text = document.createTextNode 'Play ' + track.name
      playBtn.appendChild text
      playBtn.addEventListener 'click', ->
        audio = new Audio track.preview_url
        audio.play()
      @outPorts.element.send playBtn

exports.getComponent = -> new Player

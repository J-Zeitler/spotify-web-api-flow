noflo = require 'noflo'

class AlbumTracks extends noflo.AsyncComponent
  constructor: ->
    @inPorts =
      album: new noflo.Port 'object'
      # limit: new noflo.Port 'number'
      # offset: new noflo.Port 'number'
    @outPorts =
      out: new noflo.Port 'object'
      error: new noflo.Port 'object'
    @albumTracks = {}

    super 'album'

  doAsync: (album, callback) ->
    url = album.tracks.href

    req = new XMLHttpRequest
    req.onreadystatechange = =>
      if req.readyState is 4
        if req.status is 200
          @albumTracks = JSON.parse(req.responseText)
          @outPorts.out.beginGroup album
          @outPorts.out.send(@albumTracks)
          @outPorts.out.endGroup()
          callback()
        else
          callback new Error "Error loading album tracks from #{album}"
    req.open 'GET', url, true
    req.send null

exports.getComponent = -> new AlbumTracks

noflo = require 'noflo'
http = require 'client-http'

class TrackSearch extends noflo.Component
  constructor: ->
    @inPorts =
      track: new noflo.Port 'string'
    @outPorts =
      out: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.track.on 'data', (track) =>
      url = "https://api.spotify.com/v1/search?q=" + track + "&type=track"
      http.get url, (res, err) =>
        if !!res
          @outPorts.out.send(JSON.parse(res).tracks.items[0])
        else
          @outPorts.error.send(JSON.parse(err))

exports.getComponent = -> new TrackSearch

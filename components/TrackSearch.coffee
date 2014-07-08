noflo = require 'noflo'
http = require 'client-http'
q = require 'querystring'

class TrackSearch extends noflo.Component
  constructor: ->
    @inPorts =
      track: new noflo.Port 'string'
    @outPorts =
      out: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.track.on 'data', (track) =>
      url = "https://api.spotify.com/v1/search?q=" + q.escape(track) + "&type=track"
      http.get url, (res) =>
        @outPorts.out.send(JSON.parse(res).tracks.items[0])

exports.getComponent = -> new TrackSearch

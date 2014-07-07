noflo = require 'noflo'
http = require 'client-http'

class ArtistLoader extends noflo.Component
  constructor: ->
    @inPorts =
      artist: new noflo.Port 'string'
    @outPorts =
      out: new noflo.Port 'artist'
      error: new noflo.Port 'object'

    @inPorts.artist.on 'data', (data) =>
      if typeof data is 'string'
        url = "https://api.spotify.com/v1/artists/" + data
        http.get url, (res) =>
          @outPorts.out.send res
      else if typeof data is 'object'
        url = "https://api.spotify.com/v1/artists/" + data.id
        http.get url, (res) =>
          @outPorts.out.send res

exports.getComponent = -> new ArtistLoader

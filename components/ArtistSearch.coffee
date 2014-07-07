noflo = require 'noflo'
http = require 'client-http'

class ArtistSearch extends noflo.Component
  constructor: ->
    @inPorts =
      artist: new noflo.Port 'string'
    @outPorts =
      out: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.artist.on 'data', (artist) =>
      url = "https://api.spotify.com/v1/search?q=" + artist + "&type=artist"
      http.get url, (res, err) =>
        if !!res
          @outPorts.out.send(JSON.parse(res).artists.items[0])
        else
          @outPorts.out.send(JSON.parse(err))

exports.getComponent = -> new ArtistSearch

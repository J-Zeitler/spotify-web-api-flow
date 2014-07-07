noflo = require 'noflo'
http = require 'client-http'

class AlbumLoader extends noflo.Component
  constructor: ->
    @inPorts =
      album_id: new noflo.Port 'string'
    @outPorts =
      out: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.album_id.on 'data', (id) =>
      url = "https://api.spotify.com/v1/albums/" + id
      http.get url, (res) =>
        @outPorts.out.send res

exports.getComponent = -> new AlbumLoader

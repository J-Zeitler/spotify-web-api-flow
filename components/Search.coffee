noflo = require 'noflo'
http = require 'client-http'

class Search extends noflo.Component
  constructor: ->
    @artist = false
    @album = false
    @track = false

    @inPorts =
      search_term: new noflo.Port 'string'
      artist: new noflo.Port 'boolean'
      album: new noflo.Port 'boolean'
      track: new noflo.Port 'boolean'

    @outPorts =
      out: new noflo.Port 'object'
      error: new noflo.Port 'object'

    @inPorts.artist.on 'data', (artist) =>
      @artist = artist
    @inPorts.album.on 'data', (album) =>
      @album = album
    @inPorts.track.on 'data', (track) =>
      @track = track

    @inPorts.search_term.on 'data', (search_term) =>
      url = "https://api.spotify.com/v1/search?q=" + search_term
      if @artist then url += "&type=artist"
      if @album then url += "&type=album"
      if @track then url += "&type=track"

      http.request url, (res, err) =>
        if !!res
          @outPorts.out.send res
        else
          @outPorts.out.send err

exports.getComponent = -> new Search

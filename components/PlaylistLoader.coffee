noflo = require 'noflo'
http = require 'client-http'

exports.getComponent = ->
  playlistLoader = new noflo.Component
    inPorts:
      user_id: datatype: 'string'
      playlist_id: datatype: 'string'
      access_token: datatype: 'string'
    outPorts:
      out: datatype: 'object'
      error: datatype: 'object'

  noflo.helpers.GroupedInput playlistLoader,
    in: ['user_id', 'playlist_id', 'access_token']
    out: 'out'
  , (data, groups, out) ->
    url = "https://api.spotify.com/v1/users/" + data.user_id
    url += "/playlists/" + data.playlist_id
    auth = 'Bearer ' + data.access_token

    http.request url, (res, err) =>
      if !!res
        out.send res
      else
        out.send err
    , null, {'Authorization': auth}

  return playlistLoader

spotify-web-api-flow
====================

This is a small app to visually explore and program requests to the [Spotify Web API](https://developer.spotify.com/web-api/).

##Running these components
To setup a local runtime and hook into the flowhub client you must have a flowhub account (http://app.flowhub.io/).

1. install node modules `$ npm install`
2. register the runtime `$ node node_modules/.bin/noflo-nodejs-init --user <FLOWHUB USER ID> --host localhost --port 3569 --label "Local NoFlo Test"`
3. run with watchers `$ grunt`

##Screenshots
![Track search flow](./tracksearch-flow.png?raw=true)
![Spotify modules in NoFlo](./screenshot.png?raw=true)
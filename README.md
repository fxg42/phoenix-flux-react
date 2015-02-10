# Fun with Phoenix Channels, Flux and React

An experiment built to play with various concepts including:

- [the Phoenix Framework](http://www.phoenixframework.org/)
- [Phoenix Channels](http://www.phoenixframework.org/v0.8.0/docs/channels) and [GenEvent handlers](http://elixir-lang.org/docs/master/elixir/GenEvent.html)
- [React](http://facebook.github.io/react/index.html) and [Flux](http://facebook.github.io/flux/)
- [6to5](https://6to5.org/)
- [Immutable](http://facebook.github.io/immutable-js/)
- [Browserify](http://browserify.org/)

## Running

To start the Phoenix application:

1. Install dependencies with `mix deps.get`
2. Start Phoenix endpoint with `mix phoenix.server`

To start the client:

1. `cd web/js`
2. Install dependencies with `npm install`
3. Compile and watch the client code with `npm start`

Now you can visit `localhost:4000` from your browser.

... or watch it [here](https://vimeo.com/119231105).

## Releasing

First, build the minified version of the client:

1. `cd web/js/`
2. Build the bundle with `npm run build`

Then create the release and start the application:

1. `export MIX_ENV=prod`
2. `mix release`
3. `rel/ex_react_ws/bin/ex_react_ws start`

Now you can visit `localhost:4000` from your browser.

common = require './common'
p = require('gulp-load-plugins')()

module.exports = (gulp, c) ->
  config = common.GetConfig c

  return ->
    p.env.set NODE_ENV: "test"
    gulp.src [config.unittestEntry, "#{config.buildRoot}/**/*unit-tests.js"], {read: false}
    .pipe p.mocha
      reporter: 'spec'
      ui: 'bdd'
      recursive: true
    .once 'error', (err) ->
      console.log err
      common.HandleError()
    .once 'end', ->
      if process.env.NODE_ENV isnt 'development' then process.exit()

common = require './common'
p = require('gulp-load-plugins')()

module.exports = (gulp, c) ->
  config = common.GetConfig c

  return ->
    p.env.set NODE_ENV: "test"
    gulp.src [config.systemtestEntry, "#{config.buildRoot}/**/*system-tests.js"], {read: false}
    .pipe p.spawnMocha
      reporter: 'spec'
      ui: 'bdd'
      recursive: true
    .once 'error', (err) ->
      console.log err
      common.HandleError()

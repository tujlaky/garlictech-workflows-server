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
    .on 'error', common.HandleError
    .once 'end', -> process.exit(0)

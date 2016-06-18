common = require './common'
p = require('gulp-load-plugins')()

module.exports = (gulp, c) ->
  config = common.GetConfig c

  return ->
    gulp.src [config.unittestEntry, "#{config.buildRoot}/**/*unit-tests.js"], {read: false}
    .pipe p.mocha
      reporter: 'spec'
      ui: 'bdd'
      recursive: true
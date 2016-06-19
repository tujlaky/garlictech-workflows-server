common = require './common'
p = require('gulp-load-plugins')()

# handle src coffeescript files: static compilation
module.exports = (gulp, c) ->
  config = common.GetConfig c
  files = ["#{config.srcRoot}/**/*.html"]

  return ->
    common.GulpSrc gulp, files, 'html', {base: config.base}
    .pipe gulp.dest config.buildRoot

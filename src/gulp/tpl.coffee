common = require './common'
p = require('gulp-load-plugins')()

# handle src coffeescript files: static compilation
module.exports = (gulp, c) ->
  config = common.GetConfig c
  files = ["#{config.srcRoot}/**/*.tpl"]

  return ->
    common.GulpSrc gulp, files, 'tpl', {base: config.base}
    .pipe gulp.dest config.buildRoot

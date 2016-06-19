module.exports = (_gulp, config) ->
  gulp = require('gulp-help') _gulp

  fileTypes = ['js', 'json', 'html', 'tpl', 'coffee']

  for name in fileTypes
    gulp.task name, require("./#{name}")(gulp, config)

  gulp.task 'compile', fileTypes

  gulp.task 'watch', require('./watch')(gulp, config, fileTypes)
  
  gulp.task 'unittest', require('./unittest')(gulp, config)

  gulp.task 'systemtest', require('./systemtest')(gulp, config)
  
  gulp.task 'build', ['compile'], -> gulp.start 'unittest'
  
  gulp.task 'webserver', require('./webserver')(gulp, config)
  
  gulp.task 'default', ['build'], ->
    gulp.start 'watch'
    gulp.start 'webserver'

  require('./bump')(gulp, config)

  return gulp
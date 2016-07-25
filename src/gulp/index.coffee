module.exports = (_gulp, config) ->
  gulp = require('gulp-help') _gulp

  commonFileTypes = ['coffee']

  for name in commonFileTypes
    gulp.task name, require("garlictech-workflows-common/dist/gulp/#{name}")(gulp, config)


  serverFileTypes = ['js', 'json', 'html', 'tpl']

  for name in serverFileTypes
    gulp.task name, require("./#{name}")(gulp, config)


  fileTypes = _.union commonFileTypes, serverFileTypes

  gulp.task 'compile', fileTypes

  gulp.task 'watch', require('./watch')(gulp, config, fileTypes)
  
  gulp.task 'unittest', require('./unittest')(gulp, config)

  gulp.task 'systemtest', require('./systemtest')(gulp, config)
  
  gulp.task 'build', ['compile'], -> gulp.start 'unittest'
  
  gulp.task 'webserver', require('./webserver')(gulp, config)
  
  gulp.task 'default', ['build'], ->
    gulp.start 'watch'
    gulp.start 'webserver'

  require('garlictech-workflows-common/dist/gulp/bump')(gulp, config)

  return gulp

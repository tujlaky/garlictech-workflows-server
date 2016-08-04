var common;

common = require('./common');

module.exports = function(_gulp, config) {
  var commonFileTypes, fileTypes, gulp, i, j, len, len1, name, serverFileTypes;
  gulp = require('gulp-help')(_gulp);
  config = common.GetConfig(config);
  commonFileTypes = ['coffee'];
  for (i = 0, len = commonFileTypes.length; i < len; i++) {
    name = commonFileTypes[i];
    gulp.task(name, require("garlictech-workflows-common/dist/gulp/" + name)(gulp, config));
  }
  serverFileTypes = ['js', 'json', 'html', 'tpl'];
  for (j = 0, len1 = serverFileTypes.length; j < len1; j++) {
    name = serverFileTypes[j];
    gulp.task(name, require("./" + name)(gulp, config));
  }
  fileTypes = _.union(commonFileTypes, serverFileTypes);
  gulp.task('compile', fileTypes);
  gulp.task('watch', require('./watch')(gulp, config, fileTypes));
  gulp.task('unittest', require('./unittest')(gulp, config));
  gulp.task('systemtest', require('./systemtest')(gulp, config));
  gulp.task('build', ['compile'], function() {
    return gulp.start('unittest');
  });
  gulp.task('webserver', require('./webserver')(gulp, config));
  gulp.task('default', ['build'], function() {
    gulp.start('watch');
    return gulp.start('webserver');
  });
  require('garlictech-workflows-common/dist/gulp/bump')(gulp, config);
  return gulp;
};

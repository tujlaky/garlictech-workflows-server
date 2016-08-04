var common, watch;

watch = require('gulp-debounced-watch');

common = require('./common');

module.exports = function(gulp, c, fileTypes) {
  var config;
  config = common.GetConfig(c);
  return function() {
    return _.forEach(fileTypes, function(type) {
      var unittestTaskName;
      unittestTaskName = "unittest after compiling " + type;
      gulp.task(unittestTaskName, [type], function() {
        return gulp.start('unittest');
      });
      return watch([config.srcRoot + "/**/*." + type], {
        debounceTimeout: 1000
      }, function() {
        return gulp.start(unittestTaskName);
      });
    });
  };
};

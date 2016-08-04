var common, p;

common = require('./common');

p = require('gulp-load-plugins')();

module.exports = function(gulp, c) {
  var config, files;
  config = common.GetConfig(c);
  files = [config.srcRoot + "/**/*.js"];
  return function() {
    return common.GulpSrc(gulp, files, 'js', {
      base: config.base
    }).pipe(gulp.dest(config.buildRoot));
  };
};

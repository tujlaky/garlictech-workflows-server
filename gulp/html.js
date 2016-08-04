var common, p;

common = require('./common');

p = require('gulp-load-plugins')();

module.exports = function(gulp, c) {
  var config, files;
  config = common.GetConfig(c);
  files = [config.srcRoot + "/**/*.html"];
  return function() {
    return common.GulpSrc(gulp, files, 'html', {
      base: config.base
    }).pipe(gulp.dest(config.buildRoot));
  };
};

var common, p;

common = require('./common');

p = require('gulp-load-plugins')();

module.exports = function(gulp, c) {
  var config, files;
  config = common.GetConfig(c);
  files = [config.srcRoot + "/**/*.tpl"];
  return function() {
    return common.GulpSrc(gulp, files, 'tpl', {
      base: config.base
    }).pipe(gulp.dest(config.buildRoot));
  };
};

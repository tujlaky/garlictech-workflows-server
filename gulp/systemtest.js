var common, p;

common = require('./common');

p = require('gulp-load-plugins')();

module.exports = function(gulp, c) {
  var config;
  config = common.GetConfig(c);
  return function() {
    p.env.set({
      NODE_ENV: "test"
    });
    return gulp.src([config.systemtestEntry, config.buildRoot + "/**/*system-tests.js"], {
      read: false
    }).pipe(p.mocha({
      reporter: 'spec',
      ui: 'bdd',
      recursive: true
    })).once('error', common.HandleError).once('end', function() {
      return process.exit();
    });
  };
};

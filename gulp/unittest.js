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
    return gulp.src([config.unittestEntry, config.buildRoot + "/**/*unit-tests.js"], {
      read: false
    }).pipe(p.mocha({
      reporter: 'spec',
      ui: 'bdd',
      recursive: true
    })).once('error', function(err) {
      console.log(err);
      return common.HandleError();
    }).once('end', function() {
      if (process.env.NODE_ENV !== 'development') {
        return process.exit();
      }
    });
  };
};

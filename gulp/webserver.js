var common, p;

common = require('./common');

p = require('gulp-load-plugins')();

module.exports = function(gulp, c) {
  var config;
  config = common.GetConfig(c);
  return function() {
    return p.nodemon({
      env: {
        NODE_ENV: 'development'
      },
      script: "" + config.serverEntry
    });
  };
};

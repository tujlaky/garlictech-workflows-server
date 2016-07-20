common = require './common'
p = require('gulp-load-plugins')()

module.exports = (gulp, c) ->
  config = common.GetConfig c

  return ->
    p.env.set NODE_ENV: "development"
    p.nodemon
      script: "#{config.serverEntry}"

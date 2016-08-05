gulp = require 'gulp'

config =
  root: __dirname

gulp = require("./src/gulp")(gulp, config)

gulp.task 'default', ['build'], ->
  gulp.start 'watch'

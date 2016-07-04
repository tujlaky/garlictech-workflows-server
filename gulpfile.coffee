gulp = require 'gulp'

config =
  base: __dirname

gulp = require("./src/gulp")(gulp, config)

gulp.task 'default', ['build'], ->
  gulp.start 'watch'

gutil = require 'gutil'
_ = require 'lodash'
argv = require('yargs').argv
watch = require 'gulp-debounced-watch'

# -----------------------------------------------------------------------------
# Create representation of file/directory structure
serverRoot =  "server"
coffeeFiles = ["#{serverRoot}/**/*.coffee"]
jsFiles = ["#{serverRoot}/**/*.js", "#{serverRoot}/**/*.json"]
tplFiles = "#{serverRoot}/modules/auth/passwordless/template/*.tpl"
htmlFiles = "#{serverRoot}/modules/auth/**/success.html"
buildRoot =  "dist"




# -----------------------------------------------------------------------------
gulp.task 'js', ->
  GulpSrc jsFiles, 'js', {base: './'}
  .pipe gulp.dest buildRoot

gulp.task 'tpl', ->
  GulpSrc tplFiles, 'tpl', {base: './'}
  .pipe gulp.dest buildRoot

gulp.task 'html', ->
  GulpSrc htmlFiles, 'html', {base: './'}
  .pipe gulp.dest buildRoot

# -----------------------------------------------------------------------------
gulp.task 'watch', ['setup'], ->
  watch coffeeFiles, {debounceTimeout: 1000}, ->
    gulp.start ['coffee', 'unittest']
  watch jsFiles, {debounceTimeout: 1000}, ->
    gulp.start ['js', 'unittest']
  watch tplFiles, {debounceTimeout: 1000}, ->
    gulp.start ['tpl', 'unittest']
  watch htmlFiles, {debounceTimeout: 1000}, ->
    gulp.start ['html', 'unittest']

# -----------------------------------------------------------------------------
gulp.task 'setup', ['js', 'tpl', 'html', 'coffee']

# -----------------------------------------------------------------------------
gulp.task 'unittest', ['setup'], ->
  gulp.src ["#{serverRoot}/test/unittest/index.coffee", "#{serverRoot}/**/*unit-tests.coffee"], {read: false}
    .pipe p.coffee({bare: true}).on('error', gutil.log)
    .pipe p.mocha
      reporter: 'spec'
      ui: 'bdd'
      recursive: true

# -----------------------------------------------------------------------------
gulp.task 'systemtest', ['setup'], ->
  p.env.set NODE_ENV: "test"
  gulp.src ["#{serverRoot}/test/systemtest/index.coffee", "#{serverRoot}/**/*system-tests.coffee", "#{serverRoot}/**/*system-tests.js"], {read: false}
    .pipe p.coffee({bare: true}).on('error', gutil.log)
    .pipe p.mocha
      reporter: 'spec'
      ui: 'bdd'
      recursive: true
    .on 'error', handleError
    .once 'end', -> process.exit()

# -----------------------------------------------------------------------------
# Start the web server
gulp.task 'webserver', ->
  p.nodemon
    script: "#{buildRoot}/server/server.js"

# -----------------------------------------------------------------------------
gulp.task 'default', ['setup', 'watch', 'webserver']

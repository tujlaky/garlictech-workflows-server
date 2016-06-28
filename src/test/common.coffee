chai = require 'chai'
GLOBAL.sinon = require 'sinon'
GLOBAL.should = chai.should()
GLOBAL.expect = chai.expect

GLOBAL.test =
  getMockClock: (dateString) ->
    if dateString then sinon.useFakeTimers(new Date(dateString).getTime()) else sinon.useFakeTimers()

module.exports = (config) ->
  require('@garlictech/common-server/dist/globals') config

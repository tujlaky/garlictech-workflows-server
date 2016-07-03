path = require 'path'

commonConfig = require "@garlictech/workflows-common/dist/gulp/common"

config = _.pick commonConfig, ['GulpSrc', 'HandleError']

config.GetConfig = (c) ->
  cfg = commonConfig.GetConfig c
  cfg.serverEntry = path.join cfg.buildRoot, 'server.js'
  return cfg

module.exports = config

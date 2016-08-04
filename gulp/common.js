var commonConfig, config, path;

path = require('path');

commonConfig = require("garlictech-workflows-common/dist/gulp/common");

config = _.pick(commonConfig, ['GulpSrc', 'HandleError']);

config.GetConfig = function(c) {
  var cfg;
  cfg = commonConfig.GetConfig(c);
  cfg.serverEntry = path.join(cfg.buildRoot, 'server.js');
  return cfg;
};

module.exports = config;

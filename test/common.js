var chai;

chai = require('chai');

GLOBAL.sinon = require('sinon');

GLOBAL.should = chai.should();

GLOBAL.expect = chai.expect;

GLOBAL.test = {
  getMockClock: function(dateString) {
    if (dateString) {
      return sinon.useFakeTimers(new Date(dateString).getTime());
    } else {
      return sinon.useFakeTimers();
    }
  }
};

module.exports = function(config) {
  return require('garlictech-common-server/dist/globals')(config);
};

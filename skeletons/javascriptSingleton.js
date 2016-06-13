;'use strict';
(function() {
  ClassName = (function() {
    var _mInstance = null;

    var _init = function() {
      return {
      };
    };

    return {
      getInstance: function() {
        return _mInstance || _init();
      },
      releaseInstance: function() {
        _mInstance = null;
      }
    }
  })();
})();

'use strict';
;(function() {
  ClassName = function() {
    if(this.constructor == ClassName) {
      throw new Error('Cannot instantiate abstract class!');
    }
  };

  ClassName.prototype = {
    throwAbstractFunctionError: function(functionName) {
      throw new Error('Abstract function not implemented, ' + functionName);
    },
    create: function(implClass) {
      var tmpArguments = Array.prototype.slice.call(arguments, 1);
      return new (Function.prototype.bind.apply(implClass, tmpArguments));
    },
    exampleFunction: function() {
      this.throwAbstractFunctionError('exampleFunction');
    }
  };
})();

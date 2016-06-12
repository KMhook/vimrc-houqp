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
    exampleFunction: function() {
      this.throwAbstractFunctionError('exampleFunction');
    }
  };
})();

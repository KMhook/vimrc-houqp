;'use strict';
(function() {
  ChildClass = function() {
    ParentClass.call(this);
  };

  ChildClass.prototype = Object.create(ParentClass, {
    constructor: ChildClass
  });
})();

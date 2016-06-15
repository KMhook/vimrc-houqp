;'use strict';
(function() {
  ChildClass = function() {
    ParentClass.call(this);
  };

  ChildClass.prototype = Object.assign(new ParentClass(), {
    constructor: ChildClass
  });
})();

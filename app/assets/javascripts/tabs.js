;(function(window) {
  'use strict';

  function extend(a,b){
      for( var key in b) {
        if (b.hasOwnProperty(key)) {
          a[key] = b[key];
        }
      }

      return a;
  }

  function ResultTabs(el, options) {
    this.el = el;
    this.options = extend({}, this.options);

    extend(this.options, options);
    this._init();
  }

  tabs.prototype.options = {
    start: 0
  };

  ResultTabs.prototype._init() = function() {
    this.tabs = [].slice.call( this.el.querySelectorAll('nav > ul > li'));
    this.items = [].slice.call(this.el.querySelectorAll('.content > section'));// get content items
    this.current = -1;
    this._show(); //show the current contents
    this._initEvents();
  };

  ResultTabs.prototype._initEvents = function() {
    var self = this;
    this.tabs.forEach(function(tab, index)) {
      tab.addEventListener('click', function(ev) {
        ev.preventDefault();
        self.show(index);
      });
    });
  };

  ResultTabs.prototype._show = function(index) {
    if(this.current >= 0) {
      this.tabs[ this.current].className = '';
      this.items[this.current].className = '';
    }

    this.current = index != undefined ? index : this.options.start >= 0 && this.options.start < this.items.length ? this.option.start: 0;
    this.tabs[this.current].className = 'tab-current';
    this.items[this.current].className = 'content-current';
  };

  window.ResultTabs= ResultTabs;
}) (window);
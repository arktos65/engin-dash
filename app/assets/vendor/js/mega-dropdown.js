(function(e, a) { for(var i in a) e[i] = a[i]; }(window, /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./js/mega-dropdown.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./js/mega-dropdown.js":
/*!*****************************!*\
  !*** ./js/mega-dropdown.js ***!
  \*****************************/
/*! exports provided: MegaDropdown */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"MegaDropdown\", function() { return MegaDropdown; });\nfunction _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError(\"Cannot call a class as a function\"); } }\n\nfunction _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if (\"value\" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }\n\nfunction _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); Object.defineProperty(Constructor, \"prototype\", { writable: false }); return Constructor; }\n\nvar TIMEOUT = 150;\n\nvar MegaDropdown = /*#__PURE__*/function () {\n  function MegaDropdown(element) {\n    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};\n\n    _classCallCheck(this, MegaDropdown);\n\n    this._onHover = options.trigger === 'hover' || element.getAttribute('data-trigger') === 'hover';\n    this._container = MegaDropdown._findParent(element, 'mega-dropdown');\n    if (!this._container) return;\n    this._menu = this._container.querySelector('.dropdown-toggle ~ .dropdown-menu');\n    if (!this._menu) return;\n    element.setAttribute('aria-expanded', 'false');\n    this._el = element;\n\n    this._bindEvents();\n  }\n\n  _createClass(MegaDropdown, [{\n    key: \"open\",\n    value: function open() {\n      if (this._timeout) {\n        clearTimeout(this._timeout);\n        this._timeout = null;\n      }\n\n      if (this._focusTimeout) {\n        clearTimeout(this._focusTimeout);\n        this._focusTimeout = null;\n      }\n\n      if (this._el.getAttribute('aria-expanded') !== 'true') {\n        this._triggerEvent('show');\n\n        this._container.classList.add('show');\n\n        this._menu.classList.add('show');\n\n        this._el.setAttribute('aria-expanded', 'true');\n\n        this._el.focus();\n\n        this._triggerEvent('shown');\n      }\n    }\n  }, {\n    key: \"close\",\n    value: function close(force) {\n      var _this = this;\n\n      if (this._timeout) {\n        clearTimeout(this._timeout);\n        this._timeout = null;\n      }\n\n      if (this._focusTimeout) {\n        clearTimeout(this._focusTimeout);\n        this._focusTimeout = null;\n      }\n\n      if (this._onHover && !force) {\n        this._timeout = setTimeout(function () {\n          if (_this._timeout) {\n            clearTimeout(_this._timeout);\n            _this._timeout = null;\n          }\n\n          _this._close();\n        }, TIMEOUT);\n      } else {\n        this._close();\n      }\n    }\n  }, {\n    key: \"toggle\",\n    value: function toggle() {\n      // eslint-disable-next-line no-unused-expressions\n      this._el.getAttribute('aria-expanded') === 'true' ? this.close(true) : this.open();\n    }\n  }, {\n    key: \"destroy\",\n    value: function destroy() {\n      this._unbindEvents();\n\n      this._el = null;\n\n      if (this._timeout) {\n        clearTimeout(this._timeout);\n        this._timeout = null;\n      }\n\n      if (this._focusTimeout) {\n        clearTimeout(this._focusTimeout);\n        this._focusTimeout = null;\n      }\n    }\n  }, {\n    key: \"_close\",\n    value: function _close() {\n      if (this._el.getAttribute('aria-expanded') === 'true') {\n        this._triggerEvent('hide');\n\n        this._container.classList.remove('show');\n\n        this._menu.classList.remove('show');\n\n        this._el.setAttribute('aria-expanded', 'false');\n\n        this._triggerEvent('hidden');\n      }\n    }\n  }, {\n    key: \"_bindEvents\",\n    value: function _bindEvents() {\n      var _this2 = this;\n\n      this._elClickEvnt = function (e) {\n        e.preventDefault();\n\n        _this2.toggle();\n      };\n\n      this._el.addEventListener('click', this._elClickEvnt);\n\n      this._bodyClickEvnt = function (e) {\n        if (!_this2._container.contains(e.target) && _this2._container.classList.contains('show')) {\n          _this2.close(true);\n        }\n      };\n\n      document.body.addEventListener('click', this._bodyClickEvnt, true);\n\n      this._menuClickEvnt = function (e) {\n        if (e.target.classList.contains('mega-dropdown-link')) {\n          _this2.close(true);\n        }\n      };\n\n      this._menu.addEventListener('click', this._menuClickEvnt, true);\n\n      this._focusoutEvnt = function () {\n        if (_this2._focusTimeout) {\n          clearTimeout(_this2._focusTimeout);\n          _this2._focusTimeout = null;\n        }\n\n        if (_this2._el.getAttribute('aria-expanded') !== 'true') return;\n        _this2._focusTimeout = setTimeout(function () {\n          if (document.activeElement.tagName.toUpperCase() !== 'BODY' && MegaDropdown._findParent(document.activeElement, 'mega-dropdown') !== _this2._container) {\n            _this2.close(true);\n          }\n        }, 100);\n      };\n\n      this._container.addEventListener('focusout', this._focusoutEvnt, true);\n\n      if (this._onHover) {\n        this._enterEvnt = function () {\n          if (window.getComputedStyle(_this2._menu, null).getPropertyValue('position') === 'static') return;\n\n          _this2.open();\n        };\n\n        this._leaveEvnt = function () {\n          if (window.getComputedStyle(_this2._menu, null).getPropertyValue('position') === 'static') return;\n\n          _this2.close();\n        };\n\n        this._el.addEventListener('mouseenter', this._enterEvnt);\n\n        this._menu.addEventListener('mouseenter', this._enterEvnt);\n\n        this._el.addEventListener('mouseleave', this._leaveEvnt);\n\n        this._menu.addEventListener('mouseleave', this._leaveEvnt);\n      }\n    }\n  }, {\n    key: \"_unbindEvents\",\n    value: function _unbindEvents() {\n      if (this._elClickEvnt) {\n        this._el.removeEventListener('click', this._elClickEvnt);\n\n        this._elClickEvnt = null;\n      }\n\n      if (this._bodyClickEvnt) {\n        document.body.removeEventListener('click', this._bodyClickEvnt, true);\n        this._bodyClickEvnt = null;\n      }\n\n      if (this._menuClickEvnt) {\n        this._menu.removeEventListener('click', this._menuClickEvnt, true);\n\n        this._menuClickEvnt = null;\n      }\n\n      if (this._focusoutEvnt) {\n        this._container.removeEventListener('focusout', this._focusoutEvnt, true);\n\n        this._focusoutEvnt = null;\n      }\n\n      if (this._enterEvnt) {\n        this._el.removeEventListener('mouseenter', this._enterEvnt);\n\n        this._menu.removeEventListener('mouseenter', this._enterEvnt);\n\n        this._enterEvnt = null;\n      }\n\n      if (this._leaveEvnt) {\n        this._el.removeEventListener('mouseleave', this._leaveEvnt);\n\n        this._menu.removeEventListener('mouseleave', this._leaveEvnt);\n\n        this._leaveEvnt = null;\n      }\n    }\n  }, {\n    key: \"_triggerEvent\",\n    value: function _triggerEvent(event) {\n      if (document.createEvent) {\n        var customEvent;\n\n        if (typeof Event === 'function') {\n          customEvent = new Event(event);\n        } else {\n          customEvent = document.createEvent('Event');\n          customEvent.initEvent(event, false, true);\n        }\n\n        this._container.dispatchEvent(customEvent);\n      } else {\n        this._container.fireEvent(\"on\".concat(event), document.createEventObject());\n      }\n    }\n  }], [{\n    key: \"_findParent\",\n    value: function _findParent(el, cls) {\n      if (el.tagName.toUpperCase() === 'BODY') return null;\n      el = el.parentNode;\n\n      while (el.tagName.toUpperCase() !== 'BODY' && !el.classList.contains(cls)) {\n        el = el.parentNode;\n      }\n\n      return el.tagName.toUpperCase() !== 'BODY' ? el : null;\n    }\n  }]);\n\n  return MegaDropdown;\n}();\n\n//# sourceURL=[module]\n//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIndlYnBhY2s6Ly8vLi9qcy9tZWdhLWRyb3Bkb3duLmpzPzM5OTgiXSwibmFtZXMiOlsiVElNRU9VVCIsIk1lZ2FEcm9wZG93biIsImVsZW1lbnQiLCJvcHRpb25zIiwiX29uSG92ZXIiLCJ0cmlnZ2VyIiwiZ2V0QXR0cmlidXRlIiwiX2NvbnRhaW5lciIsIl9maW5kUGFyZW50IiwiX21lbnUiLCJxdWVyeVNlbGVjdG9yIiwic2V0QXR0cmlidXRlIiwiX2VsIiwiX2JpbmRFdmVudHMiLCJfdGltZW91dCIsImNsZWFyVGltZW91dCIsIl9mb2N1c1RpbWVvdXQiLCJfdHJpZ2dlckV2ZW50IiwiY2xhc3NMaXN0IiwiYWRkIiwiZm9jdXMiLCJmb3JjZSIsInNldFRpbWVvdXQiLCJfY2xvc2UiLCJjbG9zZSIsIm9wZW4iLCJfdW5iaW5kRXZlbnRzIiwicmVtb3ZlIiwiX2VsQ2xpY2tFdm50IiwiZSIsInByZXZlbnREZWZhdWx0IiwidG9nZ2xlIiwiYWRkRXZlbnRMaXN0ZW5lciIsIl9ib2R5Q2xpY2tFdm50IiwiY29udGFpbnMiLCJ0YXJnZXQiLCJkb2N1bWVudCIsImJvZHkiLCJfbWVudUNsaWNrRXZudCIsIl9mb2N1c291dEV2bnQiLCJhY3RpdmVFbGVtZW50IiwidGFnTmFtZSIsInRvVXBwZXJDYXNlIiwiX2VudGVyRXZudCIsIndpbmRvdyIsImdldENvbXB1dGVkU3R5bGUiLCJnZXRQcm9wZXJ0eVZhbHVlIiwiX2xlYXZlRXZudCIsInJlbW92ZUV2ZW50TGlzdGVuZXIiLCJldmVudCIsImNyZWF0ZUV2ZW50IiwiY3VzdG9tRXZlbnQiLCJFdmVudCIsImluaXRFdmVudCIsImRpc3BhdGNoRXZlbnQiLCJmaXJlRXZlbnQiLCJjcmVhdGVFdmVudE9iamVjdCIsImVsIiwiY2xzIiwicGFyZW50Tm9kZSJdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7QUFBQSxJQUFNQSxPQUFPLEdBQUcsR0FBaEI7O0lBRU1DLFk7RUFDSixzQkFBWUMsT0FBWixFQUFtQztJQUFBLElBQWRD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QUFtQkMsRUFBbkIsRUFBdUJDLEdBQXZCLEVBQTRCO01BQzFCLElBQUlELEVBQUUsQ0FBQ2hCLE9BQUgsQ0FBV0MsV0FBWCxPQUE2QixNQUFqQyxFQUF5QyxPQUFPLElBQVA7TUFDekNlLEVBQUUsR0FBR0EsRUFBRSxDQUFDRSxVQUFSOztNQUNBLE9BQU9GLEVBQUUsQ0FBQ2hCLE9BQUgsQ0FBV0MsV0FBWCxPQUE2QixNQUE3QixJQUF1QyxDQUFDZSxFQUFFLENBQUN2QyxTQUFILENBQWFnQixRQUFiLENBQXNCd0IsR0FBdEIsQ0FBL0MsRUFBMkU7UUFDekVELEVBQUUsR0FBR0EsRUFBRSxDQUFDRSxVQUFSO01BQ0Q7O01BQ0QsT0FBT0YsRUFBRSxDQUFDaEIsT0FBSCxDQUFXQyxXQUFYLE9BQTZCLE1BQTdCLEdBQXNDZSxFQUF0QyxHQUEyQyxJQUFsRDtJQUNEIiwiZmlsZSI6Ii4vanMvbWVnYS1kcm9wZG93bi5qcy5qcyIsInNvdXJjZXNDb250ZW50IjpbImNvbnN0IFRJTUVPVVQgPSAxNTBcclxuXHJcbmNsYXNzIE1lZ2FEcm9wZG93biB7XHJcbiAgY29uc3RydWN0b3IoZWxlbWVudCwgb3B0aW9ucyA9IHt9KSB7XHJcbiAgICB0aGlzLl9vbkhvdmVyID0gb3B0aW9ucy50cmlnZ2VyID09PSAnaG92ZXInIHx8IGVsZW1lbnQuZ2V0QXR0cmlidXRlKCdkYXRhLXRyaWdnZXInKSA9PT0gJ2hvdmVyJ1xyXG5cclxuICAgIHRoaXMuX2NvbnRhaW5lciA9IE1lZ2FEcm9wZG93bi5fZmluZFBhcmVudChlbGVtZW50LCAnbWVnYS1kcm9wZG93bicpXHJcbiAgICBpZiAoIXRoaXMuX2NvbnRhaW5lcikgcmV0dXJuXHJcblxyXG4gICAgdGhpcy5fbWVudSA9IHRoaXMuX2NvbnRhaW5lci5xdWVyeVNlbGVjdG9yKCcuZHJvcGRvd24tdG9nZ2xlIH4gLmRyb3Bkb3duLW1lbnUnKVxyXG4gICAgaWYgKCF0aGlzLl9tZW51KSByZXR1cm5cclxuXHJcbiAgICBlbGVtZW50LnNldEF0dHJpYnV0ZSgnYXJpYS1leHBhbmRlZCcsICdmYWxzZScpXHJcblxyXG4gICAgdGhpcy5fZWwgPSBlbGVtZW50XHJcbiAgICB0aGlzLl9iaW5kRXZlbnRzKClcclxuICB9XHJcblxyXG4gIG9wZW4oKSB7XHJcbiAgICBpZiAodGhpcy5fdGltZW91dCkge1xyXG4gICAgICBjbGVhclRpbWVvdXQodGhpcy5fdGltZW91dClcclxuICAgICAgdGhpcy5fdGltZW91dCA9IG51bGxcclxuICAgIH1cclxuICAgIGlmICh0aGlzLl9mb2N1c1RpbWVvdXQpIHtcclxuICAgICAgY2xlYXJUaW1lb3V0KHRoaXMuX2ZvY3VzVGltZW91dClcclxuICAgICAgdGhpcy5fZm9jdXNUaW1lb3V0ID0gbnVsbFxyXG4gICAgfVxyXG5cclxuICAgIGlmICh0aGlzLl9lbC5nZXRBdHRyaWJ1dGUoJ2FyaWEtZXhwYW5kZWQnKSAhPT0gJ3RydWUnKSB7XHJcbiAgICAgIHRoaXMuX3RyaWdnZXJFdmVudCgnc2hvdycpXHJcbiAgICAgIHRoaXMuX2NvbnRhaW5lci5jbGFzc0xpc3QuYWRkKCdzaG93JylcclxuICAgICAgdGhpcy5fbWVudS5jbGFzc0xpc3QuYWRkKCdzaG93JylcclxuICAgICAgdGhpcy5fZWwuc2V0QXR0cmlidXRlKCdhcmlhLWV4cGFuZGVkJywgJ3RydWUnKVxyXG4gICAgICB0aGlzLl9lbC5mb2N1cygpXHJcbiAgICAgIHRoaXMuX3RyaWdnZXJFdmVudCgnc2hvd24nKVxyXG4gICAgfVxyXG4gIH1cclxuXHJcbiAgY2xvc2UoZm9yY2UpIHtcclxuICAgIGlmICh0aGlzLl90aW1lb3V0KSB7XHJcbiAgICAgIGNsZWFyVGltZW91dCh0aGlzLl90aW1lb3V0KVxyXG4gICAgICB0aGlzLl90aW1lb3V0ID0gbnVsbFxyXG4gICAgfVxyXG4gICAgaWYgKHRoaXMuX2ZvY3VzVGltZW91dCkge1xyXG4gICAgICBjbGVhclRpbWVvdXQodGhpcy5fZm9jdXNUaW1lb3V0KVxyXG4gICAgICB0aGlzLl9mb2N1c1RpbWVvdXQgPSBudWxsXHJcbiAgICB9XHJcblxyXG4gICAgaWYgKHRoaXMuX29uSG92ZXIgJiYgIWZvcmNlKSB7XHJcbiAgICAgIHRoaXMuX3RpbWVvdXQgPSBzZXRUaW1lb3V0KCgpID0+IHtcclxuICAgICAgICBpZiAodGhpcy5fdGltZW91dCkge1xyXG4gICAgICAgICAgY2xlYXJUaW1lb3V0KHRoaXMuX3RpbWVvdXQpXHJcbiAgICAgICAgICB0aGlzLl90aW1lb3V0ID0gbnVsbFxyXG4gICAgICAgIH1cclxuICAgICAgICB0aGlzLl9jbG9zZSgpXHJcbiAgICAgIH0sIFRJTUVPVVQpXHJcbiAgICB9IGVsc2Uge1xyXG4gICAgICB0aGlzLl9jbG9zZSgpXHJcbiAgICB9XHJcbiAgfVxyXG5cclxuICB0b2dnbGUoKSB7XHJcbiAgICAvLyBlc2xpbnQtZGlzYWJsZS1uZXh0LWxpbmUgbm8tdW51c2VkLWV4cHJlc3Npb25zXHJcbiAgICB0aGlzLl9lbC5nZXRBdHRyaWJ1dGUoJ2FyaWEtZXhwYW5kZWQnKSA9PT0gJ3RydWUnID8gdGhpcy5jbG9zZSh0cnVlKSA6IHRoaXMub3BlbigpXHJcbiAgfVxyXG5cclxuICBkZXN0cm95KCkge1xyXG4gICAgdGhpcy5fdW5iaW5kRXZlbnRzKClcclxuICAgIHRoaXMuX2VsID0gbnVsbFxyXG5cclxuICAgIGlmICh0aGlzLl90aW1lb3V0KSB7XHJcbiAgICAgIGNsZWFyVGltZW91dCh0aGlzLl90aW1lb3V0KVxyXG4gICAgICB0aGlzLl90aW1lb3V0ID0gbnVsbFxyXG4gICAgfVxyXG5cclxuICAgIGlmICh0aGlzLl9mb2N1c1RpbWVvdXQpIHtcclxuICAgICAgY2xlYXJUaW1lb3V0KHRoaXMuX2ZvY3VzVGltZW91dClcclxuICAgICAgdGhpcy5fZm9jdXNUaW1lb3V0ID0gbnVsbFxyXG4gICAgfVxyXG4gIH1cclxuXHJcbiAgX2Nsb3NlKCkge1xyXG4gICAgaWYgKHRoaXMuX2VsLmdldEF0dHJpYnV0ZSgnYXJpYS1leHBhbmRlZCcpID09PSAndHJ1ZScpIHtcclxuICAgICAgdGhpcy5fdHJpZ2dlckV2ZW50KCdoaWRlJylcclxuICAgICAgdGhpcy5fY29udGFpbmVyLmNsYXNzTGlzdC5yZW1vdmUoJ3Nob3cnKVxyXG4gICAgICB0aGlzLl9tZW51LmNsYXNzTGlzdC5yZW1vdmUoJ3Nob3cnKVxyXG4gICAgICB0aGlzLl9lbC5zZXRBdHRyaWJ1dGUoJ2FyaWEtZXhwYW5kZWQnLCAnZmFsc2UnKVxyXG4gICAgICB0aGlzLl90cmlnZ2VyRXZlbnQoJ2hpZGRlbicpXHJcbiAgICB9XHJcbiAgfVxyXG5cclxuICBfYmluZEV2ZW50cygpIHtcclxuICAgIHRoaXMuX2VsQ2xpY2tFdm50ID0gZSA9PiB7XHJcbiAgICAgIGUucHJldmVudERlZmF1bHQoKVxyXG4gICAgICB0aGlzLnRvZ2dsZSgpXHJcbiAgICB9XHJcbiAgICB0aGlzLl9lbC5hZGRFdmVudExpc3RlbmVyKCdjbGljaycsIHRoaXMuX2VsQ2xpY2tFdm50KVxyXG5cclxuICAgIHRoaXMuX2JvZHlDbGlja0V2bnQgPSBlID0+IHtcclxuICAgICAgaWYgKCF0aGlzLl9jb250YWluZXIuY29udGFpbnMoZS50YXJnZXQpICYmIHRoaXMuX2NvbnRhaW5lci5jbGFzc0xpc3QuY29udGFpbnMoJ3Nob3cnKSkge1xyXG4gICAgICAgIHRoaXMuY2xvc2UodHJ1ZSlcclxuICAgICAgfVxyXG4gICAgfVxyXG4gICAgZG9jdW1lbnQuYm9keS5hZGRFdmVudExpc3RlbmVyKCdjbGljaycsIHRoaXMuX2JvZHlDbGlja0V2bnQsIHRydWUpXHJcblxyXG4gICAgdGhpcy5fbWVudUNsaWNrRXZudCA9IGUgPT4ge1xyXG4gICAgICBpZiAoZS50YXJnZXQuY2xhc3NMaXN0LmNvbnRhaW5zKCdtZWdhLWRyb3Bkb3duLWxpbmsnKSkge1xyXG4gICAgICAgIHRoaXMuY2xvc2UodHJ1ZSlcclxuICAgICAgfVxyXG4gICAgfVxyXG4gICAgdGhpcy5fbWVudS5hZGRFdmVudExpc3RlbmVyKCdjbGljaycsIHRoaXMuX21lbnVDbGlja0V2bnQsIHRydWUpXHJcblxyXG4gICAgdGhpcy5fZm9jdXNvdXRFdm50ID0gKCkgPT4ge1xyXG4gICAgICBpZiAodGhpcy5fZm9jdXNUaW1lb3V0KSB7XHJcbiAgICAgICAgY2xlYXJUaW1lb3V0KHRoaXMuX2ZvY3VzVGltZW91dClcclxuICAgICAgICB0aGlzLl9mb2N1c1RpbWVvdXQgPSBudWxsXHJcbiAgICAgIH1cclxuXHJcbiAgICAgIGlmICh0aGlzLl9lbC5nZXRBdHRyaWJ1dGUoJ2FyaWEtZXhwYW5kZWQnKSAhPT0gJ3RydWUnKSByZXR1cm5cclxuXHJcbiAgICAgIHRoaXMuX2ZvY3VzVGltZW91dCA9IHNldFRpbWVvdXQoKCkgPT4ge1xyXG4gICAgICAgIGlmIChcclxuICAgICAgICAgIGRvY3VtZW50LmFjdGl2ZUVsZW1lbnQudGFnTmFtZS50b1VwcGVyQ2FzZSgpICE9PSAnQk9EWScgJiZcclxuICAgICAgICAgIE1lZ2FEcm9wZG93bi5fZmluZFBhcmVudChkb2N1bWVudC5hY3RpdmVFbGVtZW50LCAnbWVnYS1kcm9wZG93bicpICE9PSB0aGlzLl9jb250YWluZXJcclxuICAgICAgICApIHtcclxuICAgICAgICAgIHRoaXMuY2xvc2UodHJ1ZSlcclxuICAgICAgICB9XHJcbiAgICAgIH0sIDEwMClcclxuICAgIH1cclxuICAgIHRoaXMuX2NvbnRhaW5lci5hZGRFdmVudExpc3RlbmVyKCdmb2N1c291dCcsIHRoaXMuX2ZvY3Vzb3V0RXZudCwgdHJ1ZSlcclxuXHJcbiAgICBpZiAodGhpcy5fb25Ib3Zlcikge1xyXG4gICAgICB0aGlzLl9lbnRlckV2bnQgPSAoKSA9PiB7XHJcbiAgICAgICAgaWYgKHdpbmRvdy5nZXRDb21wdXRlZFN0eWxlKHRoaXMuX21lbnUsIG51bGwpLmdldFByb3BlcnR5VmFsdWUoJ3Bvc2l0aW9uJykgPT09ICdzdGF0aWMnKSByZXR1cm5cclxuICAgICAgICB0aGlzLm9wZW4oKVxyXG4gICAgICB9XHJcbiAgICAgIHRoaXMuX2xlYXZlRXZudCA9ICgpID0+IHtcclxuICAgICAgICBpZiAod2luZG93LmdldENvbXB1dGVkU3R5bGUodGhpcy5fbWVudSwgbnVsbCkuZ2V0UHJvcGVydHlWYWx1ZSgncG9zaXRpb24nKSA9PT0gJ3N0YXRpYycpIHJldHVyblxyXG4gICAgICAgIHRoaXMuY2xvc2UoKVxyXG4gICAgICB9XHJcblxyXG4gICAgICB0aGlzLl9lbC5hZGRFdmVudExpc3RlbmVyKCdtb3VzZWVudGVyJywgdGhpcy5fZW50ZXJFdm50KVxyXG4gICAgICB0aGlzLl9tZW51LmFkZEV2ZW50TGlzdGVuZXIoJ21vdXNlZW50ZXInLCB0aGlzLl9lbnRlckV2bnQpXHJcbiAgICAgIHRoaXMuX2VsLmFkZEV2ZW50TGlzdGVuZXIoJ21vdXNlbGVhdmUnLCB0aGlzLl9sZWF2ZUV2bnQpXHJcbiAgICAgIHRoaXMuX21lbnUuYWRkRXZlbnRMaXN0ZW5lcignbW91c2VsZWF2ZScsIHRoaXMuX2xlYXZlRXZudClcclxuICAgIH1cclxuICB9XHJcblxyXG4gIF91bmJpbmRFdmVudHMoKSB7XHJcbiAgICBpZiAodGhpcy5fZWxDbGlja0V2bnQpIHtcclxuICAgICAgdGhpcy5fZWwucmVtb3ZlRXZlbnRMaXN0ZW5lcignY2xpY2snLCB0aGlzLl9lbENsaWNrRXZudClcclxuICAgICAgdGhpcy5fZWxDbGlja0V2bnQgPSBudWxsXHJcbiAgICB9XHJcbiAgICBpZiAodGhpcy5fYm9keUNsaWNrRXZudCkge1xyXG4gICAgICBkb2N1bWVudC5ib2R5LnJlbW92ZUV2ZW50TGlzdGVuZXIoJ2NsaWNrJywgdGhpcy5fYm9keUNsaWNrRXZudCwgdHJ1ZSlcclxuICAgICAgdGhpcy5fYm9keUNsaWNrRXZudCA9IG51bGxcclxuICAgIH1cclxuICAgIGlmICh0aGlzLl9tZW51Q2xpY2tFdm50KSB7XHJcbiAgICAgIHRoaXMuX21lbnUucmVtb3ZlRXZlbnRMaXN0ZW5lcignY2xpY2snLCB0aGlzLl9tZW51Q2xpY2tFdm50LCB0cnVlKVxyXG4gICAgICB0aGlzLl9tZW51Q2xpY2tFdm50ID0gbnVsbFxyXG4gICAgfVxyXG4gICAgaWYgKHRoaXMuX2ZvY3Vzb3V0RXZudCkge1xyXG4gICAgICB0aGlzLl9jb250YWluZXIucmVtb3ZlRXZlbnRMaXN0ZW5lcignZm9jdXNvdXQnLCB0aGlzLl9mb2N1c291dEV2bnQsIHRydWUpXHJcbiAgICAgIHRoaXMuX2ZvY3Vzb3V0RXZudCA9IG51bGxcclxuICAgIH1cclxuICAgIGlmICh0aGlzLl9lbnRlckV2bnQpIHtcclxuICAgICAgdGhpcy5fZWwucmVtb3ZlRXZlbnRMaXN0ZW5lcignbW91c2VlbnRlcicsIHRoaXMuX2VudGVyRXZudClcclxuICAgICAgdGhpcy5fbWVudS5yZW1vdmVFdmVudExpc3RlbmVyKCdtb3VzZWVudGVyJywgdGhpcy5fZW50ZXJFdm50KVxyXG4gICAgICB0aGlzLl9lbnRlckV2bnQgPSBudWxsXHJcbiAgICB9XHJcbiAgICBpZiAodGhpcy5fbGVhdmVFdm50KSB7XHJcbiAgICAgIHRoaXMuX2VsLnJlbW92ZUV2ZW50TGlzdGVuZXIoJ21vdXNlbGVhdmUnLCB0aGlzLl9sZWF2ZUV2bnQpXHJcbiAgICAgIHRoaXMuX21lbnUucmVtb3ZlRXZlbnRMaXN0ZW5lcignbW91c2VsZWF2ZScsIHRoaXMuX2xlYXZlRXZudClcclxuICAgICAgdGhpcy5fbGVhdmVFdm50ID0gbnVsbFxyXG4gICAgfVxyXG4gIH1cclxuXHJcbiAgc3RhdGljIF9maW5kUGFyZW50KGVsLCBjbHMpIHtcclxuICAgIGlmIChlbC50YWdOYW1lLnRvVXBwZXJDYXNlKCkgPT09ICdCT0RZJykgcmV0dXJuIG51bGxcclxuICAgIGVsID0gZWwucGFyZW50Tm9kZVxyXG4gICAgd2hpbGUgKGVsLnRhZ05hbWUudG9VcHBlckNhc2UoKSAhPT0gJ0JPRFknICYmICFlbC5jbGFzc0xpc3QuY29udGFpbnMoY2xzKSkge1xyXG4gICAgICBlbCA9IGVsLnBhcmVudE5vZGVcclxuICAgIH1cclxuICAgIHJldHVybiBlbC50YWdOYW1lLnRvVXBwZXJDYXNlKCkgIT09ICdCT0RZJyA/IGVsIDogbnVsbFxyXG4gIH1cclxuXHJcbiAgX3RyaWdnZXJFdmVudChldmVudCkge1xyXG4gICAgaWYgKGRvY3VtZW50LmNyZWF0ZUV2ZW50KSB7XHJcbiAgICAgIGxldCBjdXN0b21FdmVudFxyXG5cclxuICAgICAgaWYgKHR5cGVvZiBFdmVudCA9PT0gJ2Z1bmN0aW9uJykge1xyXG4gICAgICAgIGN1c3RvbUV2ZW50ID0gbmV3IEV2ZW50KGV2ZW50KVxyXG4gICAgICB9IGVsc2Uge1xyXG4gICAgICAgIGN1c3RvbUV2ZW50ID0gZG9jdW1lbnQuY3JlYXRlRXZlbnQoJ0V2ZW50JylcclxuICAgICAgICBjdXN0b21FdmVudC5pbml0RXZlbnQoZXZlbnQsIGZhbHNlLCB0cnVlKVxyXG4gICAgICB9XHJcblxyXG4gICAgICB0aGlzLl9jb250YWluZXIuZGlzcGF0Y2hFdmVudChjdXN0b21FdmVudClcclxuICAgIH0gZWxzZSB7XHJcbiAgICAgIHRoaXMuX2NvbnRhaW5lci5maXJlRXZlbnQoYG9uJHtldmVudH1gLCBkb2N1bWVudC5jcmVhdGVFdmVudE9iamVjdCgpKVxyXG4gICAgfVxyXG4gIH1cclxufVxyXG5cclxuZXhwb3J0IHsgTWVnYURyb3Bkb3duIH1cclxuIl0sInNvdXJjZVJvb3QiOiIifQ==\n//# sourceURL=webpack-internal:///./js/mega-dropdown.js\n");

/***/ })

/******/ })));
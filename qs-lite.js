/**
 * qs-lite.js - Lightweight querystring parse() & stringify() at less than 1KB minified
 *
 * @module qs-lite
 * @copyright Yusuke Kawasaki
 * @license BSD
 * @see https://github.com/kawanet/qs-lite
 * @see http://kawanet.github.io/qs-lite/module-qs-lite.html
 */

(function(exports, window) {

  if (!exports) exports = window.qs = {};

  exports.parse = parse;
  exports.stringify = stringify;

  /**
   * Parse string as application/x-www-form-urlencoded representation.
   *
   * @class qs
   * @function parse
   * @param string {String} application/x-www-form-urlencoded representation
   * @returns {Object} plain key-value pair object
   * @example
   * var qs = require("qs-lite");
   *
   * var obj = qs.parse("foo=bar&hoge=pomu"); // => { "foo": "bar", "hoge": "pomu" }
   */

  function parse(string) {
    var obj = {};
    if (string) string.replace(/\+/g, " ").split(/[&;]/).forEach(it);
    return obj;

    function it(pair) {
      var len = pair.length;
      if (!len) return;
      var pos = pair.indexOf("=");
      if (pos < 0) pos = len;
      var key = decodeURIComponent(pair.substr(0, pos));
      var val = decodeURIComponent(pair.substr(pos + 1));
      obj[key] = val;
    }
  }

  /**
   * Stringify object as application/x-www-form-urlencoded representation.
   *
   * @class qs
   * @function stringify
   * @param obj {Object} plain key-value pair object
   * @returns {string} application/x-www-form-urlencoded representation.
   * @example
   * var qs = require("qs-lite");
   *
   * var string = qs.stringify({foo: "bar", hoge: "pomu"}); // => "foo=bar&hoge=pomu"
   */

  function stringify(obj) {
    var list = [];
    if ("object" === typeof obj && obj !== null) Object.keys(obj).map(it);
    return list.join("&");

    function it(key) {
      var val = obj[key];
      if (val == null) return;
      // if (val === "") return;
      if (val instanceof Function) return;
      var pair = encodeURIComponent(key) + "=" + encodeURIComponent(val);
      list.push(pair);
    }
  }

})(("undefined" !== typeof exports) && exports, ("undefined" !== typeof window) ? window : {});

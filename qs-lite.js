/**
 * qs-lite.js
 *
 * @copyright Yusuke Kawasaki
 * @license MIT
 * @see https://gist.github.com/kawanet/cffd433f179ac393d779
 */

(function(exports, window) {

  if (!exports) exports = window.qs = {};

  exports.parse = parse;
  exports.stringify = stringify;

  /**
   * Parse string as application/x-www-form-urlencoded representation.
   *
   * @param string {String}
   * @returns {Object}
   * @example
   * var obj = qs.parse("foo=bar&hoge=pomu");
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
   * @param obj {Object}
   * @returns {string}
   * @example
   * var string = qs.stringify({foo: "bar", hoge: "pomu"});
   */

  function stringify(obj) {
    var list = [];
    if ("object" === typeof obj && obj !== null) Object.keys(obj).map(it);
    return list.join("&");

    function it(key) {
      var val = obj[key];
      if ("undefined" === typeof val) return;
      if (val === null) return;
      // if (val === "") return;
      if (val instanceof Function) return;
      var pair = encodeURIComponent(key) + "=" + encodeURIComponent(val);
      list.push(pair);
    }
  }

})(("undefined" !== typeof exports) && exports, ("undefined" !== typeof window) ? window : {});

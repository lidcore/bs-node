// Generated by BUCKLESCRIPT VERSION 4.0.5, PLEASE EDIT WITH CARE
'use strict';

var Js_null_undefined = require("bs-platform/lib/js/js_null_undefined.js");

function toString($staropt$star, $staropt$star$1, stop, buffer) {
  var encoding = $staropt$star !== undefined ? $staropt$star : "utf8";
  var start = $staropt$star$1 !== undefined ? $staropt$star$1 : 0;
  var stop$1 = stop !== undefined ? stop : buffer.length - start;
  return buffer.toString(encoding, start, stop$1);
}

var partial_arg = Buffer;

function alloc(param) {
  return partial_arg.alloc(param);
}

var partial_arg$1 = Buffer;

function concat(param) {
  return partial_arg$1.concat(param);
}

function from(encoding, data) {
  return Buffer.from(data, Js_null_undefined.fromOption(encoding));
}

var get = function (buf,idx){return buf[idx];};

var set = function (buf,idx,el){buf[idx] = el;};

function length(prim) {
  return prim.length;
}

exports.alloc = alloc;
exports.concat = concat;
exports.length = length;
exports.from = from;
exports.toString = toString;
exports.get = get;
exports.set = set;
/* partial_arg Not a pure module */

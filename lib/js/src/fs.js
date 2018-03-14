// Generated by BUCKLESCRIPT VERSION 2.2.2, PLEASE EDIT WITH CARE
'use strict';

var Fs = require("fs");
var Curry = require("bs-platform/lib/js/curry.js");
var Callback = require("bs-callback/lib/js/src/callback.js");
var Js_boolean = require("bs-platform/lib/js/js_boolean.js");
var Buffer$LidcoreBsNode = require("./buffer.js");

function read(fd, buffer, offset, length, position, cb) {
  Fs.read(fd, buffer, offset, length, position, (function (err, read, buffer) {
          return cb(err, /* tuple */[
                      read,
                      buffer
                    ]);
        }));
  return /* () */0;
}

function createStream(fn, path, fd, autoClose, _) {
  var autoClose$1 = autoClose ? /* Some */[Js_boolean.to_js_boolean(autoClose[0])] : /* None */0;
  var tmp = { };
  if (fd) {
    tmp.fd = fd[0];
  }
  if (autoClose$1) {
    tmp.autoClose = autoClose$1[0];
  }
  var params = tmp;
  var $$default = function (param) {
    if (param) {
      return param[0];
    } else {
      return null;
    }
  };
  var path$1 = $$default(path);
  return Curry._2(fn, path$1, params);
}

function createReadStream(param, param$1, param$2, param$3) {
  return createStream((function (prim, prim$1) {
                return Fs.createReadStream(prim, prim$1);
              }), param, param$1, param$2, param$3);
}

function createWriteStream(param, param$1, param$2, param$3) {
  return createStream((function (prim, prim$1) {
                return Fs.createWriteStream(prim, prim$1);
              }), param, param$1, param$2, param$3);
}

function existsSync(path) {
  return +Fs.existsSync(path);
}

function readFile(path) {
  return (function (param) {
      return Callback.$great$great((function (param) {
                    Fs.readFile(path, param);
                    return /* () */0;
                  }), (function (data) {
                    var partial_arg = Buffer$LidcoreBsNode.toString(data);
                    return (function (param) {
                        return Callback.$$return(partial_arg, param);
                      });
                  }), param);
    });
}

function readFileSync(path) {
  return Buffer$LidcoreBsNode.toString(Fs.readFileSync(path));
}

function copyFileSync(prim, prim$1) {
  Fs.copyFileSync(prim, prim$1);
  return /* () */0;
}

function openFile(prim, prim$1, prim$2) {
  Fs.open(prim, prim$1, prim$2);
  return /* () */0;
}

function close(prim, prim$1) {
  Fs.close(prim, prim$1);
  return /* () */0;
}

function unlinkSync(prim) {
  Fs.unlinkSync(prim);
  return /* () */0;
}

function writeFile(prim, prim$1, prim$2) {
  Fs.writeFile(prim, prim$1, prim$2);
  return /* () */0;
}

exports.copyFileSync = copyFileSync;
exports.createWriteStream = createWriteStream;
exports.createReadStream = createReadStream;
exports.existsSync = existsSync;
exports.openFile = openFile;
exports.close = close;
exports.unlinkSync = unlinkSync;
exports.read = read;
exports.readFile = readFile;
exports.readFileSync = readFileSync;
exports.writeFile = writeFile;
/* fs Not a pure module */
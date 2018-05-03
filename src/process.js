// Generated by BUCKLESCRIPT VERSION 3.0.0, PLEASE EDIT WITH CARE
'use strict';


function string_of_signal(param) {
  if (param >= -419244694) {
    if (param >= -419095938) {
      if (param >= 19585038) {
        if (param >= 313061648) {
          return "SIGWINCH";
        } else {
          return "SIGBREAK";
        }
      } else if (param >= -418600653) {
        return "SIGSEV";
      } else {
        return "SIGINT";
      }
    } else if (param >= -419144110) {
      return "SIGHUP";
    } else {
      return "SIGFPE";
    }
  } else if (param !== -1005404301) {
    if (param >= -983274258) {
      if (param >= -419442481) {
        return "SIGBUS";
      } else {
        return "SIGUSR1";
      }
    } else if (param >= -995060003) {
      return "SIGTERM";
    } else {
      return "SIGPIPE";
    }
  } else {
    return "SIGSTOP";
  }
}

function on(signal, fn) {
  process.on(string_of_signal(signal), fn);
  return /* () */0;
}

exports.on = on;
/* No side effect */
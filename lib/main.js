/**
 * @author Takahiro INOUE <takahiro.inoue@aist.go.jp>
 * @license Copyright (c) 2017-2019 AIST Songle Project
 */
(function(global) {
  "use strict";
  var __module__ = require("./api.js").default;

  if(!global.XMLHttpRequest) {
    global.XMLHttpRequest = require("w3c-xmlhttprequest").XMLHttpRequest;
  }

  if("process" in global) {
    module[ "exports" ] = __module__;
  }

  global[ "Songle" ] = __module__;
})((this || 0).self || global)

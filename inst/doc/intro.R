## ----, echo = FALSE, message = FALSE--------------------------------------------------------------
knitr::opts_chunk$set(comment = "")
options(width=100L)
library(js)

## -------------------------------------------------------------------------------------------------
callback <- 'function(x, y){ 
  var z = x*y ;
  return z;
}'
js_typeof(callback)

## -------------------------------------------------------------------------------------------------
conf <- '{
  foo : function (){},
  bar : 123
}'
js_typeof(conf)

## -------------------------------------------------------------------------------------------------
jscode <- readLines(system.file("js/uglify.min.js", package="js"), warn = FALSE)
js_validate_script(jscode)

## -------------------------------------------------------------------------------------------------
js_validate_script('function(x, y){return x + y}', error = FALSE)

## -------------------------------------------------------------------------------------------------
code <- "function test(x, y){ x = x || 1; y = y || 1; return x*y;}"
cat(uglify_reformat(code, beautify = TRUE, indent_level = 2))

## -------------------------------------------------------------------------------------------------
cat(code)
cat(uglify_optimize(code))

## -------------------------------------------------------------------------------------------------
code <- "var foo = 123"
jshint(code)


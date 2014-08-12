#= require ./lib/jquery-1.11.1.min
#= require_tree .

$ ->
  console.log "hoge"
  FLAutoKerning.process $(".title")
#= require ./lib/jquery-1.11.1.min
#= require_tree .

$ ->
  FLAutoKerning.process $(".title")
  console.log "きさま！見ているなッ！"

#= require ./lib/jquery-1.11.1.min
#= require_tree .

class Navigation
  
  constructor : ($element) ->
    @$nav = $element
    @$icon = @$nav.find ".icon"
    @$lists = @$nav.find ".list"
    @$list = @$lists.find "li"
    @showFlg = false
    @clickFlg = false

    @$icon.click =>
      @toggle()

  show : ->
    _this = @

    @showFlg = true
    @clickFlg = true

    @$nav.css
      "width":"100%"
      "height":"100%"
    
    @$list.css
      "opacity":0
      "display":"none"

    @$lists.css
      "opacity":0
      "display":"block"
    .stop().animate
      "opacity":1
    ,500 ,"easeOutQuart"

    @$list.each (i) ->
      $(@).css
        "display":"block"
      .delay(100*i).animate
        "opacity":1
      ,250 ,"easeOutSine" ,->
        if i >= _this.$list.length - 1
          _this.clickFlg = false

  hidden : ->
    @showFlg = false
    @clickFlg = true

    @$lists.stop().animate
      "opacity":0
    ,500 ,"easeOutQuart" ,=>
      @$nav.css
        "width":"auto"
        "height":"auto"

      @$lists.css "display":"none"
      @clickFlg = false

  toggle : ->
    unless @clickFlg
      if @showFlg then @hidden() else @show()

$ ->
  console.log "きさま！見ているなッ！"

  navigation = new Navigation $("body > .nav")

  setTimeout =>
    $(".share").css "display":"block"
  ,1000

  #FLAutoKerning.process $(".title")

  $("pre, code").addClass "prettyprint"
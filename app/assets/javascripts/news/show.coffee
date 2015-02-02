$ ->
  if ($('.show')[0])
    console.log('news/show')

    newsId = 1
    $(window).scroll((e) ->
      $window = $(e.currentTarget)
      scrollTop = $window.scrollTop()
      #console.log(scrollTop)

      if scrollTop % 200 == 0
        console.log('pushstate: ' + scrollTop)
        newsId = newsId + 1
        history.pushState(null, null, '/news/' + newsId)
    )

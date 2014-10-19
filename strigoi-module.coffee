class Reveal
  constructor: ->
    @name = 'strigoi-reveal-js'

  defaultInit =
    controls: true
    progress: true
    history: true
    center: true

  init: (@site, @opts, cb) ->
    rd = @opts.revealDir or= 'reveal'

    rsync = [
      ['@bower/reveal-js/js/reveal.min.js', rd + '/reveal.js']
    ]

    if @opts.cssTheme
      rsync.push.apply rsync, [
        ['@bower/reveal-js/css/reveal.min.css', rd + '/reveal.css']
        ["@bower/reveal-js/css/theme/#{@opts.cssTheme}.css", rd + '/theme.css']
      ]

    @site.configure
      bowerPackages: [
        'reveal-js'
      ]
      rsync: rsync

    if @opts.revealInit
      @opts.revealInit = @site.merge defaultInit, @opts.revealInit

    cb()

module.exports = new Reveal

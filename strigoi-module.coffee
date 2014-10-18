class Reveal
  constructor: ->
    @name = 'strigoi-reveal-js'

  init: (@site, @opts, cb) ->
    @opts.revealDir or= 'reveal'
    @opts.revealJs or= 'reveal.js'
    @opts.revealJsPath = @opts.revealDir + '/' + @opts.revealJs

    @site.configure
      bowerPackages: [
        'reveal-js'
      ]
      rsync: [
        ['@bower/reveal-js/js/reveal.min.js', @opts.revealJsPath]
      ]

    cb()

module.exports = new Reveal

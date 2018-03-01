ready = ->
  new Typed '.thanks',
    strings: [
      "Massive thanks to",
      "our mentors"
      "Zuza, ^1000 Darek, ^1000 Łukasz ^1000 and Robert!"
    ],
    typeSpeed: 80,
    backSpeed: 40,
    smartBackspace: true
    fadeOut: true,
    fadeOutDelay: 2000,
    loop: true,
    loopCount: Infinity,
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready

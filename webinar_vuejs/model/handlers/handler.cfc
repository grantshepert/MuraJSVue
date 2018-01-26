component extends='mura.cfobject' {

  function onRenderStart(m) {
    // if script should be included in the <head>
    arguments.m.addToHTMLFootQueue('<script src="/modules/webinar_vuejs/js/vue.js"></script>');

    // arguments.m.addToHTMLFootQueue('<script src="/path/to/script.js"></script>');
  }

}

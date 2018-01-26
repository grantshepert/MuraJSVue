component extends='mura.cfobject' {
  
  function onRenderStart(m) {
    // if script should be included in the <head>
    arguments.m.addToHTMLFootQueue('<script src="/modules/webinar_murajs/js/vue.js"></script>');

    // arguments.m.addToHTMLFootQueue('<script src="/path/to/script.js"></script>');
    var siteid = m.getEvent().get('siteid');

    var exists = m.getServiceFactory().containsBean('officelocation');

    if(!exists) {
      var beanjson = fileRead("./officelocation.json");

      var officelocation = m.getServiceFactory().declareBean(json=beanjson,siteid=siteid);
    }
    else {
        var officelocation2 = m.getBean('officelocation');
    }

  }

}

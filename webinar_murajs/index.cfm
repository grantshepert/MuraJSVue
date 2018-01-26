<cfoutput>
<style>
ul.nav li {
  margin-left: 3px;
}
pre strong {
  font-weight: normal;
}
pre strong.data {
  font-weight: bold;
  color: ##0066ff;
}
pre strong.vue {
  font-weight: bold;
  color: ##ff3399;
}
pre strong.promise {
  font-weight: bold;
  color: ##33cc33;
}
.box {
  font-size: 1em !important;
  border: 2px solid ##ccc;
  border-radius: 5px;
  padding: 10px;
  margin: 10px 0;
}
.box p {
  margin-bottom: 0.3rem !important;
}
.box h1,.box h2,.box h3 {
  font-size: 1.2em !important;
}
.btn-data {
  border-color: ##0066ff;
  background-color: ##0066ff;
  color: ##fff;
}
.btn-vue {
  border-color: ##ff3399;
  background-color: ##ff3399;
  color: ##fff;
}
.btn-promise {
  border-color: ##33cc33;
  background-color: ##33cc33;
  color: ##fff;
}
</style>

<div style="width: 30%;float: left">
  <div id="officeLocations">
    <input type="text" name="filter" id="results-filter">
    <button @click="doLoad">Show</button>
    <select id="sort-dir" @change="doLoad">
      <option value="asc">ASC</option>
      <option value="desc">DESC</option>
    </select>

    <ul id="office-list" style="list-style: none;display: none;">
      <li v-for="(item, index) in items">
        <div class="box">
        <h1>{{item.name}}</h1>
        <p>{{item.city}},{{item.state}}</p>
        <p>{{item.street}}</p>
        <h3>Hours of Operation</h3>
        <span v-html="item.hours"></span>
        </div>
      </li>
    </ul>
  </div>
</div>
<div style="width: 68%;float: right; padding: 0 0 0 10px">
  <div id="exampleNav">
    <ul class="nav nav-tabs" role="tablist" style="border-bottom: 0px">
      <li :class="{ btn: 1,'btn-secondary': currentView!==1, 'btn-success': currentView===1 }" @click="setCurrentView(1)">Markup</li>
      <li :class="{ btn: 1,'btn-secondary': currentView!==2, 'btn-success': currentView===2 }" @click="setCurrentView(2)">Vue.js</li>
      <li :class="{ btn: 1,'btn-secondary': currentView!==3, 'btn-success': currentView===3 }" @click="setCurrentView(3)">Mura JS</li>
    </ul>
    <p></p>
    <div v-show="currentView===1" style='border: 2px solid ##fff;padding: 1px;border-radius: 10px;'>
<pre style="font-size: 1.2em;background-color: ##fff">
  &lt;div id="officeLocations">
    &lt;input type="text" name="filter" id="results-filter">
    &lt;button <strong :class="{vue: highlight_vue}">@click="doLoad"</strong>>Show&lt;/button>
    &lt;select id="sort-dir" <strong :class="{vue: highlight_vue}">@change="doLoad"</strong>>
      &lt;option value="asc">ASC&lt;/option>
      &lt;option value="desc">DESC&lt;/option>
    &lt;/select>

    &lt;ul id="office-list">
      <strong :class="{vue: highlight_vue}">&lt;li v-for="(item, index) in items"></strong>
      <strong :class="{data: highlight_data}">
        &lt;h1>{{item.name<span/>}}&lt;/h1>
        &lt;p>{{item.city<span/>}},{{item.state<span/>}}&lt;/p>
        &lt;p>{{item.street<span/>}}&lt;/p>
        &lt;h3>Hours of Operation&lt;/h3>
        &lt;span v-html="item.hours">&lt;/span>
        &lt;hr>
      </strong>
      <strong :class="{vue: highlight_vue}">&lt;/li></strong>
    &lt;/ul>
  &lt;/div>

</pre>
<ul class="nav nav-tabs" role="tablist" style="border-bottom: 0px">
  <li :class="{ btn: 1,'btn-secondary': highlight_data!==1, 'btn-data': highlight_data===1 }" @click="highlight_data == 1 ? highlight_data=0 : highlight_data=1">Data</li>
  <li :class="{ btn: 1,'btn-secondary': highlight_vue!==1, 'btn-vue': highlight_vue===1 }" @click="highlight_vue == 1 ? highlight_vue=0 : highlight_vue=1">Bindings</li>
</ul>
    </div>

    <div v-show="currentView===2" style='border: 2px solid ##fff;padding: 1px;border-radius: 10px;'>
      <pre style="font-size: 1.2em;background-color: ##fff">
var officeLocations = new Vue({
  el: '##officeLocations',
  data: {
    items: []
  },
  methods: {
    <strong :class="{data: highlight_data}">
    doLoad: function() {
      var sortDir = Mura("##sort-dir").val();

      WebinarExample
      .feed(this.setResults,"officelocation","name",sortDir);
    },
    </strong><strong :class="{vue: highlight_vue}">
    setResults: function( results ) {

      Mura("##office-list").show();
      this.items = results.list;
    }
  </strong>
  }
});
</pre>
<ul class="nav nav-tabs" role="tablist" style="border-bottom: 0px">
  <li :class="{ btn: 1,'btn-secondary': highlight_data!==1, 'btn-data': highlight_data===1 }" @click="highlight_data == 1 ? highlight_data=0 : highlight_data=1">Remote Call</li>
  <li :class="{ btn: 1,'btn-secondary': highlight_vue!==1, 'btn-vue': highlight_vue===1 }" @click="highlight_vue == 1 ? highlight_vue=0 : highlight_vue=1">Promise "Resolve"</li>
</ul>

    </div>
    <div v-show="currentView===3" style='border: 2px solid ##fff;padding: 1px;border-radius: 10px;'>
<pre style="font-size: 1.2em;background-color: ##fff">
  var WebinarExample = {

    feed: function( listener,entityname,sortBy,sortDir ) {
      var data = {};
      <strong :class="{data: highlight_data}">
      var feed = Mura
        .getFeed(entityname)
        .itemsPerPage(20);
      </strong><strong :class="{data: highlight_data}">
      if(Mura("##results-filter").val().length)
        feed.prop('name').contains(Mura("##results-filter").val());
      </strong><strong :class="{data: highlight_data}">
      if(sortBy)
        feed.sort(sortBy,sortDir);
      </strong><strong :class="{vue: highlight_vue}">
      feed.getQuery()
        .then(<strong :class="{promise: highlight_promise}">
          // resolve aka 'success!'
          function(collection) {
            data.list=collection.getAll().items;
            listener(data);
          },
          // reject aka 'failure!'
          function(response) {
            alert("You done messed up, lad");
          }</strong>
      );
    }</strong>
  }
</pre>
<ul class="nav nav-tabs" role="tablist" style="border-bottom: 0px">
  <li :class="{ btn: 1,'btn-secondary': highlight_data!==1, 'btn-data': highlight_data===1 }" @click="highlight_data == 1 ? highlight_data=0 : highlight_data=1">Basics</li>
  <li :class="{ btn: 1,'btn-secondary': highlight_vue!==1, 'btn-vue': highlight_vue===1 }" @click="highlight_vue == 1 ? highlight_vue=0 : highlight_vue=1">Remote Request</li>
  <li :class="{ btn: 1,'btn-secondary': highlight_promise!==1, 'btn-promise': highlight_promise===1 }" @click="highlight_promise == 1 ? highlight_promise=0 : highlight_promise=1">Promise</li>
</ul>

    </div>

  </div>

</div>

<script language="JavaScript">
Mura( function(m) {

  	// structDelete(application.objectMappings,entity.entityName);

  	var WebinarExample = {
  		siteID: '',
  		endpoint: '',

  		init: function(siteID) {

  			WebinarExample.siteID = "default";
  			WebinarExample.endpoint = '/index.cfm/_api/json/v1/default/';

  			return WebinarExample;
  		},

  		getEndpoint: function() {
  			return WebinarExample.endpoint;
  		},

      feed: function( listener,entityname,sortBy,sortDir,filters) {
  			var self = this;
  			var entity = {};
  			var data = {};
  			var filterVal='';
        var itemsPer = 20;
  			var feed = Mura
  				.getFeed(entityname)
  				.itemsPerPage(itemsPer);

  			if(entityname=='entity'){
  				feed.prop('scaffold').isEQ(1);
  			}

  			var hasFilterApplied=false;

  			if(Mura("##results-filter").val().length) {
          feed.prop('name').contains(Mura("##results-filter").val());
        }

  			if(sortBy) {
  				feed.sort(sortBy,sortDir);
  			}

         console.log('start');

  			feed.getQuery()
  				.then(
            function(collection) {
              console.log('collection');
              console.log(collection);

    				data.collection = collection;
    				data.list=collection.getAll().items;
    				data.links=collection.getAll().links;

    				collection.get('properties').then(
              function(response){
      					data.properties=response.properties.properties;
      					data.parentproperties=response.properties;

      					if(typeof data.parentproperties.dynamic=='undefined'){
      						data.parentproperties.dynamic=false;
      					} else if(typeof data.parentproperties.dynamic =='string'){
      						if(data.parentproperties.dynamic=='0' || data.parentproperties.dynamic.toLowerCase()=='false'){
      							data.parentproperties.dynamic=false;
      						} else {
      							data.parentproperties.dynamic=true;
      						}
      					}
      					data.hasFilterApplied=hasFilterApplied;
      					listener(data);

    				  },
              function(response) {
                alert("Danger!")
              }
            );
  			 },
         function(collection) {
          alert('Broken!');
         }
        );
  		}

    }

    var WebinarExample = new WebinarExample.init( 'default' );

    var officeLocations = new Vue({
      el: '##officeLocations',
      data: {
        items: []
      },
      methods: {
        doLoad: function() {
          WebinarExample.feed( this.setResults,"officelocation","name",Mura("##sort-dir").val() );
        },
        setResults: function( results ) {

          Mura("##office-list").show();
          this.items = results.list;
        }
      }
    });

    var exampleNav = new Vue({
      el: '##exampleNav',
      data: {
        currentView: 0,
        highlight_data: 0,
        highlight_vue: 0,
        highlight_promise: 0
      },
      methods: {
        setCurrentView: function( val ) {
          this.highlight_data=0;
          this.highlight_promise=0;
          this.highlight_vue=0;
          this.currentView = val;
        }
      }
    });

});


</script>

</cfoutput>

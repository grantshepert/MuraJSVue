<cfoutput>

  <style>
  ul.nav li {
    margin-left: 3px;

  }
  pre {
    white-space: pre-wrap;
    word-wrap: break-word;
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

  <div id="examples">
    <ul class="nav nav-tabs" role="tablist" style="border-bottom: 0px,margint-bottom: 30px">
      <li :class="{ btn: 1,'btn-secondary': 1, 'btn-success': currentView===1 }" @click="setCurrentView(1)">Example 1</li>
      <li :class="{ btn: 1,'btn-secondary': 1, 'btn-success': currentView===2 }" @click="setCurrentView(2)">Example 2</li>
      <li :class="{ btn: 1,'btn-secondary': 1, 'btn-success': currentView===3 }" @click="setCurrentView(3)">Example 3</li>
    </ul>

    <div v-if="currentView===1">
      <p></p>
      <h3>HTML:</h3>
<pre style="font-size: 1.2em">
&lt;div id="ex1">
  &lt;p>Message: <strong>{{message<span></span>}}</strong>&lt;/p>
&lt;/div>
</pre>
<h3>JavaScript:</h3>
<pre style="font-size: 1.2em">
var ex1 = new Vue({
  el: '##ex1',
  data: {
    message: "Hello Webinar!"
  }
});

</pre>

      <div id="ex1">
        <h3>Result:</h3>
        <p>Message: {{message}}</p>
      </div>
    </div>


<!-- example 2 -->
    <div v-if="currentView===2">
      <p></p>
      <h3>HTML:</h3>
<pre style="font-size: 1.2em">
&lt;div id="ex2"></br>
&nbsp;&nbsp;&lt;p <strong>:title="message"</strong>>Hover over me for the message  &lt;/p></br>
&lt;/div></br>
</pre>
<h3>JavaScript:</h3>
<pre style="font-size: 1.2em;">
var ex2 = new Vue({</br>
&nbsp;&nbsp;el: '##ex2',</br>
&nbsp;&nbsp;data: {</br>
&nbsp;&nbsp;&nbsp;&nbsp;message: "Hello Webinar!"</br>
&nbsp;&nbsp;}</br>
});

</pre>
      <div id="ex2">
        <h3>Result:</h3>
        <p :title="message">Hover over me for the message</p>
      </div>

      <p><strong>:title</strong> is shorthand for <strong>v-bind:title</strong>
    </div>

<!-- example 3 -->
    <div v-if="currentView===3">
      <ex3></ex3>
    </div>
</div>




	<template id="ex3">
		<div>
      <p></p>
      <h3>HTML:</h3>
<pre style="font-size: 1.2em">
&lt;div></br>
&nbsp;&nbsp;<strong>&lt;ex3>&lt;/ex3></strong></br>
&lt;/div></br>
</pre>
<h3>HTML Template:</h3>
<pre style="font-size: 1.2em">
&lt;template id="ex3"></br>
&nbsp;&nbsp;&lt;div></br>
&nbsp;&nbsp;&nbsp;&nbsp;&lt;p>&lt;button @click="<strong>doSomethingCool</strong>">CLICK&lt;/button> {{message<span></span>}}&lt;/p></br>
&nbsp;&nbsp;&lt;/div></br>
&lt;/template>
</pre>
<h3>JavaScript:</h3>
<pre style="font-size: 1.2em">
Vue.component('ex3', {</br>
&nbsp;&nbsp;<strong>template: '##ex3',</strong></br>
&nbsp;&nbsp;data: function () {</br>
&nbsp;&nbsp;&nbsp;&nbsp;return {message: "<-- Click on this to see something cool!"};</br>
&nbsp;&nbsp;},</br>
&nbsp;&nbsp;methods: {</br>
&nbsp;&nbsp;&nbsp;&nbsp;<strong>doSomethingCool: function() {</br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;this.message = "Okay, maybe not cool, but still pretty neat!";</br>
&nbsp;&nbsp;&nbsp;&nbsp;}</strong></br>
&nbsp;&nbsp;}</br>
});</br>
</pre>

      <div id="ex3">
        <h3>Result:</h3>
        <p><button @click="doSomethingCool">CLICK</button> {{message}}</p>
      </div>

      <p><strong>@click</strong> is shorthand for <strong>v-on:click</strong>
		</div>
	</template>



<script language="JavaScript">
Mura(function(m) {

  var ex1 = new Vue({
    el: '##ex1',
    data: {
      message: "Hello Webinar!"
    }
  });

  var ex2 = new Vue({
    el: '##ex2',
    data: {
      message: "Hello Webinar!"
    }
  });

  Vue.component('ex3', {
		template: '##ex3',
    data: function () {
      return {message: "<-- Click on this to see something cool!"};
    },
    methods: {
      doSomethingCool: function() {
        console.log('I was clicked');
        this.message = "Okay, maybe not cool, but still pretty neat!";
      }
    }
	});

  var theView = new Vue({
    el: '##examples',
    data: {
      currentView: 1
    },
    methods: {
      setCurrentView: function( val ) {
        console.log('clicked: ' + val);
        console.log(this.currentView);
        this.currentView = val;
        console.log(this.currentView);
      }
    }
  });

/*


*/

});
</script>

</cfoutput>

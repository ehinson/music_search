// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets

function showTab(tab_id) {
  var tmp_tab = document.getElementById(tab_id);
  var tab_li_elements = document.getElementById('tabs').getElementsByTagName('li');
  var div_sections = document.getElementsByTagName('section');
  console.log (div_sections[0]);

  console.log(tab_li_elements);
  console.log(tab_li_elements[0]);

  for(var i = 0; i < tab_li_elements.length; i++) {
    tmp_tab_id = tab_li_elements[i].getElementsByTagName('a')[0].id
    console.log(tmp_tab_id);
    tab_li_elements[i].className = "";

    for (var j = 0; j < div_sections.length; j++) {
      div_sections[j].className = "hide";

      if (div_sections[j].id === tab_id) {
        div_sections[j].className = tab_id;
      }
    };

    if(tmp_tab_id === tab_id){
      // tab_li_elements[i] This add the class "active"
      console.log("Found match: " + tmp_tab_id + " " + tab_id);
      tab_li_elements[i].className += "active";
    }else{
      // tab_li_elements[i] This remove the class "active"
      console.log("not active" + tmp_tab_id);
    }
  }
  console.log(tab_li_elements);
}
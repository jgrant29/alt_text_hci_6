// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"  
import "trix"
import "@rails/actiontext"
import './add_jquery'
import Rails from '@rails/ujs';
Rails.start();

let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
  return new bootstrap.Popover(popoverTriggerEl)  
})  
/*
var grid = document.querySelector('#alts');


var tabEl = document.querySelector('button[data-bs-toggle="tab"]')
tabEl.addEventListener('show.bs.tab', function (event) {
  event.target // newly activated tab
  //event.relatedTarget // previous active tab
  new Masonry(grid,{
    itemSelector: '#alt',
    columnWidth: '#alt',
    percentPosition: true
  });
  
})*/

document.addEventListener("turbo:submit-start", (event) => {
  confirmSubmission(event).then(() => {
    // show progress bar and set submit state here.
    // this block is optional.
  })
})






$(document).ready(function() {

    function toggleFav(e) {
      console.log(e.currentTarget);
      var btn = e.currentTarget;
        btn.classList.toggle("fa-heart-o");
      if (btn.classList.contains("fa-heart-o")) {
          btn.dataset.method = "post";
        
      } else {
          btn.dataset.method = "delete";
      }
    }

    var favs = document.getElementsByClassName("fa-heart");
      for (let i = 0; i < favs.length; i++){
    
      favs[i].addEventListener('click', toggleFav, false);
    }
  })

  




//favbtn.addEventListener("click", (event) => {
  //console.log(event.current.target)
  //document.getElementById("favorite").classList.toggle("fa-heart-o");

//})


function confirmSubmission(event) {
  const button = event.target.querySelector("[data-confirm]")
  const message = button?.dataset?.confirm

  return new Promise(resolve => {
    if (!message || confirm(message)) {
      resolve()
    } else {
      event.detail.formSubmission.stop()
      event.preventDefault()
      event.stopImmediatePropagation()
    }
  })
}





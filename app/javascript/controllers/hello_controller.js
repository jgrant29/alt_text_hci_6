import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

   function previewImage(){

    
    }
    var formFile = document.getElementById("formFile")
    formFile.addEventListener('change', function() {
       
        var image_prev = document.getElementById('preview');
        image_prev.src = URL.createObjectURL(target.files[0]);
        image_prev.onload = function() {
        URL.revokeObjectURL(image_prev.src) 
        }
    });
      
  

    function myFunction(x) {
      if (x.matches) { // If media query matches
        document.getElementsByClassName("d-xtra-small");
      } else {
        document.body.style.backgroundColor = "pink";
      }
    }

    var x = window.matchMedia("(max-width: 700px)")
    xtra_small = document.getElementsByClassName("d-xtra-small");
    myFunction(x) // Call listener function at run time
    x.addListener(myFunction) // Attach listener function on state changes
  }
}



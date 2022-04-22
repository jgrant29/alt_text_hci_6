import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  
    
      
  

    function myFunction(x) {
      if (x.matches) { // If media query matches
        document.body.style.backgroundColor = "red";
      } else {
        document.body.style.backgroundColor = "pink";
      }
    }

    var x = document.getElementsByClassName("col-lg-9");
    xtra_small = document.getElementsByClassName("d-xtra-small");
    myFunction(x) // Call listener function at run time
    x.addListener(myFunction) // Attach listener function on state changes
  }
}



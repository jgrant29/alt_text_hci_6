import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  $(function() {
  $('#formFile').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    // here's the file size
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
      img.src = file.target.result;
      $('#preview').html(img);
    }
    reader.readAsDataURL(image);
    console.log(files);
  });
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



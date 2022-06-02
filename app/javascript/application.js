// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"  
import "trix"
import "@rails/actiontext"
import "pixelmatch"


let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))  
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {  
  return new bootstrap.Popover(popoverTriggerEl)  
})  

document.addEventListener("turbo:submit-start", (event) => {
  confirmSubmission(event).then(() => {
    // show progress bar and set submit state here.
    // this block is optional.
  })
})

   var f;
    var image2 = [];
    var r = new FileReader();
   
    var alts = $('.alts').data('alts')
    var mime_type = "image/jpeg"
 
   
var r2; 
var img1 = "";
var base64String = "";
$(document).on("turbolinks:load", function() {
  $('#formFile').on('change', function(event) {
    var files = event.target.files;
    var image = files[0]
    var formData = new FormData()
    console.log(image.size);
    var reader = new FileReader();
    reader.onload = function(file) {
      var img = new Image();
      console.log(file);
    
      
      
     
      img.src = file.target.result;
      $('#preview').html(img);
      formData.append('image', image)
      console.log(img.width);

      base64String = reader.result
    
      img1 =base64String;
    
    for (const i of alts) {
       if (img1.trim() === i.trim()) {
        
        alert("This image has already exists! Please select another image.")
        $('#formFile').val("");
        $('#submit-btn').prop('disabled', true);
        break;
        
      } else{
         console.log("Not a duplicate")
          $('#submit-btn').prop('disabled', false);
      }


    }
   
      //new Int8Array(reader.readAsArrayBuffer(image))
                //.replace('data:', '')
               // .replace(/^.+,/, '');

      //console.log(base64String);

      fetch('https://alt-text-hci-6.herokuapp.com/alts/', {
            method: 'POST',

            body: formData
        })
        .then(resp => resp.arrayBuffer())
        .then(data => {
            if (data.errors) {
              alert(data.errors)
              console.log(data)
            }
            else {
              console.log(data)
              //console.log(new Uint8Array(JSON.parse(data)))
              //ase64String = new Uint8Array(JSON.parse(data))
            }
        });
    }

    
    reader.readAsDataURL(image);
    console.log(files);

    
  });
});


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



$(function() {
  'use strict';

  var croppingImage = document.querySelector('#croppingImage'),
  img_w = document.querySelector('.img-w'),
  cropBtn = document.querySelector('.crop'),
  croppedImg = document.querySelector('.cropped-img'),
  dwn = document.querySelector('.download'),
  upload = document.querySelector('#cropperImageUpload'),
  cropper = '';
  var image_link = ''
  $('.file-upload-browse').on('click', function(e) {
    var file = $(this).parent().parent().parent().find('.file-upload-default');
    // file.trigger('click');
  });

  cropper = new Cropper(croppingImage);

  // on change show image with crop options
  upload.addEventListener('change', function (e) {

    if (e.target.files.length) {
      cropper.destroy();
      // start file reader
      const reader = new FileReader();
      reader.onload = function (e) {
        if(e.target.result){
          croppingImage.src = e.target.result;
          cropper = new Cropper(croppingImage);
        }
      };
      reader.readAsDataURL(e.target.files[0]);
    }
  });

  // crop on click
  cropBtn.addEventListener('click',function(e) {
    e.preventDefault();
    // get result to data uri
    let imgSrc = cropper.getCroppedCanvas({
      width: img_w.value // input value
    }).toDataURL();
    croppedImg.src = imgSrc;
    image_link = imgSrc;
    dwn.setAttribute('href', imgSrc);
    dwn.download = 'imagename.png';
  });
  dwn.addEventListener('click',function(e){
   var blob = dataURItoBlob(image_link);
   console.log(blob);
   

    var fd = new FormData();
 
    fd.append("myFile", blob);
    $.ajax({
          type: "post", 
          url: "/upload_image",
          data:  fd,
          contentType: false,
          processData: false,
          success: function(data, textStatus, jqXHR){
            
            
          },
          error: function(jqXHR, textStatus, errorThrown){
            }
    })





  })
  function dataURItoBlob(dataURI) {
    // convert base64 to raw binary data held in a string
    // doesn't handle URLEncoded DataURIs - see SO answer #6850276 for code that does this
    var byteString = atob(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

    // write the bytes of the string to an ArrayBuffer
    var ab = new ArrayBuffer(byteString.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    //Old Code
    //write the ArrayBuffer to a blob, and you're done
    //var bb = new BlobBuilder();
    //bb.append(ab);
    //return bb.getBlob(mimeString);

    //New Code
    return new Blob([ab], {type: mimeString});


}

});

function error_msg(msg,sign)
{
  if (sign=='error')
  {
  Swal.fire({
        position: 'center',
        type: 'error',
        title: msg,
        showConfirmButton: false,
        timer: 1500
      })
   }
   else
   {
    Swal.fire({
        position: 'center',
        type: 'success',
        title: msg,
        showConfirmButton: false,
        timer: 2000
      })
   }
}



function validateform() {

    var password = $("#pwd").val();
    var confirmPassword = $("#pwd_confirm").val();
    var x=$("#email").val();

    if ($("#fname").val().length ==0) {
            error_msg('name should be filled','error');
            return false;
        }

    var atposition=x.indexOf("@");  
    var dotposition=x.lastIndexOf(".");  
    if (atposition<1 || dotposition<atposition+2 || dotposition+2>=x.length){  
      error_msg('Please enter a valid e-mail address','error');
      return false;  
      }

    if ($("#user_password").val().length < 8) {
        error_msg('password should be 8 characters','error');
        return false;
      }

     if (password != confirmPassword) {
            error_msg('Passwords do not match.','error');
            return false;

      }

 } 
function error_msg(msg,sign)
{
  if (sign=='error')
  {
  swal({
          title: "Sorry!!",
          text: msg,
          icon: "error",
          confirmButtonText: "OK",

         })
   }
   else
   {
    swal({
          title: "Success!!",
          text: msg,
          icon: "success",
          confirmButtonText: "OK",

         })
   }
}





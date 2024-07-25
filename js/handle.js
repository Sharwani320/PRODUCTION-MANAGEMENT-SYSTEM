/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$("#login_btn").click(function () {
            var username = $("#username").val();
            var password = $("#password").val();
            console.log(username + " " + password);
            $.post("login.jsp", {username: username,password:password}, function (result) {
              // alert($.trim(result));
               if($.trim(result)==true || $.trim(result)=="true"){
                   
                 //  alert("i will go to dashboard");
                 window.location.href="dashboard.jsp";
               }
               else{
                   alert("Login Failed");
               }
            });
        }); 
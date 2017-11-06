
<%@page import="java.text.DateFormatSymbols"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
<link rel="stylesheet" type="text/css" href="css/reg.css" />
<script>
        function checkPass()
      {
    var pass1 = document.getElementById('password').value;
    var pass2 = document.getElementById('repassword').value;
    
    var newpass1 = pass1.toLowerCase();
    var newpass2 = pass2.toLowerCase();
    var message = document.getElementById('confirmMessage');
    
    var goodColor = "#66cc66";
    var badColor = "#ff6666";

    if(newpass1 == newpass2){
    	document.getElementById('repassword').style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!";
    }else{
 
    	document.getElementById('repassword').style.backgroundColor = badColor;
        message.style.color = badColor;
        document.getElementById('repassword').value="";
        document.getElementById('repassword').focus();
        message.innerHTML = "Passwords Do Not Match!";
    }
}  
    </script>
<script>
        function hidediv(){
        	document.getElementById("message").style.visibility = "hidden";
        }
        setTimeout("hidediv()", 5000); // after 5 secs
    </script>
</head>
<body>
	<div id="main_container">
		<div id="main_content">
			<div class="left_content"></div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar">
					<h2>Create your Email Account</h2>
				</div>
				<div class="prod_box_big">
					<div class="center_prod_box_big">
						<br />
						<br />
						<% if (session.getAttribute("error")!=null) {%>
						<div id="message" style="color: red; font-size: 16px;">
							<%= session.getAttribute("error").toString() %>
						</div>
						<%session.setAttribute("error", null); %>
						<br />
						<%}%>
						<div class="contact_form">
							<form method="post" action="SignUpServlet" name="signupform"
								id="signup_form">
								<div class="form_row">
									<label class="contact"><strong>Full Name:</strong></label> <input
										type="text" tabindex="1" class="contact_input" name="fname"
										id="fname" autofocus required />
								</div>

								<div class="form_row">
									<label class="contact"><strong>Location:</strong></label> <input
										type="text" tabindex="2" class="contact_input" name="address"
										id="address" required />
								</div>

								<div class="form_row">
									<label class="contact"><strong>Mobile No:</strong></label> <input
										type="text" class="contact_input" name="mobno" id="mobno"
										pattern="[789][0-9]{9}" required />
								</div>

								<div class="form_row">
									<label class="contact"><strong>Gender:</strong></label> <input
										type="radio" id="male" name="gender" value="male" checked
										id="male" /> <label style="color: #333333; font-size: 12px;"
										for="male"><strong>Male:</strong></label>

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
										id="female" name="gender" value="female" id="female" /> <label
										style="color: #333333; font-size: 12px;" for="female"><strong>Female:</strong></label>
								</div>

								<div class="form_row">
									<label class="contact"><strong>Email:</strong></label> <input
										type="email" pattern="[A-Za-z0-9._%+-]+@gmail.com$"
										class="contact_input" name="email" id="email" required />
								</div>

								<div class="form_row">
									<label class="contact"><strong>Password:</strong></label> <input
										type="password" class="contact_input" name="password"
										id="password" required />
								</div>

								<div class="form_row">
									<label class="contact"><strong>RePassword:</strong></label> <input
										type="password" class="contact_input" name="repassword"
										id="repassword" required onblur="checkPass(); return false;" />
									<Strong><span id="confirmMessage"
										class="confirmMessage"></span></Strong>
								</div>
								<div class="form_row">
									<button type="submit" id="signIn" name="signIn"
										class="rc-button rc-button-submit">Sign Up</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- end of center content -->
			<div class="right_content"></div>
			<!-- end of right content -->
		</div>
		<!-- end of main content -->
	</div>
	<!-- end of main_container -->
</body>
<script src="js/dictation.js"></script>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/login.css" rel="stylesheet" media="screen">
<title>Voice Email</title>
</head>
<body>
	<div class="wrapper">
		<div class="google-header-bar  centered">
			<div class="header content clearfix">
				<div class="logo logo-w"></div>
			</div>
		</div>
		<div class="main content clearfix">
			<div class="banner">
				<h1 class="h1">One account for Voice Based Email System.</h1>
				<h2 class="hidden-small">Sign in to continue to Email Account</h2>
			</div>
			<div class="main-content no-name">
				<div class="card signin-card pre-shift no-name">
					<div class="circle-mask" style=""></div>
					<form method="post" action="chklogin" id="gaia_loginform">
						<div class="form-panel first valid" id="gaia_firstform">
							<div class="slide-out ">
								<div class="input-wrapper focused">
									<div id="identifier-shown">
										<div>
											<input type="email" pattern="[A-Za-z0-9._%+-]+@gmail.com$"
												id="Email" name="Email" placeholder="Your email Account"
												autofocus />
										</div>
									</div>
								</div>
							</div>
							<div class="slide-out ">
								<div class="input-wrapper focused">
									<div id="identifier-shown">
										<div>
											<input id="password" name="password"
												placeholder="Your email password" type="password" required />
											<% if (session.getAttribute("failuer")!=null) {%>
											<label id="message" style="color: red; font-size: 15px;">
												<%= session.getAttribute("failuer").toString() %>
											</label>
											<%}%>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button type="submit" id="signIn" name="signIn"
							class="rc-button rc-button-submit">Sign in</button>
						<br>
						<br> <a id="link-forgot-passwd" href="forgotpassword.jsp">Forgot
							password?</a> <br> <a id="create" class="need-help"
							href="signUp.jsp">Create Account</a> <br>
						<br> <a id="help" class="need-help1" href="help.jsp">Need
							Help!</a>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/dictation.js"></script>
</body>
</html>
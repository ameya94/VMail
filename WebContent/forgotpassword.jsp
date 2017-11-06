<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/login.css" rel="stylesheet" media="screen">
<title>Forgot password</title>
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
				<h1 class="h1">Forgot your password?</h1>
				<h3 class="hidden-small1">To get your password, Give the Mobile
					Number you use to sign in to Account.</h3>
			</div>
			<div class="main-content no-name">
				<div class="card signin-card pre-shift no-name">
					<form method="post" action="password">
						<div class="form-panel first valid">
							<div class="slide-out ">
								<div class="input-wrapper focused">
									<div id="identifier-shown">
										<div>
											<label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												Mobile Number</label><br />
											<br /> <input id="forgot" name="mobile" class="forgot"
												placeholder="Speak your Registered mobile no. Here"
												type="text" autofocus required>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="form-panel second">
							<div>
								<button type="submit" id="forgotpass" name="forgot"
									class="rc-button rc-button-submit">Submit</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="js/dictation.js"></script>
</body>
</html>
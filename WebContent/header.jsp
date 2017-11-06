
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="com.sun.speech.freetts.VoiceManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/open.css" />
        <script>
        	function hidediv(){
        		document.getElementById("message").style.visibility = "hidden";
        	}
        	setTimeout("hidediv()", 3000); // after 3 secs
        </script>
<%
             String userid=(String)session.getAttribute("usermail");
            %>

<div id="header">
	<div id="logo">
		<a href="#" class="logoname"><img src="images/header.png" alt=""
			border="0" width="192" height="80" /></a>
	</div>
	<div class="top_right">
		<form action="logout" method="post">
			<input type="hidden" id="to1" name="to"> <input type="hidden"
				id="subject1" name="subject"> <input type="hidden"
				id="body1" name="body">
			<div class="languages">
				<label class="name"><%=userid %></label>
				<button type="submit" id="logout" class="styled-button-4"
					tabindex="8">Logout</button>
			</div>
		</form>
		<div class="big_banner">
			<form action="search.jsp" method="post">
				<input type="text" class="searchbox" name="keyword" id="keyword"
					tabindex="6" /> <input type="submit" class="styled-button-5"
					value="" id="searchkey" tabindex="7" />
			</form>
		</div>
	</div>
</div>
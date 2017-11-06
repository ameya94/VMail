<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
	function refresh()
	{
  		window.location.reload();
	}
</script>
<!-- start of menu tab -->
<div id="menu_tab">
	<ul class="menu">
		<li class="divider"></li>
		<li><a href="#" class="nav" id="refresh" onclick="refresh()"
			tabindex="15"> Refresh </a></li>
		<li class="divider"></li>
		<!--             <li><a href="back.jsp" id="help" class="nav" tabindex="16">Back</a></li>   -->
		<li>
			<% if (session.getAttribute("msg")!=null) {%> <label id="message"
			style="padding: 0 150px; color: #fff; font-size: 22px;"> <%= session.getAttribute("msg").toString() %>
		</label> <%
                             session.setAttribute("msg", "");
                            // session.getAttribute(null);
                         	 }%>
		</li>
	</ul>
</div>
<!-- end of menu tab -->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voice Based Email</title>
<script type="text/javascript">
        	function openfile(str)
        	{
        		location="openmail.jsp?classname=search&&id="+str;
        	}
        </script>
</head>
<body>
	<div id="main_container">

		<%@include file="header.jsp"%>

		<div id="main_content">

			<!-- start of menu tab -->
			<%@include file="menuTab.jsp"%>
			<!-- end of menu tab -->

			<div class="left_content">
				<%@include file="leftContent.jsp"%>

			</div>
			<!-- end of left content -->
			<div class="center_content">
				<div class="center_title_bar" id="first">Search Result</div>
				<%
              	 		 int i=6;
                    %>
				<input type="hidden" value="<%=i%>" id="tabend" />
				<% 
                  String keyword=request.getParameter("keyword");
                  if(keyword!=null)
                  {
                	  DatabaseConnection db = new DatabaseConnection();
                      db.dbconnection();    
                      
                      String sql="Select * from email where Concat(fromemail, '', toemail, '', subject, '', content, '', datetime) like '%"+keyword+"%'  ORDER BY DateTime DESC";
                      ResultSet rs=db.getResultSet(sql);
                      while(rs.next())
                      {
                    	  String id=rs.getString("id");
                    	  String ToEmail=rs.getString("ToEmail");
                    	  String Subject=rs.getString("subject");
                    	  String DateTime=rs.getString("DateTime");
                    	  String status=rs.getString("status");
                    	  if(status.equals("Unread"))
                    	  {
                %>
				<div class="prod_box_big" tabindex="<%=i %>" onmouseover="read();"
					onclick="openfile(<%=id%>)" id="open<%=i%>" tabindex="<%=i%>">
					<input type="hidden" id="id" value="<%=id%>">
					<div class="center_prod_box_big">
						<div class="product_img_big">
							<b style="font-size: 15px;"><%=ToEmail %></b>
						</div>
						<div class="details_big_box">
							<div class="product_title_big"><%=Subject %></div>
						</div>
						<div class="dateright">
							<div class="product_title_big"><%=DateTime %></div>
						</div>
					</div>
				</div>
				<% 
                    	  }
                    	  else
                    	  {
              %>
				<div class="prod_box_big1" tabindex="<%=i %>"
					onclick="openfile(<%=id%>)" id="open<%=i%>" tabindex="<%=i%>">
					<input type="hidden" id="id" value="<%=id%>">
					<div class="center_prod_box_big1">
						<div class="product_img_big1">
							<div style="font-size: 15px;"><%=ToEmail %></div>
						</div>
						<div class="details_big_box1">
							<div class="product_title_big1"><%=Subject %></div>
						</div>
						<div class="dateright">
							<div class="product_title_big1"><%=DateTime %></div>
						</div>
					</div>
				</div>
				<%
                    	  }
                    	  i++;
             		} 
                  }
               		int count=i;
               %>
				<input type="hidden" id="allmail" class="pagename" /> <input
					type="hidden" value="<%=count%>" id="count" />
				<!-- end of center content -->
			</div>
			<!-- end of main content -->
			<%@include file="compose.jsp"%>
		</div>
		<!-- end of main_container -->
	</div>
</body>
</html>

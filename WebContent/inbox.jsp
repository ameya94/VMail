
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voice Based Email System</title>
<script type="text/javascript">
        	function openfile(str)
        	{
        		location="openmail.jsp?classname=inbox&&id="+str;
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
				<div class="center_title_bar" id="first">Inbox</div>
				<%
              	 		 int i=17;
                    %>
				<input type="hidden" value="<%=i%>" id="tabend" />
				<% 
                  String ToEmail="";
                  if(userid!=null)
                  {
                	  DatabaseConnection db = new DatabaseConnection();
                      db.dbconnection();    
                     
                      String sql="SELECT * FROM email WHERE fromemail='" + userid + "' AND activity='Receive' AND drafts='No' AND trash='No' ORDER BY DateTime DESC";
                      ResultSet rs=db.getResultSet(sql);
                      while(rs.next())
                      {
                    	  String id=rs.getString("id");
                    	  ToEmail=rs.getString("ToEmail");
                    	  String Subject=rs.getString("subject");
                    	  String DateTime=rs.getString("DateTime");
                    	  String status=rs.getString("status");

                    	  if(status.equals("Unread"))
                    	  {
                %>
				<div class="prod_box_big" onmouseover="read();"
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
				<div class="prod_box_big1" onmouseover="read();"
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
				<input type="hidden" id="inbox" class="pagename" /> <input
					type="hidden" value="<%=count%>" id="count" />
				<!-- end of center content -->
			</div>
			<!-- end of main content -->
		</div>
		<%@include file="compose.jsp"%>
	</div>
	<!-- end of main_container -->
</body>
<script src="js/leftcontent.js"></script>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voice Based Email</title>
<script type="text/javascript">
        	function openfile(str)
        	{
        		location="openmail.jsp?classname=send&&id="+str;
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
				<div class="center_title_bar" id="first">Send Mail</div>
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
                      
                      String sql="SELECT * FROM email WHERE fromemail='" + userid + "' AND activity='Send' AND drafts='No' AND trash='No' ORDER BY DateTime DESC";
                      ResultSet rs=db.getResultSet(sql);
                      while(rs.next())
                      {
                    	  String id=rs.getString("id");
                    	  ToEmail=rs.getString("ToEmail");
                    	  String Subject=rs.getString("subject");
                    	  String DateTime=rs.getString("DateTime");
                    	  String status=rs.getString("status");
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
                    	  i++;
             		} 
                  }
               		int count=i;
                %>
				<input type="hidden" id="send" class="pagename" /> <input
					type="hidden" value="<%=count%>" id="count" />
				<!-- end of center content -->
			</div>
			<!-- end of main content -->
		</div>
		<%@include file="compose.jsp"%>
	</div>
	<!-- end of main_container -->
</body>
</html>

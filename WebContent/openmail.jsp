
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Voice Based Email System</title>
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

			<div class="center_content_mail">
				<% 
                  int userid1=Integer.parseInt(request.getParameter("id"));
                  String classname=request.getParameter("classname");
                  
                	  DatabaseConnection db = new DatabaseConnection();
                      db.dbconnection();    
                      
                      String sql1="Update email Set status='Read' WHERE id=" + userid1 + "";
                      int i=db.getUpdate(sql1);
                      
                      String sql="SELECT * FROM email WHERE id="+ userid1 + "";
                      ResultSet rs=db.getResultSet(sql);
                      while(rs.next())
                      {
                    	  String id=rs.getString("id");
                    	  String ToEmail=rs.getString("ToEmail");
                    	  String FromEmail=rs.getString("FromEmail");
                    	  String Subject=rs.getString("subject");
                    	  String DateTime=rs.getString("DateTime");
                    	  String body=rs.getString("content");
                    	  String status=rs.getString("status");
                %>
				<div class="tp">
					<div class="top-content">
						<b style="font-size: 15px;"><%=Subject %></b>
					</div>
					<div class="top-content1">
						<div class="center_title" id="first">Inbox</div>
					</div>
				</div>
				<div class="prod_box" tabindex="1" onmouseover="read();">
					<div class="center_prod_box">
						<div class="details_big">
							<div class="product_title">
								From:-<%=ToEmail%></div>

							<!--  <div class="product_img_big">
				                               <b style="font-size:15px;">to me.</b>
				                          </div> -->
							<div class="body_content">
								<div class="body_content_title"><%=body %></div>
							</div>
						</div>
						<div class="dateright">
							<div class="product_title"><%=DateTime %></div>
							<input type="hidden" id="<%=classname%>" class="myClassName" />
						</div>
					</div>
				</div>
				<% 
                      }
              %>
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript">
				function viewbox()
		         {
		                 dv = document.getElementById("move");
		                 if (dv.style.display ==  'none')
		                 { 
		                	 	dv.style.display = '';
		                	 	document.getElementById("to").focus();
		                 }
		         }
          </script>
<div class="title_box">
	<button id="compose" onclick="viewbox()" class="compose-button"
		tabindex="9">Compose</button>
</div>
<div class="mymenu">
	<ul class="left_menu">

		<li class="odd"><a href="inbox.jsp" id="inbox" tabindex="10">Inbox</a>
		</li>

		<li class="odd"><a href="sendbox.jsp" id="sendmail" tabindex="11">Sent
				Mail</a></li>

		<li class="odd"><a href="draft.jsp" id="draft" tabindex="12">Draft</a>
		</li>

		<li class="odd"><a href="trash.jsp" id="trash" tabindex="13">Trash</a>
		</li>

		<li class="odd"><a href="allmail.jsp" id="allmail" tabindex="14">All
				Mail</a></li>
	</ul>
</div>
<script src="js/leftcontent.js"></script>
<!--  
        <div class="title_box">Special Offers</div>
        <div class="border_box">
        <div class="product_title"></div>
        <div class="product_img"><img src="images/download.png" alt="" border="0" height="120" width="100" /></div>
        <div > <h3>Rs.1200</h3></div>
      </div>
      -->
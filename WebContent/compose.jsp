
<script type="text/javascript">
				function show_hide()
		         {
		                 dv = document.getElementById("move");
		                 dv1 = document.getElementById("move1");
		                 if (dv.style.display ==  '')
		                 { 
		                	 	dv.style.display = 'none';
		                	 	dv1.style.display = '';
		                 }
		                 else
		                 {
		                	 	dv1.style.display = 'none';
		                        dv.style.display = '';
		                 }
		         }
				window.onload = function() {
					dv = document.getElementById("move");
					dv1 = document.getElementById("move1");
					
					 if(dv.style.display ==  '' && dv1.style.display ==  'none')
	                 {
						 dv.style.display = '';
						 dv1.style.display = 'none';
	                 }
					 else if(dv.style.display ==  'none' && dv1.style.display ==  '')
					 {
						 dv.style.display = 'none';
						 dv1.style.display = '';
					 }
					 else if(dv.style.display ==  '' && dv1.style.display ==  '')
					 {
						 dv.style.display = 'none';
						 dv1.style.display = 'none';
					 }
				}
				
		</script>
<script>
				function refresh()
				{
					location.reload();
					session.setAttribute("msg", "Your message has been discarded.");
				}
		</script>
<!-- Strat of compose box -->
<div class="move" id="move">
	<div class="center_content12">
		<div class="center_title_bar12" onclick="show_hide()" id="minimize">New
			Message</div>
		<div class="contact_form12">
			<form method="post" action="compose" name="signupform"
				id="compose_form12">
				<input type="hidden" id="idval" name="id">
				<div class="form_row12">
					<input type="text" class="contact_input12" name="to" id="to"
						tabindex="1" placeholder="To" autofocus />
				</div>
				<div class="form_row12">
					<input type="text" class="contact_input12" name="subject"
						id="subject" tabindex="2" placeholder="Subject" />
				</div>
				<div class="form_row12">
					<textarea class="contact_textarea12" name="body" id="body"
						tabindex="3"></textarea>
				</div>
				<div class="sendbutton12">
					<button type="submit" id="sendemail" name="sendemail"
						class="styled-button-2" tabindex="4">Send</button>
					<button type="button" id="delete" name="delete"
						class="styled-button-3" tabindex="5" onclick="refresh();">Delete</button>
				</div>
				<br />
				<br />
			</form>
		</div>
	</div>
</div>
<div class="move1" id="move1">
	<div class="center_title_bar11" onclick="show_hide()" id="maximize">New
		Message</div>
</div>
<!-- end of compose box -->

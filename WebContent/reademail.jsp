<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.sun.speech.freetts.VoiceManager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
var second='body is can you help me';
var msg = new SpeechSynthesisUtterance();
var voices = window.speechSynthesis.getVoices();
msg.voice = voices[10]; // Note: some voices don't support altering params
msg.voiceURI = 'native';
msg.volume = 1; // 0 to 1
msg.rate = 0.8; // 0.1 to 10
msg.pitch = 1; //0 to 2
msg.text = 'You have this mail from sumit.gawade123@gmail.com'+second;
msg.lang = 'en-US';

msg.onend = function(e) {
  console.log('Finished in ' + event.elapsedTime + ' seconds.');
};

speechSynthesis.speak(msg);

</script>

<script type="text/javascript">
	var u = new SpeechSynthesisUtterance();
	u.text = 'Hello World';
	u.lang = 'en-US';
	u.rate = 1.2;
	u.onend = function(event) { alert('Finished in ' + event.elapsedTime + ' seconds.'); }
	speechSynthesis.speak(u);
</script>
</head>
<body>
	<p>sekfo[ fsef sfpks fspf[']]</p>
	<%
	name nm=new name();
	nm.fun();
%>
</body>
</html>
<% 
				    /*VoiceManager voiceManager = VoiceManager.getInstance();
				 	String voiceName = "kevin16";
				 	com.sun.speech.freetts.Voice helloVoice = voiceManager.getVoice(voiceName);
			        
				 	helloVoice.setRate(100f);
				 	helloVoice.allocate();
			        helloVoice.speak("hello sumit");
			        helloVoice.deallocate();*/

	       %>
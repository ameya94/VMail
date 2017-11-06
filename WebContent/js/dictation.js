//var myVar = setInterval(myTimer, 10000);
//function myTimer() {
//alert("Here");
//startfun();
//}

function startfun() {
	speech = new webkitSpeechRecognition();
	speech.continuous = true;
	speech.maxAlternatives = 5;
	speech.interimResults = false;
	speech.start();
}

var speech, final_transcript = "";
if (typeof (webkitSpeechRecognition) !== 'function') {
	document.getElementById("write").innerHTML = "We are sorry but Dictation requires the latest version of Google Chrome on your desktop.";
	document.getElementById("messages").style.display = "none";
} else {
	if (typeof (localStorage["language"]) == 'undefined') {
		var langs = [ [ "Afrikaans", "af-za", "--", "en-us" ] ];
		localStorage["language"] = 0;
	}

	if (typeof (localStorage["transcript"]) == 'undefined') {
		localStorage["transcript"] = "";
	}
	startfun();
	speech.onresult = function(e) {
		if (typeof (e.results) == 'undefined') {
			return;
		}
		for ( var i = e.resultIndex; i < e.results.length; ++i) {
			var val = e.results[i][0].transcript.replace(/\s/g, "");
			var focusedElement = document.activeElement;
			var tab = document.activeElement.tabIndex;
			var x = document.activeElement.tagName;
			if (x === "INPUT") {
				if (tab === 1 || tab === 2) {
					focusedElement.value = e.results[i][0].transcript;
				} else if (val === "male") {
					document.getElementById("male").click();
				} else if (val === "female") {
					document.getElementById("female").click();
				} else {
					focusedElement.value = val;
				}
			} else if (val === "forgotpassword") {
				document.getElementById("link-forgot-passwd").click();
			} else if (val === "createaccount") {
				document.getElementById("create").click();
			} else if (val === "help") {
				document.getElementById("help").click();
			} else if (x === "BUTTON") {
				if (val === "submit") {
					document.getElementById("forgotpass").click();
				} else {
					document.getElementById("signIn").click();
				}
			}
		}
	};
}
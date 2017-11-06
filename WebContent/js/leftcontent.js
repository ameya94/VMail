//var myVar = setInterval(myTimer, 100000);
//function myTimer() {
//alert("left Here");
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

			if (tab === -1 || tab === 0 || tab === 6 || tab === 7 || tab === 8
					|| tab === 9 || tab === 10 || tab === 11 || tab === 12
					|| tab === 13 || tab === 14 || tab === 15 || tab === 16) {
				if (val === "cancel") {
					var str = focusedElement.value;
					str1 = str.split(" ");
					var size = str1.length;
					if (size === 1) {
						focusedElement.value.value = "";
					} else {
						var last = str1[str1.length - 1];
						var newval = str.replace(" " + last, "");
						focusedElement.value = newval;
					}
				} else if (tab === 6) {
					var oldval = focusedElement.value;
					focusedElement.value = oldval + e.results[i][0].transcript;
				} else if (val === "compose") {
					document.getElementById("compose").click();
				} else if (val === "minimise") {
					document.getElementById("minimize").click();
				} else if (val === "maximize") {
					document.getElementById("maximize").click();
				} else if (val === "inbox") {
					location = "inbox.jsp";
				} else if (val === "sendmail") {
					location = "sendbox.jsp";
				} else if (val === "draft") {
					location = "draft.jsp";
				} else if (val === "trash") {
					location = "trash.jsp";
				} else if (val === "allmail") {
					location = "allmail.jsp";
				} else if (val === "send") {
					document.getElementById("signIn").click();
				} else if (val === "search") {
					document.getElementById("searchkey").click();
				} else if (val === "refresh") {
					document.getElementById("refresh").click();
				} else if (val === "help") {
					document.getElementById("help").click();
				} else if (val === "logout") {
					var ToEmailnew = document.getElementById("to").value;
					if (ToEmailnew === "") {
						document.getElementById("logout").click();
					} else {
						var Subjectnew = document.getElementById("subject").value;
						var body12new = document.getElementById("body").value;

						document.getElementById("to1").value = ToEmailnew;
						document.getElementById("subject1").value = Subjectnew;
						document.getElementById("body1").value = body12new;

						document.getElementById("logout").click();
					}
				} else if (val === "back") {
					var id = document.getElementsByClassName('myClassName')[0].id;

					if (id === "inbox") {
						location = "inbox.jsp";
					}
					if (id === "send") {
						location = "sendbox.jsp";
					}
					if (id === "draft") {
						location = "draft.jsp";
					}
					if (id === "trash") {
						location = "trash.jsp";
					}
					if (id === "allmail") {
						location = "allmail.jsp";
					}
					if (id === "search") {
						location = "search.jsp";
					}
				} else if (val === "logout") {
					var idnew = document.getElementById("id").value;
					var ToEmailnew = document.getElementById("ToEmail").value;
					var Subjectnew = document.getElementById("Subject").value;
					var body12new = document.getElementById("body12").value;

					document.getElementById("idval1").value = idnew;
					document.getElementById("to1").value = ToEmailnew;
					document.getElementById("subject1").value = Subjectnew;
					document.getElementById("body1").value = body12new;
				}
			} else if (tab === 1) {
				if (val === "cancel") {
					var currentval = focusedElement.value;
					var arr = currentval.split(",");
					arr.splice((arr.length - 2), 1);
					arr.join(",");
					focusedElement.value = arr;
				} else {
					var oldval = focusedElement.value;
					focusedElement.value = oldval + val + ", ";
				}
			} else if (tab === 2 || tab === 3) {
				if (val === "cancel") {
					var str = focusedElement.value;
					str1 = str.split(" ");
					var size = str1.length;
					if (size === 1) {
						focusedElement.value = "";
					} else {
						var last = str1[str1.length - 1];
						var newval = str.replace(" " + last, "");
						focusedElement.value = newval;
					}
				} else {
					var oldval = focusedElement.value;
					focusedElement.value = oldval + e.results[i][0].transcript;
				}
			} else if (tab === 4) {
				if (val === "send") {
					document.getElementById("sendemail").click();
				}
			} else if (tab === 5) {
				if (val === "delete") {
					document.getElementById("delete").click();
				}
			} else {
				if (val === "open") {
					var page = document.getElementsByClassName('pagename')[0].id;
					if (page === "draft") {
						dv = document.getElementById("move");
						dv.style.display = '';

						var end = document.getElementById("tabend").value;
						var count = document.getElementById("count").value;
						for ( var i = end - 1; i < count; i++) {
							if (tab === i) {
								var id = document.getElementById("id" + i).value;
								var ToEmail = document.getElementById("ToEmail"
										+ i).value;
								var Subject = document.getElementById("Subject"
										+ i).value;
								var body12 = document.getElementById("body12"
										+ i).value;

								document.getElementById("idval").value = id;
								document.getElementById("to").value = ToEmail;
								document.getElementById("subject").value = Subject;
								document.getElementById("body").value = body12;
							}
						}
					} else {
						var end = document.getElementById("tabend").value;
						var count = document.getElementById("count").value;
						for ( var i = end - 1; i < count; i++) {
							if (tab === i) {
								document.getElementById("open" + i).click();
							}
						}
					}
				}
				if (val === "delete") {
					var id = document.getElementById("id").value;
					var end = document.getElementById("tabend").value;
					var count = document.getElementById("count").value;
					for ( var i = end - 1; i < count; i++) {
						var page = document.getElementsByClassName('pagename')[0].id;
						if (tab === i) {
							location = "delete.jsp?name=" + page + "&id=" + id;
						}
						;
					}
					;
				}
			}
			;
		}
		;
	};
};
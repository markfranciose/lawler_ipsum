document.addEventListener("DOMContentLoaded", function(){
	let generateButton = document.getElementById("generate-button");
	let showBox = document.getElementById("show-box");
	let copyButton = document.getElementById("copy-button");

	generateButton.addEventListener("click", function(){
		let xhr = new XMLHttpRequest();
		let selected = document.querySelector("input[name='which-text']:checked").value
		
		// return 1 para or sent if no number chosen
		let number = document.getElementById(selected + '-number').value || "1" 
		// return 1 para or sent if non-num chars entered
		if ( (/\D/).test(number) ) {
			number = "1"; 
		}
			
		xhr.open('GET', '/' + selected + '/' + number);
		xhr.send(null);
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4) {
				showBox.value = xhr.responseText;
			}	
		}
	})

	copyButton.addEventListener("click", function(){
		showBox.select()	
		document.execCommand('copy')
		// unselect text 
		window.getSelection().removeAllRanges();
	})


})

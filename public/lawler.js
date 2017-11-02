document.addEventListener("DOMContentLoaded", function(){
	let generateButton = document.getElementById("generate-button");
	let showBox = document.getElementById("show-box");
	let copyButton = document.getElementById("copy-button")	

	generateButton.addEventListener("click", function(){
		console.log("OK, now this works");
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/text');
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

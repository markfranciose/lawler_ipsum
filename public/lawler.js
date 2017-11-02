document.addEventListener("DOMContentLoaded", function(){
	let generateButton = document.getElementById("generate-button");
	let showBox = document.getElementById("show-box");
	let copyButton = document.getElementById("copy-button")	

	generateButton.addEventListener("click", function(){
		let xhr = new XMLHttpRequest();
		let test = document.getElementById('test').value
		xhr.open('GET', '/paragraphs/' + test);
		xhr.send(null);
		xhr.onreadystatechange = function() {
		if (xhr.readyState === 4) {
			showBox.value = xhr.responseText;
			console.log("We in here!");
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

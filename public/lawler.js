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

	// selecting and displaying only sentence or paragraph
	let sentenceButton = document.getElementById("sentences-radio");
	let sentenceNumber = document.getElementById("sentences-number");
	let paragraphButton = document.getElementById("paragraphs-radio");
	let paragraphNumber = document.getElementById("paragraphs-number")
	
	sentenceButton.addEventListener("click", function() {
		paragraphNumber.value = "";
	})
	
	sentenceNumber.addEventListener("click", function() {
		sentenceButton.checked = true;
		paragraphNumber.value = "";
	})

	paragraphButton.addEventListener("click", function() {
		sentenceNumber.value = "";
	})

	paragraphNumber.addEventListener("click", function() {
		paragraphButton.checked = true;
		sentenceNumber.value = "";
	})


})

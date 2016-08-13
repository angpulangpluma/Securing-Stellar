function fill_star(star, r, g, b) {
	star.style.color = "rgb(" + r + "," + g + "," + b + ")";
	star.innerHTML = "&#9733";
}

function unfill_star(star) {
	star.style.color = "#AAAAAA";
	star.innerHTML = "&#9734";
}

function checkTitle() {
	var title = document.getElementById("postTitle");

	if(title.value.replace(/ /g, '') == "") {
		title.style.backgroundColor = "rgb(72, 0, 72)";
		title.setAttribute("placeholder", "Title should not be empty");
	}
	else {
		title.style.backgroundColor = "rgb(255, 255, 255)";
		title.setAttribute("placeholder", "Enter a title");	
	}
}

function checkTopic() {
	var text = document.getElementById("userpost");

	if(text.value.replace(/ /g, '') == "") {
		text.style.backgroundColor = "rgb(72, 0, 72)";
		text.setAttribute("placeholder", "Topic should not be empty");
	}
	else {
		text.style.backgroundColor = "rgb(255, 255, 255)";
		text.setAttribute("placeholder", "Topic a title");	
	}
}
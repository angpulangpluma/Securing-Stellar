function fill_star(star, r, g, b) {
	star.style.color = "rgb(" + r + "," + g + "," + b + ")";
	star.innerHTML = "&#9733";
}

function unfill_star(star) {
	star.style.color = "#AAAAAA";
	star.innerHTML = "&#9734";
}

function prefill_stars(rating, topicNum) {
	console.log("Prefill with: " + rating);
	
	var star1 = document.getElementById("rate1_" + topicNum);
	var star2 = document.getElementById("rate2_" + topicNum);
	var star3 = document.getElementById("rate3_" + topicNum);
	var star4 = document.getElementById("rate4_" + topicNum);
	var star5 = document.getElementById("rate5_" + topicNum);
	
	if(rating == 1) {
		fill_star(star5, 48, 0, 48);
	}
	else if(rating == 2) {
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
	else if(rating == 3) {
		fill_star(star3, 96, 24, 72);
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
	else if(rating == 4) {
		fill_star(star2, 192, 72, 72);
		fill_star(star3, 96, 24, 72);
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
	else if(rating == 5) {
		fill_star(star1, 240, 114, 65);
		fill_star(star2, 192, 72, 72);
		fill_star(star3, 96, 24, 72);
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
}

function rateTopic1(topicNum) {
	var rateForm = document.getElementById("rateForm-" + topicNum);
	
	var star1 = document.getElementById("rate1_" + topicNum);
	var star2 = document.getElementById("rate2_" + topicNum);
	var star3 = document.getElementById("rate3_" + topicNum);
	var star4 = document.getElementById("rate4_" + topicNum);
	var star5 = document.getElementById("rate5_" + topicNum);
	
	if(String(star1.style.color) == String("rgb(240, 114, 65)")) {
		unfill_star(star1);
	}
	else if(String(star1.style.color) == String("rgb(170, 170, 170)") ||
			   String(star1.style.color) == "") {
		fill_star(star1, 240, 114, 65);
		fill_star(star2, 192, 72, 72);
		fill_star(star3, 96, 24, 72);
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
}

function rateTopic2(topicNum) {
	var star1 = document.getElementById("rate1_" + topicNum);
	var star2 = document.getElementById("rate2_" + topicNum);
	var star3 = document.getElementById("rate3_" + topicNum);
	var star4 = document.getElementById("rate4_" + topicNum);
	var star5 = document.getElementById("rate5_" + topicNum);
	
	unfill_star(star1);
	
	if(String(star2.style.color) == String("rgb(192, 72, 72)")) {
		unfill_star(star2);
	}
	else if(String(star2.style.color) == String("rgb(170, 170, 170)") ||
			   String(star2.style.color) == "") {
		fill_star(star2, 192, 72, 72);
		fill_star(star3, 96, 24, 72);
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
	
}

function rateTopic3(topicNum) {
	var star1 = document.getElementById("rate1_" + topicNum);
	var star2 = document.getElementById("rate2_" + topicNum);
	var star3 = document.getElementById("rate3_" + topicNum);
	var star4 = document.getElementById("rate4_" + topicNum);
	var star5 = document.getElementById("rate5_" + topicNum);
	
	unfill_star(star1);
	unfill_star(star2);
	
	if(String(star3.style.color) == String("rgb(96, 24, 72)")) {
		unfill_star(star3);
	}
	else if(String(star3.style.color) == String("rgb(170, 170, 170)") ||
			   String(star3.style.color) == "") {
		fill_star(star3, 96, 24, 72);
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
	
}

function rateTopic4(topicNum) {
	var star1 = document.getElementById("rate1_" + topicNum);
	var star2 = document.getElementById("rate2_" + topicNum);
	var star3 = document.getElementById("rate3_" + topicNum);
	var star4 = document.getElementById("rate4_" + topicNum);
	var star5 = document.getElementById("rate5_" + topicNum);
	
	unfill_star(star1);
	unfill_star(star2);
	unfill_star(star3);
	
	if(String(star4.style.color) == String("rgb(72, 0, 72)")) {
		unfill_star(star4);
	}
	else if(String(star4.style.color) == String("rgb(170, 170, 170)") ||
			   String(star4.style.color) == "") {
		fill_star(star4, 72, 0, 72);
		fill_star(star5, 48, 0, 48);
	}
	
}

function rateTopic5(topicNum) {
	var star1 = document.getElementById("rate1_" + topicNum);
	var star2 = document.getElementById("rate2_" + topicNum);
	var star3 = document.getElementById("rate3_" + topicNum);
	var star4 = document.getElementById("rate4_" + topicNum);
	var star5 = document.getElementById("rate5_" + topicNum);
	
	unfill_star(star1);
	unfill_star(star2);
	unfill_star(star3);
	unfill_star(star4);
	
	if(String(star5.style.color) == String("rgb(48, 0, 48)")) {
		unfill_star(star5);
	}
	else if(String(star5.style.color) == String("rgb(170, 170, 170)") ||
			   String(star5.style.color) == "") {
		fill_star(star5, 48, 0, 48);
	}
}
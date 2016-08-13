<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>STELLAR | Main</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<link rel="stylesheet" type="text/css" href="menubar.css">

	<script src="jquery-3.0.0.min.js"></script>
	<script type="text/javascript" src="main.js"></script>
</head>
<body>
	<div id="radio-navigation">
		<input type="radio" id="radio1" name="radios" value="1" checked>
	    <label for="radio1"></label>

		<input type="radio" id="radio2" name="radios" value="2">
	    <label for="radio2"></label>

		<input type="radio" id="radio3" name="radios" value="3">
	    <label for="radio3"></label>

		<input type="radio" id="radio4" name="radios" value="4">
		<label for="radio4"></label>
		
		<input type="radio" id="radio5" name="radios" value="5">
		<label for="radio5"></label>
	</div>


	<div id="menuBar">
		<button id="btn-login">LOGIN</button>
		<button id="btn-register">REGISTER</button>
	</div>
	

	<div id="main-pages">
		<div id="main-page1">
			<div id="box-posts">
				<div id="box-post1">
				</div>

				<div id="box-post2">
				</div>

				<div id="box-post3">
				</div>

				<div id="box-post4">				
				</div>

				<div id="box-post5">
				</div>
			</div>
			<!-- Title Page Text and subtext -->
			<div id="stellar-title">
				Stellar
			</div>
			<div id="stellar-tagline">
				One in a billion
			</div>
			<!-- Learn more button -->
			<button id="stellar-learn">Learn More</button>
		</div>

		<div id="main-page2">
			<div id="box-postContent">
				<textarea id="newPost" maxlength="200" placeholder="Write a topic..."></textarea>
				<button id="post">Post</button>
				<div id="box-postContent-shadow"></div>
			</div>
			
			<div id="box-postContainer">
				<div class="box-post">
					<div class="box-postProfPic"></div>
					<textarea style="top: 5%; overflow-y: hidden;" readonly="true"></textarea>
					<div class="rating">
						<span class="rate1">&#9734;</span><span class="rate2">&#9734;</span><span class="rate3">&#9734;</span><span class="rate4">&#9734;</span><span class="rate5">&#9734;</span>
					</div>
				</div>

				<div class="box-post">
					<div class="box-postProfPic"></div>
					<textarea style="top: 27.75%; overflow-y: hidden;" readonly="true"></textarea>
					<div class="rating">
						<span class="rate1">&#9734;</span><span class="rate2">&#9734;</span><span class="rate3">&#9734;</span><span class="rate4">&#9734;</span><span class="rate5">&#9734;</span>
					</div>
				</div>
			</div>
			<!-- Here goes page 2 post; 'simple to use one' liner -->
			<div id="main-page2-text">
				Reaching the stars is not as far as you think!<br /><br /> Give it a
			</div>
			<div id="main-page2-try">
				TRY!
			</div>
		</div>

		<div id="main-page3">
			<img id="img-page3-3" src="main4.png">
			<img id="img-page3-2" src="main3.png">
			<img id="img-page3-1" src="main2.png">
			
			<!-- For one liners about rating -->
			<div id="main-page3-text1">
				Gain more STARLIGHT
			</div>
			<div id="main-page3-text2">
				Grow more
			</div>
			<div id="main-page3-text3">
				STARSHINE
			</div>
		</div>

		<div id="main-page4">
			<div id="box-page4-1"></div>
			<div id="box-ranking">
				<h1>RANKING</h1>

				<div id="box-ranking1">
				</div>

				<div id="box-ranking2">
				</div>

				<div id="box-ranking3">
				</div>

				<div id="box-ranking4">
				</div>
			</div>

			<div id="box-suggested">
				<h1>SUGGESTED</h1>
				<div id="box-suggestions">
					<div id="box-suggested1">
					</div>
					<div id="box-suggested2">
					</div>
					<div id="box-suggested3">
					</div>
					<div id="box-suggested4">
					</div>
					<div id="box-suggested5">
					</div>
				</div>
			</div>
			
			<!-- Here goes 'try to get rankings' one liners -->
			<div id="main-page4-text">
				Be the brightest among the rest
			</div>
			
			<div id="main-page4-text2">
				Prove you're not just a twinkling star
			</div>
		</div>

		<div id="main-page5">
			<div id="box-page5-1">
				<div id="box-page5-1-text">
					<!-- Buttons for linking miscellanous pages, etc. -->
					<a>Website</a>
					<a>Contact Us</a>
					<a>Partners</a>
					<button id="about">About</button>
					<button id="credits">Credits</button>
					<button id="developers">Developers</button>
					<button id="google">Google</button>
					<button id="facebook">Facebook</button>
					<button id="instagram">Instagram</button>
				</div>
			</div>
			<div id="box-page5-about">
				<!-- <p><b>About</b><br /> -->
				<br>
				<center>Stellar is Stellar.</center></p>
			</div>
			<div id="box-page5-credits">
				<p><b>Credits</b><br />
				We would like to thank our WEBAPDE Professor, Mr. Emerico Aguilar, for teaching us the fundamental knowledge and skills in making this website.
				</p>
			</div>
			<div id="box-page5-developers">
				<p><b>Developers</b><br />
				Der-Der Dev<br /><br />
				ESPULGAR, Candy Joyce<br />
				RAMOS, Kiersten Gyra<br />
				OBEDOZA, Jarl Brent</p>
			</div>
		</div>
	</div>

	
	
</body>
</html>
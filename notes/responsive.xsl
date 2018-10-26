responsive

<entry [Thu 2014:03:27 11:55:09 EST] CCS TO REFORMAT WIDE TABLE>

http://css-tricks.com/examples/ResponsiveTables/responsive.php

SAVED TO:

/home/syoung/notes/agua/private/html/test/responsive/wide-table.html



<!DOCTYPE html>
<html>

<head>
	<meta charset='UTF-8'>
	
	<title>Responsive Table</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="css/style.css">
	
	<!--[if !IE]><!-->
	<style>
	
	/* 
	Max width before this PARTICULAR table gets nasty
	This query will take effect for any screen smaller than 760px
	and also iPads specifically.
	*/
	@media 
	only screen and (max-width: 760px),
	(min-device-width: 768px) and (max-device-width: 1024px)  {
	
		/* Force table to not be like tables anymore */
		table, thead, tbody, th, td, tr { 
			display: block; 
		}
		
		/* Hide table headers (but not display: none;, for accessibility) */
		thead tr { 
			position: absolute;
			top: -9999px;
			left: -9999px;
		}
		
		tr { border: 1px solid #ccc; }
		
		td { 
			/* Behave  like a "row" */
			border: none;
			border-bottom: 1px solid #eee; 
			position: relative;
			padding-left: 50%; 
		}
		
		td:before { 
			/* Now like a table header */
			position: absolute;
			/* Top/left values mimic padding */
			top: 6px;
			left: 6px;
			width: 45%; 
			padding-right: 10px; 
			white-space: nowrap;
		}
		
		/*
		Label the data
		*/
		td:nth-of-type(1):before { content: "First Name"; }
		td:nth-of-type(2):before { content: "Last Name"; }
		td:nth-of-type(3):before { content: "Job Title"; }
		td:nth-of-type(4):before { content: "Favorite Color"; }
		td:nth-of-type(5):before { content: "Wars of Trek?"; }
		td:nth-of-type(6):before { content: "Porn Name"; }
		td:nth-of-type(7):before { content: "Date of Birth"; }
		td:nth-of-type(8):before { content: "Dream Vacation City"; }
		td:nth-of-type(9):before { content: "GPA"; }
		td:nth-of-type(10):before { content: "Arbitrary Data"; }
	}
	
	/* Smartphones (portrait and landscape) ----------- */
	@media only screen
	and (min-device-width : 320px)
	and (max-device-width : 480px) {
		body { 
			padding: 0; 
			margin: 0; 
			width: 320px; }
		}
	
	/* iPads (portrait and landscape) ----------- */
	@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) {
		body { 
			width: 495px; 
		}
	}
	
	</style>
	<!--<![endif]-->

</head>

<body>

<div id="demo-top-bar">

  <div id="demo-bar-inside">

    <h2 id="demo-bar-badge">
      <a href="/">CSS-Tricks Example</a>
    </h2>

    <div id="demo-bar-buttons">
      <a class='header-button' href='/9096-responsive-data-tables/'>&larr; Back to Article</a> <a class='header-button' href='/examples/'>More Demos &rarr;</a>    </div>

    <div id="demo-bar-ad">
      <div id="bsap_1255488" class="bsarocks bsap_3469a2a501a9e18091036aa0c89f9dcb"></div>
      <a href="http://adpacks.com" id="bsap_aplink">via Ad Packs</a>
    </div>

  </div>

</div>
	<div id="page-wrap">

	<h1>Responsive Table</h1>
  
	<p>Go to <a href="index.php">Non-Responsive Table</a></p>
    
	<p>This is the exact same table, only has @media queries applied to is so that when the screen is too narrow, it reformats (via only CSS) to make each row a bit like it's own table. This makes for much more repetition and vertical space needed, but it fits within the horizontal space, so only natural vertical scrolling is needed to explore the data.</p>
    
	<table>
		<thead>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Job Title</th>
			<th>Favorite Color</th>
			<th>Wars or Trek?</th>
			<th>Porn Name</th>
			<th>Date of Birth</th>
			<th>Dream Vacation City</th>
			<th>GPA</th>
			<th>Arbitrary Data</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>James</td>
			<td>Matman</td>
			<td>Chief Sandwich Eater</td>
			<td>Lettuce Green</td>
			<td>Trek</td>
			<td>Digby Green</td>
			<td>January 13, 1979</td>
			<td>Gotham City</td>
			<td>3.1</td>
			<td>RBX-12</td>
		</tr>
		<tr>
		  <td>The</td>
		  <td>Tick</td>
		  <td>Crimefighter Sorta</td>
		  <td>Blue</td>
		  <td>Wars</td>
		  <td>John Smith</td>
		  <td>July 19, 1968</td>
		  <td>Athens</td>
		  <td>N/A</td>
		  <td>Edlund, Ben (July 1996).</td>
		</tr>
		<tr>
		  <td>Jokey</td>
		  <td>Smurf</td>
		  <td>Giving Exploding Presents</td>
		  <td>Smurflow</td>
		  <td>Smurf</td>
		  <td>Smurflane Smurfmutt</td>
		  <td>Smurfuary Smurfteenth, 1945</td>
		  <td>New Smurf City</td>
		  <td>4.Smurf</td>
		  <td>One</td>
		</tr>
		<tr>
		  <td>Cindy</td>
		  <td>Beyler</td>
		  <td>Sales Representative</td>
		  <td>Red</td>
		  <td>Wars</td>
		  <td>Lori Quivey</td>
		  <td>July 5, 1956</td>
		  <td>Paris</td>
		  <td>3.4</td>
		  <td>3451</td>
		</tr>
		<tr>
		  <td>Captain</td>
		  <td>Cool</td>
		  <td>Tree Crusher</td>
		  <td>Blue</td>
		  <td>Wars</td>
		  <td>Steve 42nd</td>
		  <td>December 13, 1982</td>
		  <td>Las Vegas</td>
		  <td>1.9</td>
		  <td>Under the couch</td>
		</tr>
		</tbody>
	</table>
	
	</div>
	
 <style type="text/css" style="display: none !important;">
	* {
		margin: 0;
		padding: 0;
	}
	body {
		overflow-x: hidden;
	}
	.bsa_it_ad {
		padding: 8px 4px 8px 12px !important;
		position: relative;
		border: 0 !important;
		background: #D6D5D5 !important;
		border-top: 0 !important;
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
		font: 11px "Lucida Grande", Sans-Serif !important;
	}
	.bsa_it_ad:before, .bsa_it_ad:after {
		content: "";
		position: absolute;
		top: 0;
		left: 6px;
		width: 100%;
		height: 100%;
		background: #989898;
		border-bottom: 6px solid #989898;
		z-index: -1;
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.bsa_it_ad:before {
		top: 0;
		left: 12px;
		z-index: -2;
		background: #6C6666;
		border-bottom: 12px solid #6C6666;
	}

	.bsa_it_ad a {
	  margin: 0 !important;
		padding: 0 !important;
	}
	.bsa_it_ad a img {
	  border: 0 !important;
		position: static !important;
	}
	.bsa_it_ad a:hover img {
		margin: 0 !important;
	}
	.bsa_it_ad a:hover {
	  background: none !important;
	}
	.bsa_it_i {
		margin: 0 15px 0 0 !important;
	}
	.bsa_it_t {
		font-size: 14px !important;
		margin: 12px 0 0 0 !important;
	}
	.bsa_it_d {
		padding-right: 10px;
	}
	.bsa_it_p{
		display: none !important;
	}
	#demo-bar-ad {
		width: 416px;
		position: absolute;
		right: 0;
		top: -20px;
		font: 11px "Lucida Grande", Sans-Serif !important;
	}
	#bsap_aplink {
		position: absolute;
		color: #999;
		text-decoration: none;
		bottom: 8px !important;
		right: 8px !important;
		padding: 0 !important;
	}
	.bsa_it_p a:hover {
		background:none !important;
	}
	#demo-top-bar {
		text-align: left;
		background: #e18728;
		position: relative;
		zoom: 1;
		width: 100% !important;
		z-index: 6000;
		box-shadow: 0 0 10px black;
		padding: 20px 0 15px;
	}
	#demo-bar-inside {
		width: 960px;
		margin: 0 auto;
		position: relative;
	}
	#demo-top-bar:before, #demo-top-bar:after {
		content: "";
		position: absolute;
		top: 0;
		left: 6px;
		width: 100%;
		height: 100%;
		background: #e18728;
		border-bottom: 6px solid #8F5314;
		z-index: -1;
		box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
	}
	#demo-top-bar:before {
		top: 0;
		left: 12px;
		background: #6C6666;
		border-bottom: 12px solid #62390E;
	}

	#demo-bar-buttons {
		display: inline-block;
		width: 236px;
		text-align: center;
		vertical-align: top;
		font-size: 0;
	}
	#demo-bar-buttons a {
		font-size: 12px;
		color: white;
		display: block;
		margin: 2px 0;
		text-decoration: none;
		font: 14px "Lucida Grande", Sans-Serif !important;
	}
	#demo-bar-buttons a:hover,
	#demo-bar-buttons a:focus {
		color: #333;
	}

	#demo-bar-badge {
		display: inline-block;
		width: 302px;
		padding: 0 !important;
		margin: 0 !important;
		background-color: transparent !important;
	}
	#demo-bar-badge a {
		display: block;
		width: 100%;
		height: 38px;
		border-radius: 0;
		bottom: auto;
		margin: 0;
		background: url(/images/examples-logo.png) no-repeat;
		background-size: 100%;
		overflow: hidden;
		text-indent: -9999px;
	}
	#demo-bar-badge:before, #demo-bar-badge:after {
		display: none !important;
	}
</style>

<script type="text/javascript">
	(function(){ var bsa = document.createElement('script'); bsa.type = 'text/javascript'; bsa.async = true; bsa.src = '//s3.buysellads.com/ac/bsa.js'; (document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa); })();
</script>

<script type="text/javascript">
	var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-68528-29']); _gaq.push(['_trackPageview']); (function() { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(ga); })();
</script>	
</body>

</html>

</entry>
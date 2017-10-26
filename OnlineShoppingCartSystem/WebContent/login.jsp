<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oscs.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Smartcart online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="themes/bootshop/bootstrap.min.css" media="screen" />
<link href="themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 100px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	padding: 12px 16px;
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.forward();
	}
</SCRIPT>

</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">


	<!-- java -->


	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">Welcome!</div>
				<div class="span6"></div>
			</div>
			<% if((String)session.getAttribute("uname")!=null)
						{
						out.println("<script> alert('User is already Logged In!');location.href='index.jsp';</script>");
						}
						else{%>
			<!-- Navbar ================================================== -->
			<div class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.jsp"><img src="images/cart.jpg"
						style="height: 100%; width: 90px;" alt="smartcart" /></a>
					<ul id="topMenu" style="text-align: right; margin-top: 15px;">

						<li class="dropdown" style="color: white;">
							<%
								if (session.getAttribute("uname") != null) {
							%> <%
 	out.println("Hi!, " + session.getAttribute("uname"));
 %>
							<div class="dropdown-content">
								<a href="MyAccount.jsp"><p
										style="text-align: left; color: black;">My Account</p></a><a
									href="LogOutServlet"><p
										style="text-align: left; color: black;">Log Out</p></a>
							</div> <%
 	} else {
 %> Guest
							<div class="dropdown-content">
								<a href="register.jsp"><p
										style="text-align: left; color: black;">Sign Up</p></a><a
									href="login.jsp"><p style="text-align: left; color: black;">Log
										In</p></a>
							</div> <%
 	}
 %>
						</li>
						<li class="nav pull-right"">&nbsp; &nbsp;<a
							href="contact.jsp" style="color: white">Contact</a></li>


					</ul>

				</div>
			</div>
		</div>
	</div>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">

				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li class="active">Login</li>
					</ul>
					<h3>Login</h3>
					<hr class="soft" />
					<div class="row">
						<div class="span4">
							<div class="well">
								<h5>CREATE YOUR ACCOUNT</h5>
								<br />
								<form action="register.jsp">
									<div class="controls">
										<button type="submit" class="btn block">Register</button>
									</div>
								</form>
							</div>
						</div>
						<div class="span1">&nbsp;</div>
						<div class="span4">
							<div class="well">
								<h5>ALREADY REGISTERED ?</h5>


								<form action="LogInServletPath" method="POST">


									<div class="control-group">
										<label class="control-label" for="username">User Name</label>
										<div class="controls">
											<input class="span3" type="text" id="username"
												name="username" placeholder="Enter User Name">
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="inputPassword1">Password</label>
										<div class="controls">
											<input type="password" class="span3" id="inputPassword1"
												name="inputPassword1" placeholder="Password">
										</div>
									</div>
									<div class="control-group">
										<div class="controls">
											<button type="submit" class="btn">Sign in</button>
											<a href="forgetpass.html">Forgot password?</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="MyAccount.jsp">YOUR ACCOUNT</a> <a href="Profile.jsp">PERSONAL
						INFORMATION</a> <a href="Address.jsp">ADDRESSES</a> <a
						href="Orders.jsp">ORDER HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.jsp">CONTACT</a> <a href="legal_notice.jsp">LEGAL
						NOTICE</a> <a href="tac.jsp">TERMS AND CONDITIONS</a> <a
						href="faq.jsp">FAQ</a>
				</div>

				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="https://www.facebook.com/"><img width="60" height="60"
						src="themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a href="https://www.twitter.com/"><img width="60" height="60"
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a> <a
						href="https://www.youtube.com/"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; Smartcart</p>
		</div>
		<!-- Container End -->
	</div>
	<%} %>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>
</body>
</html>
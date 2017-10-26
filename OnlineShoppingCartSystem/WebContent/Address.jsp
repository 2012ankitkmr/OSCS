<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oscs.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Smartcart online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


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
</head>
<body>


	<!-- java -->


	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">Welcome!</div>
				<div class="span6"></div>
			</div>
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
								if (session.getAttribute("uname") == null) {

									out.println("<script>alert('Please do login first');location.href='login.jsp';</script>");
							%>
							Guest
							<div class="dropdown-content">
								<a href="register.jsp"><p
										style="text-align: left; color: black;">Sign Up</p></a><a
									href="login.jsp"><p style="text-align: left; color: black;">Log
										In</p></a>
							</div> <%
 	} else {
 		out.println("Hi!, " + session.getAttribute("uname"));
 %>
							<div class="dropdown-content">
								<a href="MyAccount.jsp"><p
										style="text-align: left; color: black;">My Account</p></a><a
									href="LogOutServlet"><p
										style="text-align: left; color: black;">Log Out</p></a>
							</div>

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
						<li class="active">Address</li>
					</ul>

					<%!ArrayList<String> address = new ArrayList<String>();%>
					<%
						JDBCCon dj = new JDBCCon();
							address = dj.fetchAddress((String)session.getAttribute("uname"));
							if(address.size()!=0)
							{
					%>

					<h3>Your Addresses</h3>
					<hr class="soft" />
					<div class="row">
						<div class="span4">
							<div class="well">
								<h5>HOME ADDRESS</h5>
								<div class="controls">
									<%=address.get(0)%>
									<hr>
									<br />
								</div>

							</div>
						</div>
						<div class="span1">&nbsp;</div>
						<div class="span4">
							<div class="well">
								<h5>SHIPPING ADDRESS</h5>
								<div class="controls">
									<%
										if (address.size() <= 1) {
									%>
									<%=address.get(0)%>
									<%
										} else {
									%>
									<%
									Set<String> Addr_Set = new HashSet<String>();
										for (int i = 1; i < address.size(); i++) {
											Addr_Set.add(address.get(i));											
										}
										
										  Iterator<String> itr=Addr_Set.iterator();  
										
										  
										  while(itr.hasNext()){  
									%>
									<%
									
									out.print(itr.next());
									
									%>
									<hr>
									<br />
									<%
										}
											}
							}
							else
							{
								out.print("<font color:red><h3>No Addresses Found</h3></font>");
							}
									%>
								</div>
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
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

	<% } %>
</body>
</html>
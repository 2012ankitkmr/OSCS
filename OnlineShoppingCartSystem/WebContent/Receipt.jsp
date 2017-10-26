<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="oscs.*"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					<strong> </strong>
				</div>
				<div class="span6">
					<div class="pull-right"></div>
				</div>
			</div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.jsp"><img src="images/cart.jpg"
						style="height: 100%; width: 90px;" alt="smartcart" /></a>
					<ul id="topMenu" style="text-align: right">

						<li class="dropdown" style="color: white; margin-top: 15px;">
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
			<%
				String[] Parameters = URLDecoder.decode(request.getQueryString(),
						"UTF-8").split("@");
				session.setAttribute("uname", (Parameters[0].split("="))[1]);

				if (Parameters[1] != null) {
					if (Parameters[1].equals("status=1")) {
						String uname = (String) session.getAttribute("uname");
						JDBCCon dj = new JDBCCon();
						dj.delete_ItemFromCart(uname);
						out.print("<h1>THANK YOU FOR SHOPPING WITH US:)</h1><hr class=soften /><div class=accordion id=accordion2><div class=accordion-group><div class=accordion-heading><h4>Congratulations!! You have placed your Order Successfully.</h4></div>");
						ArrayList<String> info = new ArrayList<String>();

						JDBCCon djj = new JDBCCon();
						info = djj.displayReceipt(uname); // UserName Spliting 

						System.out.println(info.size() + uname);
						for (int i = 0; i < info.size(); i++) {
							out.print("<div class=accordion-inner>Your order id is <b>"
									+ info.get(i++)
									+ "</b><br> Product Name is <b>"
									+ info.get(i++)
									+ "</b><br> Quantity is <b>"
									+ info.get(i++)
									+ "</b><br />Your order amount is <b>Rs."
									+ info.get(i++)
									+ "</b><br> Your order date is <b>"
									+ info.get(i) + "</b></div>");
						}
					}

					else
						out.print("<h3><Font color=blue>Payment Unsuccessfull!! Please Try Again!!</Font></h3><form action='payment.jsp'><button type=submit value=RevisePayment>Revise</button></form>");
				} else
					out.print("<h3><Font color=red>Please Buy a Product First!!</Font></h3><form action='index.jsp'><button type=submit value=GotoHomepage]>Go To Homepage</button></form>");
				out.println("</div></div><div style=' text-align:center' ><form action='index.jsp' ><input  style=' text-decoration:none;border:none; background-color:green;color:white; padding:8px 8px;'  type='submit' value='HomePage' /></form>");
				if (Parameters[1].equals("status=1")) 
				out.print("<form action='invoice.jsp'><input type='submit' style=' text-decoration:none;border:none; background-color:Green;color:white; padding:8px 8px;' value='Print' /></form>");
				
				out.print("</div>");
			%>


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
						src="themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a href="https://www.youtube.com/"><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

</body>
</html>
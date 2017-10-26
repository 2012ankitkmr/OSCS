<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="oscs.*"%>

<%@page import="com.containers.Products_container"%>
<%@page import="com.containers.Cart_details_container"%>
<%@page import="com.containers.category_Container"%>
<%@page import="com.containers.department_Container"%>
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
</head>
<body>

	<!-- java code -->
	<%!ArrayList<String> al = new ArrayList<String>();%>
	<%
		JDBCCon dj = new JDBCCon();

		al = dj.displayOrders((String) session.getAttribute("uname"));
	%>
	<!--   -->
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome!<strong> <%=(String) session.getAttribute("uname")%></strong>
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
					<a class="brand" href="index.jsp"><img img
						src="images/cart.jpg" style="height: 100%; width: 90px;"
						alt="smartcart" /></a>
					<form class="form-inline navbar-search" method="get"
						action="Products1.jsp">
						<input id="srchFld" class="srchTxt" style="text-align: right;"
							name="pro_name" type="text" /> <select class="srchTxt"
							name="search_type">
							<option value="ALL">ALL</option>
							<option value="D001">ELECTRONICS</option>
							<option value="D003">HEALTH & BEAUTY</option>
							<option value="D002">CLOTHES</option>
							<option value="D004">SPORTS & LEISURE</option>
						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
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
			<h1>ORDER HISTORY</h1>
			<hr class="soften" />
			<div class="accordion" id="accordion2">
				<div class="accordion-group">
					<div class="accordion-heading">
						<h4>
							<a class="accordion-toggle collapsed" data-toggle="collapse"
								data-parent="#accordion2" href="#collapseOne"> Order Details
							</a>
						</h4>
					</div>
					<div id="collapseOne" class="accordion-body collapse">
						<div class="accordion-inner">

							<table style="width: 100%" border='2'>

								<thead>
									<tr>
										<th>Order Id</th>
										<th>Product Name</th>
										<th>Price</th>
										<th>Quantity</th>
										<th>Total amount</th>
										<th>Order date</th>
										<th>Address</th>
										<th>Order Status</th>
									</tr>
								</thead>
								<tbody>

									<%!double tot = 0.0;%>
									<%
										if (al.size() == 0)
												out.print("<Font color='Black'><h3>You have No Orders!!!</h3></Font>");
									%>
									<%
										for (int i = 0; i < al.size(); i++) {
									%>

									<%
										if (i % 8 == 0) {
									%>
									<tr>
										<td><%=al.get(i)%></td>
										<%
											}
										%>
										<%
											if (i % 8 == 1) {
										%>
										<td><%=al.get(i)%></td>
										<%
											}
										%>

										<%
											if (i % 8 == 2) {
										%>
										<td>Rs.<span> <%=al.get(i)%>
										</span></td>
										<%
											}
										%>
										<%
											if (i % 8 == 3) {
										%>
										<td><%=al.get(i)%></td>
										<%
											}
										%>

										<%
											if (i % 8 == 4) {
										%>
										<%
											tot = tot + Double.parseDouble(al.get(i));
										%>
										<td>Rs.<span> <%=al.get(i)%>
										</span></td>
										<%
											}
										%>

										<%
											if (i % 8 == 5) {
										%>
										<td><%=al.get(i)%></td>
										<%
											}
										%>
										<%
											if (i % 8 == 6) {
										%>
										<td><%=al.get(i)%></td>
										<%
											}
										%>


										<%
											if (i % 8 == 7) {
										%><td><%=al.get(i)%></td>
										<%
											}
										%>
										<%
											}
										%>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><b>Total</b></td>
										<td>Rs.<span><%=tot%></span> <%
 	tot = 0.0;
 %>
										</td>
									</tr>
								</tbody>
							</table>

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
						<a href="https://www.facebook.com/"><img width="60"
							height="60" src="themes/images/facebook.png" title="facebook"
							alt="facebook" /></a> <a href="https://www.twitter.com/"><img
							width="60" height="60" src="themes/images/twitter.png"
							title="twitter" alt="twitter" /></a> <a
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
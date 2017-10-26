<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="oscs.JDBCCon"%>
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
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row">
				<div class="span6">Welcome!</div>
				<div class="span6"></div>
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
	<div id="carouselBlk">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<a href="register.jsp"><img style="width: 100%"
							src="themes/images/carousel/1.png" alt="special offers" /></a>
						<div class="carousel-caption">
			
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.jsp"><img style="width: 100%"
							src="themes/images/carousel/2.png" alt="" /></a>
						<div class="carousel-caption">
					
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.jsp"><img
							src="themes/images/carousel/3.png" alt="" /></a>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="register.jsp"><img
							src="themes/images/carousel/4.png" alt="" /></a>

					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">

						<%
							JDBCCon ee = new JDBCCon();

							ArrayList<String> cartDetail = ee.fetchUserCart((String) session
									.getAttribute("uname"));
							if (cartDetail.size() <= 0) {
								session.setAttribute("cartItem", "0");
								session.setAttribute("cartTotal", "Rs. 0");

							} else {
								session.setAttribute("cartItem", cartDetail.get(0));
								session.setAttribute("cartTotal", cartDetail.get(1));

							}
						%>
						<a id="myCart" href="shoppingCart.jsp"><img
							src="themes/images/ico-cart.png" alt="cart"><%=session.getAttribute("cartItem")%>
							Items in your cart <span class="badge badge-warning pull-right"><%=session.getAttribute("cartTotal")%></span></a>
					</div>


					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<%
							response.setContentType("text/html");
							request.getSession(true);
							JDBCCon e = new JDBCCon();

							ArrayList<String> dl = e.retreive_department();
						%>


						<%
							for (int i = 0; i < dl.size(); i++) {

								String t = dl.get(i); //dept_id

								ArrayList<String> cl = e.retreive_category(t);

								i++;
								String m = dl.get(i);//dept_name
								i++;
								String n = dl.get(i);//description
								out.print("<li class='subMenu open'><a> " + m + "</a>");

								for (int j = 0; j < cl.size(); j++) {
									out.print("<ul><li>");
									String cid = cl.get(j);//category_id
									j++;
									String c = cl.get(j);//category_name
									j++;
									String d = cl.get(j);//description
									out.print("<a class='active' href='Products2.jsp?cat_id="
											+ cid + "'><i class='icon-chevron-right'></i>" + c
											+ " </a></li>	");
									out.print("</ul>");
								}
								out.print(" </li>");
							}
						%>

					</ul>

					<br />
					<%
						response.setContentType("text/html");
						request.getSession(true);
						JDBCCon p = new JDBCCon();
						ArrayList<String> pl = p.retreive_data();
					%>
					<%
						for (int i = 8; i < 16; i += 1) {
							String pid = pl.get(i);//product_id
							i++;
							String t = pl.get(i); //pic_id
							i++;
							String q = pl.get(i);//product_name
							i++;

							String r = pl.get(i);//unit_price
							out.println("<div class='thumbnail' ><img src='themes/images/products/"
									+ t
									+ "' alt='SmartCart'/><div class='caption'><h5>"
									+ q
									+ "</h5><h4 style='text-align:center'><form action='ProductShowServlet'><button type='submit' value="
									+ pid
									+ " name='pid'> <i class='icon-zoom-in'></i></button></form><form action=AddtoCart method=get><button type='submit' value="
									+ pid
									+ " name='pid' >Add to <i class='icon-shopping-cart'></i></button> <a class='btn' btn-primary' > Rs."
									+ r + "</a></form></h4></div></div>");
						}
					%>

					<div class="thumbnail">
						<img src="themes/images/payment_methods.png"
							title="Smartcart Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>

				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<div class="well well-small">
						<h4>Featured Products</h4>

						<div class='row-fluid'>
							<div id='featured' class='carousel slide'>
								<div class='carousel-inner'>
									<div class='item active'>
										<ul class='thumbnails'>
											<%
												for (int i = 0; i < 16; i += 1) {
													String pid = pl.get(i);
													i++;
													String t = pl.get(i);

													i++;
													String q = pl.get(i);

													i++;

													String r = pl.get(i);

													out.print("<li class='span3'><div class='thumbnail' style='width:auto; height:300px;'><i class='tag'></i><img  style='object-fit:cover; width:180px;height:180px;' src='themes/images/products/"
															+ t
															+ "' alt='SmartCart'><div class='caption'><h5>"
															+ q
															+ "</h5><h4><form action='ProductShowServlet'><button type='submit' value="
															+ pid
															+ " name='pid'><b>View</b> </button> <span class='pull-right'>Rs."
															+ r + "</span></form></h4></div></div></li>");
												}
											%>
										</ul>



									</div>
									<div class="item">
										<ul class='thumbnails'>
											<%
												for (int i = 16; i < 32; i += 1) {
													String pid = pl.get(i);
													i++;
													String t = pl.get(i);

													i++;
													String q = pl.get(i);

													i++;

													String r = pl.get(i);

													out.print("<li class='span3'><div class='thumbnail' style='width:auto; height:300px;'><i class='tag'></i><img style='object-fit:cover; width:180px;height:180px;' src='themes/images/products/"
															+ t
															+ "' alt='SmartCart'><div class='caption'><h5>"
															+ q
															+ "</h5><h4><form action='ProductShowServlet'><button type='submit' value="
															+ pid
															+ " name='pid'><b>View</b> </button> <span class='pull-right'>Rs."
															+ r + "</span></form></h4></div></div></li>");
												}
											%>
										</ul>

									</div>
									<div class="item">
										<ul class='thumbnails'>
											<%
												for (int i = 32; i < 48; i += 1) {
													String pid = pl.get(i);
													i++;
													String t = pl.get(i);

													i++;
													String q = pl.get(i);

													i++;

													String r = pl.get(i);

													out.print("<li class='span3'><div class='thumbnail' style='width:auto; height:300px;'><i class='tag'></i><img style='object-fit:cover; width:180px;height:180px;' src='themes/images/products/"
															+ t
															+ "' alt='SmartCart'><div class='caption'><h5>"
															+ q
															+ "</h5><h4><form action='ProductShowServlet'><button type='submit' value="
															+ pid
															+ " name='pid'><b>View</b> </button> <span class='pull-right'>Rs."
															+ r + "</span></form></h4></div></div></li>");
												}
											%>
										</ul>

									</div>
									<div class="item">
										<ul class='thumbnails'>
											<%
												for (int i = 48; i < 64; i += 1) {
													String pid = pl.get(i);
													i++;
													String t = pl.get(i);

													i++;
													String q = pl.get(i);

													i++;

													String r = pl.get(i);

													out.print("<li class='span3'><div class='thumbnail' style='width:auto; height:300px;'><i class='tag'></i><img style='object-fit:cover; width:180px;height:180px;' src='themes/images/products/"
															+ t
															+ "' alt='SmartCart'><div class='caption'><h5>"
															+ q
															+ "</h5><h4><form action='ProductShowServlet'><button type='submit' value="
															+ pid
															+ " name= 'pid' ><b>View</b> </button> <span class='pull-right'>Rs."
															+ r + "</span></form></h4></div></div></li>");
												}
											%>
										</ul>

									</div>
								</div>
								<a class="left carousel-control" href="#featured"
									data-slide="prev">&lsaquo;</a> <a
									class="right carousel-control" href="#featured"
									data-slide="next">&rsaquo;</a>
							</div>
						</div>
					</div>



					<h4>Latest Products</h4>
					<ul class='thumbnails'>


						<%
							for (int i = 0; i < 36; i += 1)

							{
								if (i % 12 == 0)
									out.print("</ul><ul class='thumbnails'>");

								String pid = pl.get(i);
								i++;
								String t = pl.get(i);

								i++;
								String q = pl.get(i);

								i++;

								String r = pl.get(i);

								out.print("<li class='span3'><div class='thumbnail'  style='width:auto; height:380px;' ><img style='object-fit:cover; width:160px;height:180px;' src='themes/images/products/"
										+ t
										+ "' alt='SmartCart'/><div class='caption'><h5>"
										+ q
										+ "</h5><h4 style='text-align:center'><form action='ProductShowServlet'><button type='submit' value="
										+ pid
										+ " name='pid'> <i class='icon-zoom-in'></i></button></form><form action=AddtoCart method=get><button type=submit value="
										+ pid
										+ " name='pid'>Add to <i class='icon-shopping-cart'></i> </button> <a class='btn' btn-primary' > Rs."
										+ r + "</a></form> </h4></div></div></li>");
							}
						%>

					</ul>

				</div>
			</div>
		</div>
	</div>





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


	<span id="themesBtn"></span>
</body>



</html>
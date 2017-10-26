<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
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

<!-- //for-mobile-apps -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />

<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
	<div id="header">
		<div class="container">
			<div id="welcomeLine" class="row"></div>
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
					<%
						if ((session.getAttribute("uname")) != null) {
					%>
					<li class="dropdown" style="color: white;">
						<%
							out.println("Hello, " + session.getAttribute("uname"));
						%>
						<div class="dropdown-content">
							<a href="MyAccount.jsp"><p
									style="text-align: left; color: black;">My Account</p></a><a
								href="LogOutServlet"><p
									style="text-align: left; color: black;">Log Out</p></a>
						</div>
					</li>
					<%
						} else {
					%>
					<li class="dropdown" style="color: white;">Guest
						<div class="dropdown-content">
							<a href="register.jsp"><p
									style="text-align: left; color: black;">Sign Up</p></a><a
								href="login.jsp"><p style="text-align: left; color: black;">Log
									In</p></a>
						</div>
					</li>

					<%
						}
					%>

					<li class="nav pull-right"">&nbsp; &nbsp;<a href="contact.jsp"
						style="color: white">Contact</a></li>


				</ul>

			</div>
		</div>
	</div>
	</div>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">


			<div class="content">

				<script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
				<script type="text/javascript">
					$(document).ready(function() {
						$('#horizontalTab').easyResponsiveTabs({
							type : 'default', //Types: default, vertical, accordion           
							width : 'auto', //auto or any width like 600px
							fit : true
						// 100% fit in a container
						});
					});
				</script>
				<div class="sap_tabs">
					<div id="horizontalTab"
						style="display: block; width: 100%; margin: 0px;">
						<div class="pay-tabs">
							<h2>Select Payment Method</h2>
							<ul class="resp-tabs-list">
								<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span><label
										class="pic3"></label>Net Banking</span></li>
								<li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span><label
										class="pic2"></label>Debit Card</span></li>
								<li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span><label
										class="pic4"></label>COD</span></li>
								<li class="resp-tab-item" aria-controls="tab_item-4" role="tab"><span><img
										src="images/pic5.jpg" height=""></img><br>
									<br>PAYTM SCAN</span></li>
								<div class="clear"></div>
							</ul>
						</div>
						<div class="resp-tabs-container">

							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
								<div class="payment-info">
									<h3>Net Banking</h3>
									<form action="PaymentGatewayNetBanking">
										<div class="radio-btns">
											<div class="swit">
											<br>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="Andhra Bank" checked="checked"><i></i>Andhra
														Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="Allahabad Bank"><i></i>Allahabad Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="Bank of Baroda"><i></i>Bank of Baroda</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="Canara Bank"><i></i>Canara Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="IDBI Bank"><i></i>IDBI Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="ICICI Bank"><i></i>ICICI Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="Indian Overseas Bank"><i></i>Indian
														Overseas Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="Punjab National Bank"><i></i>Punjab
														National Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="South Indian Bank"><i></i>South Indian Bank</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="State Bank Of India"><i></i>State Bank Of
														India</label>
												</div>
												<div class="radio">
													<label><input type="radio" name="radio"
														value="SkadooshBank"><i></i>Skadoosh Bank</label>
												</div>
											</div>

											<div class="clear"></div>
										</div>
										<input type="submit" value="Continue" />
									</form>
								</div>
							</div>

							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-3">
								<div class="payment-info">

									<h3 class="pay-title">Debit Card Info</h3>
									<form action="PaymentGatewayDebit" method="GET">
										<div class="tab-for">
											<h5>NAME ON MASTER-CARD</h5>
											<input type="text" name="name_on_card">
											<h5>MASTER-CARD NUMBER</h5>
											<input class="pay-logo" name="card_number" type="text"
												value="0000-0000-0000-0000" onfocus="this.value = '';"
												onblur="if (this.value == '') {this.value = '0000-0000-0000-0000';}"
												required="">
										</div>
										<div class="transaction">
											<div class="tab-form-left user-form">
												<h5>EXPIRATION</h5>
												<ul>
													<li><input type="number" name="month_exp"
														class="text_box" type="text" value="6" min="1" max="12" />
													</li>
													<li><input type="number" name="year_exp"
														class="text_box" type="text" value="2017" min="2017" /></li>

												</ul>
											</div>
											<div class="tab-form-right user-form-rt">
												<h5>CVV NUMBER</h5>
												<input type="text" value="xxx" name="cvv"
													onfocus="this.value = '';"
													onblur="if (this.value == '') {this.value = 'xxx';}"
													required maxlength="3">
											</div>
											<div class="clear"></div>
										</div>
										<input type="submit" value="PAY">
									</form>

								</div>
							</div>



							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
								<div class="payment-info">
									<h3>Cash On Delivery</h3>

									<form style="text-align: center" action="PaymentCod"
										method="get">
										<input type="submit"
											style="width: auto; height: auto; max-width: 100%;"
											value="PLACE ORDER">
									</form>
								</div>
							</div>

							<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-4">
								<div class="payment-info">
									<h3>Paytm Scan</h3>

									<form style="text-align: center" action="PaymentCod"
										method="get">
										<img src='themes\images\scan.jpg'></img> <input type="submit"
											style="width: auto; height: auto; max-width: 100%;"
											value="CONTINUE">
									</form>
									<h5>
										*Click on continue after scan and pay Rs.
										<%=session.getAttribute("amount")%></h5>
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
						<a href="https://www.facebook.com/"><img width="60"
							height="60" src="themes/images/facebook.png" title="facebook"
							alt="facebook" /></a> <a href="https://www.twitter.com/"><img
							width="60" height="60" src="themes/images/twitter.png"
							title="twitter" alt="twitter" /></a> <a
							href="https://www.youtube.com/"><img width="60" height="60"
							src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
					</div>
				</div>

			</div>
			<!-- Container End -->
		</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

<script language="JavaScript" src="js/gen_validatorv4.js">
    type="text/javascript" xml:space="preserve"></script>



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
							<option value="D002">HEALTH & BEAUTY</option>
							<option value="D003">CLOTHES</option>
							<option value="D004">SPORTS & LEISURE</option>

						</select>
						<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					</form>
					<% if((String)session.getAttribute("uname")!=null)
						{
						out.println("<script> alert('User is already Logged In!');location.href='index.jsp';</script>");
						}
						else{%>
					<ul id="topMenu" style="text-align: right;">

						<li class="nav pull-right">&nbsp; &nbsp;<a href="contact.jsp"
							style="color: white">Contact</a></li>
						<li class="nav  pull-right">&nbsp; &nbsp;<a href="login.jsp"
							style="color: white">Log In</a></li>
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
						<li class="active">Registration</li>
					</ul>
					<h3>Registration</h3>
					<div class="well">


						<form class="form-horizontal" action="Dept_detailPath"
							method="get" id="myForm">


							<h4>Your personal information</h4>
							<div class="control-group">
								<label class="control-label">Title <sup>*</sup></label>
								<div class="controls">
									<select required class="span1" name="titl">
										<option value="">-</option>
										<option value="Mr">Mr.</option>
										<option value="Mrs">Mrs</option>
										<option value="Miss">Miss</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputFname">First name
									<sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" name="inputFname" id="inputFname"
										placeholder="First Name" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="inputLnam" name="inputLnam"
										placeholder="Last Name" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="UserName">User Name<sup>*</sup></label>
								<div class="controls">
									<input type="text" id="UserName" name="UserName"
										placeholder="User Name" required>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="input_email">Email <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="input_email" name="input_email"
										placeholder="Email" required>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPassword">Password
									<sup>*</sup>
								</label>
								<div class="controls">
									<input type="password" id="inputPassword" name="inputPassword"
										placeholder="Password"
										pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 to 20 characters"
										required>

								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="confirmPassword">Re-enter
									Password <sup>*</sup>
								</label>
								<div class="controls">
									<input type="password" id="confirmpassword"
										name="confirmpassword" placeholder="Re-enter Password"
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 6 to 20 more characters"
										required>


								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="dob">Date of Birth <sup>*</sup></label>
								<div class="controls">
									<input type="Date" name="dob" placeholder="DD/MM/YYYY" required />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="Mobile Number">Mobile
									Number <sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" name="phone" id="phone"
										placeholder="Mobile Number" required />
								</div>
							</div>


							<div class="control-group">
								<label class="control-label" for="address">Address<sup>*</sup></label>
								<div class="controls">
									<input type="text" id="address" name="address"
										placeholder="Address" required />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="address2">Address
									(Line 2)<sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" id="address2" name="address2"
										placeholder="Adress line 2" required />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="area">Area</label>
								<div class="controls">
									<input type="text" id="area" name="area" placeholder="Area" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="city">City<sup>*</sup></label>
								<div class="controls">
									<input type="text" id="city" name="city" placeholder="City"
										required />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="state">State<sup>*</sup></label>
								<div class="controls">
									<input type="text" id="state" name="state" placeholder="State"
										required />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="postcode">Zip / Postal
									Code<sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" id="postcode" name="postcode"
										placeholder="Zip / Postal Code" required />
								</div>
							</div>







							<p>
								<sup>*</sup>Required field
							</p>

							<div class="control-group">
								<div class="controls">
									<input type="hidden" name="email_create" value="1"> <input
										type="hidden" name="is_new_customer" value="1"> <input
										class="btn btn-large btn-success" type="submit"
										value="Register" />
								</div>
							</div>
						</form>

						<!--  ..........................JavaScript Validation..........................  -->


						<script language="JavaScript" type="text/javascript"
							xml:space="preserve">

 var frmvalidator = new Validator("myForm"); 

 frmvalidator.addValidation("inputFname","alpha_s", "First Name should contain only Alphabets"); 

frmvalidator.addValidation("inputLnam","alpha", "Last Name should contain only Alphabets"); 

frmvalidator.addValidation("UserName","alphanumeric","Please enter your a valid user Name"); 


frmvalidator.addValidation("input_email","email","Please enter valid E-mail"); 



frmvalidator.addValidation("confirmpassword","eqelmnt=inputPassword", "The confirmed password is not same as password"); 
 
frmvalidator.addValidation("phone","num","Mobile number should contain digits only"); 

frmvalidator.addValidation("phone","minlen=10","Mobile number should contain 10 digits");
frmvalidator.addValidation("phone","maxlen=11","Mobile number should contain 10 digits");

frmvalidator.addValidation("city","alpha_s", "City name should contain only Alphabets"); 

frmvalidator.addValidation("state","alpha_s", "State name should contain only Alphabets"); 
frmvalidator.addValidation("postcode","num","Postcode should contain digits only"); 
frmvalidator.addValidation("postcode","minlen=6","Postcode should have contain 6 digits only");

frmvalidator.addValidation("postcode","maxlen=6","Postcode should have contain 6 digits only");
frmvalidator.addValidation("inputFname","maxlen=18", "Please enter 18 characters for first name"); 

frmvalidator.addValidation("inputLnam","maxlen=18", "Please enter 18 characters for last name"); 
 
frmvalidator.addValidation("UserName","maxlen=14","Please enter 14 characters for user id");




</script>







						<!-- ............................................End................. -->


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
					<a href="contact.jsp">CONTACT</a> 
					<a href="legal_notice.jsp">LEGAL NOTICE</a> <a href="tac.jsp">TERMS
						AND CONDITIONS</a> <a href="faq.jsp">FAQ</a>
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

<%} %>
</body>
</html>
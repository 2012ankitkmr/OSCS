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
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
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
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
	<div class="span6"><strong> </strong></div>
	<div class="span6">
	<div class="pull-right">
	</div>
	</div>
</div>
<!-- Navbar ================================================== -->
<div id="logoArea" class="navbar">
<a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
	<span class="icon-bar"></span>
</a>
  <div class="navbar-inner">
    <a class="brand" href="index.jsp"><img src="images/cart.jpg"
						style="height: 100%; width: 90px;" alt="smartcart" /></a>
						
	<ul id="topMenu" style="text-align: right; margin: 15px;">
						<%
							if ((session.getAttribute("uname")) != null) {
						%>
						<li class="dropdown" style="color: white; margin-top: 15px;">
							<%
								out.println("Hi!, " + session.getAttribute("uname"));
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
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Legal Notice</li>
    </ul>
	<h3> Legal</h3>	
	<hr class="soft"/>
	<div id="legalNotice">

	<p>
The content of this Internet site is owned or controlled by onlineshoppingcart.com, and is protected by worldwide copyright laws. Content may be seen only for personal use for business purposes. Content may not otherwise be used in any way.
The owner of this site will make reasonable efforts to include up-to-date and fashionable products, but makes no representations, warranties or assurances as to the accuracy, currency or completeness of the information provided. To the fullest extent permitted by law, in no event shall the owner of this site, its agents, representatives or licensors be liable to you or any other party for any punitive, special, incidental, consequential or other indirect damage (including, but not limited to lost profits or lost savings) resulting from or in any way connected to:<br><br>(a) Your use of this site.<br> (b) Your access to or inability to access this site. <br> (c) The performance or non-performance by the owner of this site or any third party providers of products or services related to this site.<br> <br>This limitation of liability shall apply to the fullest extent permitted by law regardless of whether the claim asserted is based on contract, negligence, or any other theory of recovery. In the event the owner of this site is held liable for any damages related to this site, to the fullest extent permitted by law, your sole and exclusive remedy will be limited to reimbursement of the charges for products or services paid by you that were not provided to you or one thousand rupees (Rs. 1,000), whichever is greater. To the residents of india: The provisions above are intended to be as broad and inclusive as is permitted by the laws of the State of india only.
The trademarks, service marks, trade names, trade dress and products in this Internet site are protected in the United States and internationally. No use of any of these may be made without the prior written authorization of the owners of these trademarks, service marks or trade names, except to identify the products or services of the company.
Any personally identifiable information in electronic communications to this Internet site is governed by this site's Privacy Policy. The owners of this site shall be free to use or copy all other information in any such communications, including any ideas, inventions, concepts, techniques or know-how disclosed therein, for any purposes. Such purposes may include disclosure to third parties and/or developing, manufacturing and/or marketing goods or services.
 </p>

		</div>
	</div>
</div>
</div>
</div>
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>ACCOUNT</h5>
				<a href="MyAccount.jsp">YOUR ACCOUNT</a>
				<a href="Profile.jsp">PERSONAL INFORMATION</a> 
				<a href="Address.jsp">ADDRESSES</a> 
				<a href="Orders.jsp">ORDER HISTORY</a>
			 </div>
			<div class="span3">
				<h5>INFORMATION</h5>
				<a href="contact.jsp">CONTACT</a>  
				
				<a href="legal_notice.jsp">LEGAL NOTICE</a>  
				<a href="tac.jsp">TERMS AND CONDITIONS</a> 
				<a href="faq.jsp">FAQ</a>
			 </div>
			
			<div id="socialMedia" class="span3 pull-right">
				<h5>SOCIAL MEDIA </h5>
				<a href="https://www.facebook.com/"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
				<a href="https://www.twitter.com/"><img width="60" height="60" src="themes/images/twitter.png" title="twitter" alt="twitter"/></a>
				<a href="https://www.youtube.com/"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube"/></a>
			</div> 
		 </div>
		<p class="pull-right">&copy; Smartcart</p>
	</div><!-- Container End -->
	</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	

</body>
</html>
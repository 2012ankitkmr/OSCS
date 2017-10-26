<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>

<%@page import="oscs.JDBCCon"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title> Smartcart online Shopping cart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

	
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


	
  </head>




<body>
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong> <%=(String)session.getAttribute("uname") %></strong></div>
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
     <a class="brand" href="index.jsp"><img src="images/cart.jpg"style="height:100%; width:90px;" alt="smartcart"/></a>
		<ul id="topMenu" style="text-align: right; margin-top:15px;">
					
<li class="dropdown" style="color:white; " > 
<% if( session.getAttribute("uname")==null)
	{
 
	out.println("<script>alert('Please do login first');location.href='login.jsp';</script>"); %>
	Guest
	  <div class="dropdown-content"><a href="register.jsp"><p style="text-align:left; color:black;">Sign Up</p></a><a href="login.jsp"><p style="text-align:left; color:black;" >Log In</p></a>
	</div>

<% }else
{
out.println("Hi!, "+session.getAttribute("uname")); %>
  <div class="dropdown-content"><a href="MyAccount.jsp"><p style="text-align:left; color:black;">My Account</p></a><a href="LogOutServlet"><p style="text-align:left; color:black;" >Log Out</p></a>
</div>

				</li>		
						<li class="nav pull-right"">&nbsp; &nbsp;<a
							href="contact.jsp" style="color: white">Contact</a></li>


					</ul>

  </div>
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
 <h1 style="text-align:center;">My Account</h1>
</div>


<div style="width:100%;text-align:center; ">
<img width="100" height="100"src="themes/images/profile.png" title="profile" alt="profile"/>
</div>
<!-- Header End====================================================================== -->


<% 		JDBCCon dj = new JDBCCon();  

ArrayList<String> detail=dj.fetchuser((String)session.getAttribute("uname"));  %>
<h2 align="center"><%=detail.get(0) %> <%=detail.get(1) %></h2>

  
<div class="container"  style="text-align:center; margin-top:8%">

        	
	<ul style="list-style-type:none">
		<li > <a href="Profile.jsp"><h4 style=" border:2px solid black; padding-top:10px;padding-bottom:10px; max-width:100%; background-color:black;color:white; "> My Profile</h4></a></li>
		<li> <a href="Address.jsp"><h4  style="border:2px solid black; padding-top:10px;padding-bottom:10px; max-width:100%; background-color:black;color:white;"> Address </h4></a></li>
		<li> <a href="Orders.jsp"><h4  style="border:2px solid black; padding-top:10px;padding-bottom:10px; max-width:100%; background-color:black;color:white;"> Orders</h4> </a></li>
	</ul>


    </div>
	    

	
<!-- MainBody End ============================= -->
<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			
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
	
<%} %>
</body>
</html>
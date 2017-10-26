<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="oscs.JDBCCon" %>
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
  
<script language="JavaScript" src="js/gen_validatorv4.js">
   < type="text/javascript" xml:space="preserve"> </script>

<script type="text/javascript" src="js/jquery.min.js"></script>


</head>
<body >


<!-- java code -->
<%
									JDBCCon e = new JDBCCon();
			ArrayList<String> cartDetail = e.fetchUserCart((String)session.getAttribute("uname"));
			if(cartDetail.size()<=0)
			{
				session.setAttribute("cartItem","0");
				session.setAttribute("cartTotal","Rs. 0");

			}
			else{						session.setAttribute("cartItem",cartDetail.get(0));
										session.setAttribute("cartTotal",cartDetail.get(1));
		
			}%>
	<% if(Integer.parseInt((String)session.getAttribute("cartItem"))<=0)
			{
			out.println("<script> alert('There is no Item in your Cart!'); location.href='Products.jsp'</script>");
			}%>
   <%! ArrayList<String> al = new ArrayList<String>(); %>
             <%
              JDBCCon dj= new JDBCCon();
            al= dj.displayCart((String)session.getAttribute("uname")); 
   %> 		


<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong> <%=(String)session.getAttribute("uname") %></strong></div>
	<div class="span6">
	
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
						<form class="form-inline navbar-search" method="get" action="Products1.jsp" >
		<input id="srchFld" class="srchTxt"  style="text-align:right;" name="pro_name" type="text"/>
		  <select class="srchTxt" name="search_type">
			<option value="ALL">ALL</option>
			<option value="D001">ELECTRONICS </option>			
			<option value="D003">HEALTH & BEAUTY </option>
			<option value="D002">CLOTHES </option>
			<option value="D004">SPORTS & LEISURE </option>
			
		</select> 
		  <button type="submit" id="submitButton" class="btn btn-primary">Go</button>
    </form>
   <ul id="topMenu" style="text-align:right">
<% if( session.getAttribute("uname")!=null)
	{ %>
<li class="dropdown" style="color:white;" > 
<% out.println("Hi!, "+session.getAttribute("uname")); %>
  <div class="dropdown-content"><a href="MyAccount.jsp"><p style="text-align:left; color:black;">My Account</p></a><a href="LogOutServlet"><p style="text-align:left; color:black;" >Log Out</p></a>
</div></li>
<% }  else { %>
<li class="dropdown" style="color:white;" > 
Guest
  <div class="dropdown-content"><a href="register.jsp"><p style="text-align:left; color:black;">Sign Up</p></a><a href="login.jsp"><p style="text-align:left; color:black;" >Log In</p></a>
</div></li>

<% } %>

	 <li class="nav pull-right" ">&nbsp; &nbsp;<a href="contact.jsp" style="color:white">Contact</a></li>

	
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
		<li class="active">Shipping Address</li>
    </ul>
	<h3>Shipping Address</h3>	
	<div class="well">


<form class="form-horizontal" action="ShipAddress" method="get" id="myForm"  >


<%!  ArrayList<String> addr = new ArrayList<String>();%>
<%  JDBCCon djj= new JDBCCon();
		addr=djj.getAddress((String)session.getAttribute("uname"));
		

%>

		
		<div class="control-group">
			<label class="control-label" for="name">Name <sup>*</sup></label>
			<div class="controls">
			  <input type="text" name="name"  id="name"  placeholder="Name" value=<%=addr.get(0) %> required>
			</div>
		 </div>
		
	
<div class="control-group">
			<label class="control-label" for="Mobile Number">Mobile Number <sup>*</sup></label>
			<div class="controls">
			  <input type="text"  name="phone" id="phone" placeholder="Mobile Number" value=<%=addr.get(1) %> required/> 
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label" for="address">Address<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="address" name="address" placeholder="Address" value=<%=addr.get(2) %> required /> 
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="address2">Address (Line 2)<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="address2" name="address2" placeholder="Adress line 2" value=<%=addr.get(3) %> required/> 
			</div>
		</div>
	
	<div class="control-group">
			<label class="control-label" for="area">Area</label>
			<div class="controls">
			  <input type="text" id="area" name="area" placeholder="Area" value=<%=addr.get(4) %> /> 
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="city">City<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="city" name="city" placeholder="City" value=<%=addr.get(5) %> required/> 
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="state">State<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="state" name="state" placeholder="State"value=<%=addr.get(6) %> required/> 
			</div>
		</div>
				
		<div class="control-group">
			<label class="control-label" for="postcode">Zip / Postal Code<sup>*</sup></label>
			<div class="controls">
			  <input type="text" id="postcode" name="postcode" placeholder="Zip / Postal Code" value=<%=addr.get(7) %> required /> 
			</div>
		</div>
		
		
		
	<p><sup>*</sup>Required field	</p>
	
	<div class="control-group">
			<div class="controls">
				<input type="hidden" name="email_create" value="1">
				<input type="hidden" name="is_new_customer" value="1">
				<input class="btn btn-large btn-success" type="submit" value="Make Payment"  />
			</div>
		</div>		
	</form>

<!--  ..........................JavaScript Validation..........................  -->


<script language="JavaScript" type="text/javascript"
    xml:space="preserve">

 var frmvalidator = new Validator("myForm"); 

 frmvalidator.addValidation("inputFname","alpha", "First Name should contain only Alphabets"); 

frmvalidator.addValidation("inputLnam","alpha", "Last Name should contain only Alphabets"); 

frmvalidator.addValidation("UserName","alphanumeric","Please enter your a valid user Name"); 


frmvalidator.addValidation("input_email","email","Please enter valid E-mail"); 



frmvalidator.addValidation("confirmpassword","eqelmnt=inputPassword", "The confirmed password is not same as password"); 


 

frmvalidator.addValidation("phone","num","Mobile number should contain digits only"); 

frmvalidator.addValidation("phone","minlen=10","Mobile number should contain 10 digits");


frmvalidator.addValidation("city","alpha_s", "City name should contain only Alphabets"); 

frmvalidator.addValidation("state","alpha_s", "State name should contain only Alphabets"); 
frmvalidator.addValidation("postcode","num","Postcode should contain digits only"); 

frmvalidator.addValidation("postcode","len=6","Postcode should have contain 6 digits only");



</script> 







<!-- ............................................End................. -->


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
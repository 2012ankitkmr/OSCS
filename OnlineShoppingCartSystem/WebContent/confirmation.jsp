<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="oscs.JDBCCon" %>
<%@ page errorPage="error.jsp" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <title>Smartcart online Shopping cart</title>
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
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
  </head>
<body onload="noBack();" 
onpageshow="if (event.persisted) noBack();" onunload="">



<!-- java code -->
   <%! ArrayList<String> al = new ArrayList<String>(); %>
             <%
              JDBCCon dj= new JDBCCon();
            
            al= dj.displayCart((String)session.getAttribute("uname")); 
            
   %> 		
<!--   -->
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
    <a class="brand" href="index.jsp"><img
						img src="images/cart.jpg"
						style="height: 100%; width: 90px;" alt="smartcart"  /></a>
						
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
									href="login.jsp"><p
										style="text-align: left; color: black;">Log In</p></a>
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
<!-- Sidebar ================================================== -->
	
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active"> CONFIRMATION</li>
    </ul>
	<h3>  Confirmation <a href="UpdateOrderServlet" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Go back </a></h3>	
	<hr class="soft"/>
		
			
	<table id="Mytable" class="table table-bordered" >
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Description</th>
			<th>Unit Price</th>
                  <th>Sub Total</th>
          </tr>
              </thead>
              <tbody>
              
           
 
 
     <%! double tot=0.0; %>
     <% for(int i=0;i<al.size();i++)
     	{ %>
     	
     	<%if(i%6==0) 
    		{ %>
    			<tr> 
    	<% } %>
    		<%if(i%6==1) 
    		{ %>
    			<td>
    			<% out.println("<img width='60' src='themes/images/products/"+al.get(i)+"'/>");
   				%></td>
    	<% } %>
     		
    	<%if(i%6==2)
    	{ %> 
     		<td>
     		<%= al.get(i) %>
     		</td>
     	<%}  %>
	
      <%if(i%6==4)
      { %> <td> 
      	Rs.<span >
      	<%= al.get(i) %> 
      	</span></td>	
     <%} %>
      	
    
   <%if(i%6==5)
   { %><td>  	   
   	Rs.<span ><%= al.get(i) %></span>
  </td> 
   	<%tot+=Double.parseDouble(al.get(i)); %>
   	<%}  %>
   
  
  <% }%>
  </tr>
  <tr><td></td><td></td><td><b>Total</b></td><td>  	   
   	Rs.<span ><%=tot %></span>
   	<% tot=0.0; %>
  </td> </tr>
  </tbody>
            </table>
		
		
		
	<a href="ConfirmOrderServlet" class="btn btn-large pull-right">Confirm Order <i class="icon-arrow-right"></i></a>
	
</div>
</div></div>
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
		<p class="pull-right">&copy; Bootshop</p>
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
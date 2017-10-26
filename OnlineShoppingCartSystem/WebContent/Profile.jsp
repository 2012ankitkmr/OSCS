<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
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



	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="styles.css"><style type="text/css" id="enject"></style><style>
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
	<div class="span6"><strong> </strong></div>
	<div class="span6"></div>
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
    <a class="brand" href="index.jsp"><img src="images/cart.jpg" style="height:100%; width:90px;" alt="smartcart"/></a>
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

    <h1 style="text-align:center; color:white;">PROFILE</h1></a>

  </div>
</div>
<div style="width:100%;text-align:center; ">
<img width="150" height="150"src="themes/images/profile.png" title="profile" alt="profile"/>
</div>

<!-- Header End====================================================================== -->
<%! String uid,query1,query2; %>


<%
uid = (String)session.getAttribute("uname");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
Statement stmt=con.createStatement();
query1 = "Select U.USER_ID,U.title,U.first_name,U.last_name,U.email,to_char(U.dob, 'dd-mm-yyyy'),U.mobile_no,  address1,address2, state from Users U, Address A where (U.user_id = A.user_id) AND (U.user_id = '"+uid+"')";


ResultSet rs1 = stmt.executeQuery(query1);

while(rs1.next()){
	
%>
  <div class="container" id="advanced-search-form">

        <h2>Personal Details</h2>

	
        <form>

            <div class="form-group">

              <label for="first-name"><h5>First name</h5></label>

                <p><%=rs1.getString(3) %></p>

            </div>

            <div class="form-group">

                <label for="last-name"><h5>Last name</h5></label>

                <p><%=rs1.getString(4) %></p>
            </div>
	
	      <div class="form-group">

                <label for="address"><h5>Address</h5></label>

                <p><%=rs1.getString(8)%>&nbsp;<%=rs1.getString(9) %></p>

            </div>


                        <div class="form-group">

                <label for="number"><h5>Phone number</h5></label>

                <p><%=rs1.getString(7) %></p>

            </div>

            <div class="form-group">

                <label for="date_of_birth"><h5>Date Of Birth</h5></label>

               <p><%=rs1.getString(6) %></p>

            </div>

            <div class="form-group">
          	         <label for="email"><h5>Email</h5></label>

               	 <p><%=rs1.getString(5) %></p>

            </div>

	   <div class="form-group">

                <label for="state"><h5>State</h5></label>

                  <p><%=rs1.getString(10) %></p>
            </div>
       
<%}%>
            

           

            <div class="clearfix"></div>

		
        </form>

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
	

<% } %>
</body>
</html>
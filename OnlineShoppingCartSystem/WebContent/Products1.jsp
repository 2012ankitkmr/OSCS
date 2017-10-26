<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.containers.Products_container"%>
<%@page import="com.containers.Cart_details_container"%>
<%@page import="com.containers.category_Container"%>
<%@page import="com.containers.department_Container"%>
<%@page import="oscs.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
				<div class="span6">
					<strong></strong>
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
					<ul id="topMenu" style="text-align: right">
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
	<div id="sidebar" class="span3">
		<div class="well well-small">
		<%
							JDBCCon ee = new JDBCCon();
			ArrayList<String> cartDetail = ee.fetchUserCart((String)session.getAttribute("uname"));
			if(cartDetail.size()<=0)
			{
				session.setAttribute("cartItem","0");
				session.setAttribute("cartTotal","Rs. 0");

			}
			else{						session.setAttribute("cartItem",cartDetail.get(0));
										session.setAttribute("cartTotal",cartDetail.get(1));
		
			}%>
						<a id="myCart" href="shoppingCart.jsp"><img
							src="themes/images/ico-cart.png" alt="cart"><%=session.getAttribute("cartItem")%>
							Items in your cart <span class="badge badge-warning pull-right"><%=session.getAttribute("cartTotal")%></span></a>
				</div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
	<%
	response.setContentType("text/html");
	request.getSession(true);
	JDBCCon e= new JDBCCon();
	
	ArrayList<String> dl= e.retreive_department();

	%>
	
	
	<% for(int i=0;i<dl.size();i++) 
	   {		   			  
	
		String t=dl.get(i);	//dept_id
	
		ArrayList<String> cl= e.retreive_category(t);

		i++;
		String m=dl.get(i);//dept_name
		i++;
		String n=dl.get(i);//description
		out.print("<li class='subMenu open'><a> "+ m +"</a>");
		
		
        for(int j=0;j<cl.size();j++)
        {
        	out.print("<ul><li>");
        	String cid=cl.get(j);//category_id
        	j++;
        	String c=cl.get(j);//category_name
        	j++;
        	String d = cl.get(j);//description
		    out.print("<a class='active' href='Products2.jsp?cat_id="+cid+"'><i class='icon-chevron-right'></i>"+c+" </a></li>	");
		    out.print("</ul>");
        }
       out.print(" </li>");
	   }
	%>
		
		</ul>
		
		<br/>
		
	</div>
	
<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.html">Home</a> <span class="divider">/</span></li>
						<li class="active">Products Name</li>
					</ul>



					<form class="form-horizontal span6">
						<div class="control-group"></div>
					</form>


								<div id="myTab" class="pull-right">
									<a href="#listView" data-toggle="tab"><span
										class="btn btn-large"><i class="icon-list"></i></span></a> <a
										href="#blockView" data-toggle="tab"><span
										class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
								</div>
								<br> <br> <br class="clr" />
									<div class="tab-content">
							<%
							JDBCCon db =  new JDBCCon();
	
		                    String search_type= request.getParameter("search_type");
		                   // System.out.println(search_type);
		                    String pro_name = request.getParameter("pro_name");
		                    ArrayList <String> sl=db.SearchProduct(pro_name,search_type);
							if(sl.size()==0)
							{
								out.println("<script> alert('No Match Found'); location.href='index.jsp'; </script>");
							}
		                    ArrayList<String> pl= db.retreive_data();
		
		
%>
			          	
			
						<div class="tab-pane" id="listView">

							<hr class="soft" />
			 				<%for(int i=0;i<sl.size();i++)
			 				{
	
								
			
							
			 					String pid=sl.get(i);//product_id
								i++;
					   			String t=sl.get(i);	//pic_id
				      		    i++;	
				        		String q=sl.get(i);//product_name
				        		i++;
				            	
				    		    String r=sl.get(i);//unit_price
							
							
							
							
								
						
									out.print("<div class=row><div class=span2><img height='160' width='160' src=themes/images/products/"
											+ t
											+ " alt= /></div><div class=span4><h3>"
											+ q
											+ "</h3><hr class=soft/><form action=ProductShowServlet method=get><button type=submit  value="
											+ pid
											+ " name='pid'>View Details</a></form><br class=clr/></div><div class=span3 alignR><form class=form-horizontal qtyFrm><h3>&nbsp;&nbsp;&nbsp;Rs."
											+ r
											+ "</h3>&nbsp; &nbsp;<button type=submit name='pid' value="+pid+"> Add to <i class=icon-shopping-cart></i></button></form></div></div><hr class=soft/>");
														}
			          		%>

						</div>


						<div class="tab-pane active" id="blockView">
							<ul class=thumbnails>
								<% 
						
								   			 			
									for(int i=0;i<sl.size();i++)								
									 {
										if (i % 12 == 0)
											out.print("</ul><ul class=thumbnails>");
										String pid=sl.get(i);//product_id
										i++;
							   			String t=sl.get(i);	//pic_id
						      		    i++;	
						        		String q=sl.get(i);//product_name
						        		i++;
						            	
						    		    String r=sl.get(i);//unit_price
									
										out.print("<li class=span3><div class=thumbnail><img height='160' width='160' src=themes/images/products/"
												+ t
												+ " alt=/><div class=caption><h5>"
												+ q
												+ " </h5><p></p><h4 style=text-align:center><form action=ProductShowServlet method=get><button type=submit value="
												+pid
												+ " name='pid'><i class=icon-zoom-in></i></button></form><form action=AddtoCart method=get><button type=submit name='pid' value="+pid+"> Add to <i class=icon-shopping-cart></i></button><a class=btn href=#>Rs."
												+r + "</a></h4></div></div></li>");
									}%>
							</ul>
								<hr class="soft" />
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
</body>
</html>
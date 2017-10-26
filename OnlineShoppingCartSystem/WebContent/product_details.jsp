<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import ="com.containers.Product_Description_container"%>
<%@page import="oscs.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Smartcart online Shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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
	

<!-- java code -->
   <%! ArrayList<String> al = new ArrayList<String>(); %>
             <%
              JDBCCon dj= new JDBCCon();
            
            al= dj.displayCart((String)session.getAttribute("uname")); 
            JDBCCon e = new JDBCCon();
			ArrayList<String> cartDetail = e.fetchUserCart((String)session.getAttribute("uname"));
			if(cartDetail.size()<=0)
			{
				session.setAttribute("cartItem","0");
				session.setAttribute("cartTotal","Rs. 0");

			}
			else{						session.setAttribute("cartItem",cartDetail.get(0));
										session.setAttribute("cartTotal",cartDetail.get(1));
		
			}
   %> 		
<!--   -->
<div id="header">
<div class="container">
<div id="welcomeLine" class="row">
	<div class="span6">Welcome!<strong> <%
	if((String)session.getAttribute("uname")!=null)
		out.print((String)session.getAttribute("uname"));
		
		%></strong></div>
	<div class="span6">
	<div class="pull-right">
	</div></div></div>
			<!-- Navbar ================================================== -->
			<div id="logoArea" class="navbar">
				<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
					class="btn btn-navbar"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>
				<div class="navbar-inner">
					<a class="brand" href="index.jsp"><img
						img src="images/cart.jpg"
						style="height: 100%; width: 90px;" alt="smartcart"  /></a>
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
						
						<li class="nav pull-right">&nbsp; &nbsp;<a
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
				<div id="sidebar" class="span3">
					<div class="well well-small">
						
						<a id="myCart" href="shoppingCart.jsp"><img
							src="themes/images/ico-cart.png" alt="cart"><%=session.getAttribute("cartItem")%>
							Items in your cart <span class="badge badge-warning pull-right"><%=session.getAttribute("cartTotal")%></span></a>
					</div>
					
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
	<%
	response.setContentType("text/html");
	request.getSession(true);
	JDBCCon ee= new JDBCCon();
	
	ArrayList<String> dl= ee.retreive_department();

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
				</div>
								 <% Product_Description_container record = (Product_Description_container)session.getAttribute("pdetail_list"); %>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
						<li><a href="Products.jsp">Products</a> <span
							class="divider">/</span></li>
						<li class="active">product Details</li>
					</ul>
					<div class="row">
						<div id="gallery" class="span3">
							<% out.print("<a href=themes/images/products/large/"+record.pic_id+" title="+record.p_name+"> <img src=themes/images/products/large/"+record.pic_id+" style=width: 100% alt="+record.p_name+" /></a>");
							%>
			
						</div>
						<div class="span6">
		
							<h3><%=record.p_name %></h3>
							<small>><%=record.p_br_desc%></small>
							<hr class="soft" />
							<form action="AddtoCart" method='get' class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span>Rs.<%=record.price %></span></label>
									<div class="controls">
										<button type="submit"
											class="btn btn-large btn-primary pull-right"
											 name='pid' value=<%=record.pid %>>
											Add to cart <i class=" icon-shopping-cart"></i>
										</button>
									</div>
								</div>
							</form>

							<hr class="soft" />
						
							<hr class="soft clr" />
							<p align="justify">
								Description<br> <%=record.p_desc %>
							</p>
							<a class="btn btn-small pull-right" href="#detail">More
								Details</a> <br class="clr" /> <a href="#" name="detail"></a>
							<hr class="soft" />
						</div>

						<div class="span9">
							<ul id="productDetail" class="nav nav-tabs">
								<li class="active"><a href="#home" data-toggle="tab">Product
										Details</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">
									<h4>Product Information</h4>
									<table class="table table-bordered">
										<tbody>
											<tr class="techSpecRow">
												<th colspan="2">Product Details</th>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Brand:</td>
												<td class="techSpecTD2"><%=record.p_brand %></td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Type</td>
												<td class="techSpecTD2"><%=record.p_type %></td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Category:</td>
												<td class="techSpecTD2"><%=record.p_br_desc%></td>
											</tr>

										</tbody>
									</table>

									<h5>Features</h5>
									<p>
										<%=record.p_feature%>
									</p>
								</div>

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
</body>
</html>
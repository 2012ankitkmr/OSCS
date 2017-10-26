<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SmartCart | Documentation</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/SmartCart.min.css">
<!-- SmartCart Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper">

		<header class="main-header"> <!-- Logo --> <!-- mini logo for sidebar mini 50x50 pixels -->
		<a href="index.jsp" class="logo"> 
		<span class="logo-mini"><b>S</b>C</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>Smart</b>CART</span> </a> <!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<% String uname = (String)session.getAttribute("name"); %>
				
					<%
if(uname==null)
{
	response.sendRedirect("login.jsp");	

	session.setAttribute("errormsg", "Login First!!!");
}
	
	%>
				<!-- User Account: style can be found in dropdown.less -->
				<li class="dropdown user user-menu"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <img
						src="dist/img/user1-128x128.jpg" class="user-image"
						alt="User Image"> <span class="hidden-xs"><%=uname%></span>
				</a>
					<ul class="dropdown-menu">
						<!-- User image -->
						<li class="user-header"><img src="dist/img/user1-128x128.jpg"
							class="img-circle" alt="User Image">

							<p>
								<%=uname%>
								<small>Member since Sep. 2017</small>
							</p></li>

							<!-- Menu Footer-->
						<li class="user-footer">
							<div class="pull-right">
								<form action=logoutserv method=get>
									<button type=submit name="signout" value="signout">Sign
										out</button>
								</form>
							</div>
						</li>
					</ul></li>

			</ul>
		</div>
		</nav> </header>

		<!-- =============================================== -->

		<!-- Left side column. contains the sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/user1-128x128.jpg" class="img-circle"
					alt="User Image">
			</div>
			<div class="pull-left info">
				<p><%=uname%></p>
				<a href=""><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			<li class="treeview"><a href="#"> <i class="fa fa-dashboard"></i>
					<span>Dashboard</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="index.jsp"><i class="fa fa-circle-o"></i>
							Dashboard</a></li>
				</ul></li>

			<li class="treeview"><a href="#"> <i class="fa fa-edit"></i>
					<span>Maintain Stock</span> <span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="addproduct.jsp"><i class="fa fa-circle-o"></i>Add
							Product</a></li>
					<li><a href="editproduct.jsp"><i class="fa fa-circle-o"></i>Edit
							Product</a></li>
				</ul></li>


			<li class="active"><a href="documentation.jsp"><i
					class="fa fa-book"></i> <span>Documentation</span></a></li>

		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- =============================================== -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>
				Documentation <small>Smart Cart</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Documentation</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content"> <!-- Default box -->
			<div class="box">
				<div class="box-header with-border">
					<h2 class="box-title">
						<b>INTRODUCTION 
					</h2>
					</b>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse" data-toggle="tooltip" title="Collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove" data-toggle="tooltip" title="Remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>


				<!-- /.box-footer-->

			</div>
			<div>
				<p>
				<h4>
					<b>1 Purpose of the Document: 
				</h4>
				</b><br> This document will be serving as a single approved
				document for all requirements of Online Shopping Cart System. Once
				approved by LTI this document will stand as a baseline for all the
				requirements and eventually decide change requests and post-delivery
				bugs.<br> <br>
				<h4>
					<b>2 Distribution List 
				</h4>
				</b><br> a. Business Managers <br> b. L&T InfoTech Project
				Managers <br> c. L&T InfoTech Project Leader <br> <br>
				<h4>
					<b>3 SCOPE OF THE PROJECT 
				</h4>
				</b><br> The project should focus on the creation of an online
				e-commerce site to ease the user's shopping experience by providing
				products online. It should also facilitate various categories of
				products, easy and secured payment transfer modes. In addition it
				should have the following functionalities:<br> <br> <b>a.
					Registration and Login</b><br> To utilise the online shopping cart
				system, the user must register online for the first time and thus
				can use it by just logging in. The registration can be done by
				providing details like customer name, customer email id, phone
				number and password. This is to be compared with the database of
				already registered users. After getting email confirmation, the
				customer can login with the valid credentials. Already registered
				users can directly login with their credentials.<br> <br>
				<b>b. Search and View</b><br> Both the registered and guest
				users can search and view the desired products. The user can search
				their desired products using keywords related to products and then
				can view the details of the product like product description, price,
				product availability etc. As per the requirements the customers can
				search products in categories and personal care.<br> <br>
				<b>c. Add to Cart</b><br> After searching and viewing the
				desired products, the customer has options like buy now and add to
				cart. Selecting the required quantity of the selected items, the
				customers can add items to their cart. The users can add items to
				their cart when they have registered account on the website and have
				logged in with the account. The users can also add items to their
				cart from the wish list.<br> <br> <b>d. Payment</b> <br>
				After the confirmation of the order the customers can make payment
				using various payment modes. The customers are provided with 3 modes
				of payment: cod, net banking and Card payment. Card payment can be
				done through credit card / debit card. The online e-commerce website
				provides a secure method of payment to their customers thus
				maintaining customers' privacy.<br> <br> <b>e.
					Maintaining stock</b><br> The admin is responsible for maintaining
				and modifying the stock records of the items present in the website.
				The admin has the right to add or delete items from the stock
				database after having authorised login. The admin can also check the
				delivery status of the ordered items.<br> <br> <b>f.
					Customer Support</b><br> The online shopping cart system also
				provides customer support to the customers. The customers can get a
				solution to their desired problems related to the products by using
				the information and contact details provided in customer support
				segment.<br> <br> <b>g. Customer Details </b><br>
				This section contains the required personal information of the
				customer. It also contains the order history of the customers. The
				customer also has an option to edit their details.<br> <br>


				</p>

			</div>
			<!-- /.box --> </section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->


		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3.1.1 -->
	<script src="plugins/jQuery/jquery-3.1.1.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- SmartCart App -->
	<script src="dist/js/SmartCart.min.js"></script>
	<!-- SmartCart for demo purposes -->
	<script src="dist/js/demo.js"></script>
	<script>
  $(document).ready(function () {
    $('.sidebar-menu').tree()
  })
</script>
</body>
</html>

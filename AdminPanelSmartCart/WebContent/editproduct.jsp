<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.containers.*"%>
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
		<a href="index.jsp" class="logo"> <span class="logo-mini"><b>S</b>C</span>
			<!-- logo for regular state and mobile devices --> <span
			class="logo-lg"><b>Smart</b>CART</span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
			class="icon-bar"></span>
		</a> <%
 	String uname = (String) session.getAttribute("name");
 %> <%
 	if (uname == null) {
 		response.sendRedirect("login.jsp");

 		session.setAttribute("errormsg", "Login First!!!");
 	}
 %>
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
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



			<li class="treeview active"><a href="#"> <i
					class="fa fa-edit"></i> <span>Maintain Stock</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">
					<li><a href="addproduct.jsp"><i class="fa fa-circle-o"></i>Add
							Product</a></li>
					<li class="active"><a href="editproduct.jsp"><i
							class="fa fa-circle-o"></i>Edit Product</a></li>
				</ul></li>



			<li><a href="documentation.jsp"><i class="fa fa-book"></i> <span>Documentation</span></a></li>

		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- =============================================== -->

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Edit Products</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li><a href="#">Maintain Stock</a></li>
				<li class="active">Edit Products</li>
			</ol>



			<!-- /.box-header -->
			<div class="box-body">
				<div>
					<%
						String disp = (String) session.getAttribute("prod_import");
						if (disp != null)
							out.print("<h3><font color=green>" + disp + "</font></h3>");
						session.setAttribute("prod_import", null);
					%>
				</div>
				<form action="fetchProducts" method=get>
					<div class="form-group">
						<label>Product ID</label> <input type="text" class="form-control"
							name="prod_id" placeholder="Enter Product ID">
					</div>
					<button type="submit" class="btn btn-primary">Fetch
						Product</button>
				</form>

				<%
					Productfill_container pc = (Productfill_container) session
							.getAttribute("prod_details");
					if (pc == null)
						out.print("<!--");
					else {
						if (pc.product_id != "NONE")
							session.setAttribute("prod_details", null);
						else
							out.print("<h3><font color=red>No Product Found!, Try Again!!!</font></h3><!--");
					}
				%>

				<form role="form" action="EditProductServ" method=get
					enctype="multipart/form-data">
					<div class="form-group">
						<label>Product ID</label> <input type="text" class="form-control"
							name="prod_id" placeholder="Enter Product Name"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.product_id);%>"
							disabled> <input type="hidden" class="form-control"
							name="prod_id" placeholder="Enter Product Name"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.product_id);%>">
					</div>

					<div class="form-group">
						<label>Product Name</label> <input type="text"
							class="form-control" name="prod_name"
							placeholder="Enter Product Name"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.product_name);%>">
					</div>

					<div class="form-group">
						<label>Categories</label> <select class="form-control select2"
							name="category" style="width: 100%;">
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C001"))
						out.print("selected='selected'");%>
								value="C001">Cameras</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C002"))
						out.print("selected='selected'");%>
								value="C002">Computers,Tables & Laptop</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C003"))
						out.print("selected='selected'");%>
								value="C003">Mobile Phone</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C004"))
						out.print("selected='selected'");%>
								value="C004">Sound And Vision</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C012"))
						out.print("selected='selected'");%>
								value="C005">WOmen Clothing</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C007"))
						out.print("selected='selected'");%>
								value="C007">Women Hand Bags</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C008"))
						out.print("selected='selected'");%>
								value="C008">Men Clothing</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C011"))
						out.print("selected='selected'");%>
								value="C011">Kids Shoes</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C006"))
						out.print("selected='selected'");%>
								value="C006">Women Shoes</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C009"))
						out.print("selected='selected'");%>
								value="C009">Men Shoes</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C010"))
						out.print("selected='selected'");%>
								value="C010">Kids Clothing</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C012"))
						out.print("selected='selected'");%>
								value="C012">Makeup</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C013"))
						out.print("selected='selected'");%>
								value="C013">Eyes</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C014"))
						out.print("selected='selected'");%>
								value="C014">Skin</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C015"))
						out.print("selected='selected'");%>
								value="C015">Body</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C016"))
						out.print("selected='selected'");%>
								value="C016">SportsWear</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C017"))
						out.print("selected='selected'");%>
								value="C017">Accessories</option>
							<option
								<%if (pc != null)
				if (pc.product_id != "NONE")
					if (pc.category_id.equals("C018"))
						out.print("selected='selected'");%>
								value="C018">Gymwear</option>
						</select>
					</div>

					<div class="form-group has-success">
						<label class="control-label" for="inputSuccess"><i
							class="fa fa-check"></i> Quantity</label> <input type="number"
							class="form-control" id="inputSuccess" name="qty"
							placeholder="Enter Quantity"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.qty);%>">
					</div>
					<div class="form-group has-success">
						<label class="control-label" for="inputSuccess"><i
							class="fa fa-check"></i>Price</label> <input type="number"
							class="form-control" id="inputSuccess" name="price"
							placeholder="Enter Price"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.price);%>">
					</div>

					<div class="form-group">
						<label>Brief Description</label> <input type="text"
							class="form-control" name="brief_desc"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.brief_desc);%>">
					</div>

					<div class="form-group">
						<label> Description</label> <input type="text"
							class="form-control" name="desc"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.desc);%>">
					</div>

					<div class="form-group">
						<label>Brand</label> <input type="text" class="form-control"
							name="brand" placeholder="Enter Brand Type"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.brand);%>">
					</div>

					<div class="form-group">
						<label>Type</label> <input type="text" class="form-control"
							name="type" placeholder="Enter Type of Product"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.type);%>">
					</div>

					<div class="form-group">
						<label>Product Image Name&nbsp;</label><font color="blue"><h5>
								<font color="red">Important:</font><small>Place the
									image in images folder!!</small></font> <input type="text"
							class="form-control" name="image_id"
							placeholder="Enter Product Image Name"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.pic_id);%>">
					</div>

					<div class="form-group">
						<label>Features</label> <input type="text" class="form-control"
							name="features"
							value="<%if (pc != null)
				if (pc.product_id != "NONE")
					out.print(pc.features);%>">
					</div>

					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>

				</form>

				<%
					if (pc == null)
						out.print("-->");
				%>
			</div>
			<!-- /.box-body --> </section>


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
		$(document).ready(function() {
			$('.sidebar-menu').tree()
		})
	</script>
</body>
</html>

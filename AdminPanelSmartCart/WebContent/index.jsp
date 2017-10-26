<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.containers.*"%>
<%@page import="java.util.*"%>
<%@page import="jdbc.*"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SmartCart | Dashboard</title>
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
<!-- jvectormap -->
<link rel="stylesheet"
	href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/SmartCart.min.css">
<!-- SmartCart Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<%
		String uname = (String) session.getAttribute("name");
	%>
	<%
		if (uname == null) {
			response.sendRedirect("login.jsp");
			session.setAttribute("errormsg", "Login First!!!");
		}
	%>
	<div class="wrapper">

		<header class="main-header"> <!-- Logo --> <a
			href="index.jsp" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>S</b>C</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg"><b>Smart</b>CART</span>
		</a> <!-- Header Navbar: style can be found in header.less --> <nav
			class="navbar navbar-static-top"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu"
			role="button"> <span class="sr-only">Toggle navigation</span>
		</a> <!-- Navbar Right Menu -->
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
		<%
			JDBCCon db = new JDBCCon();

			AnalyticsContainer analytics = db.getAnalytics();
			ArrayList<ProductsContainer> products = db.getproducts();
			ArrayList<OrdersContainer> orders = db.getorders();
			 DecimalFormat formatter = new DecimalFormat("#0.00");
		%>

		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar"> <!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="dist/img/user1-128x128.jpg" class="img-circle"
					alt="User Image">
			</div>
			<%
				String admin = (String) session.getAttribute("name");
			%>
			<div class="pull-left info">
				<p><%=admin%></p>
				<a href=""><i class="fa fa-circle text-success"></i> Online</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu" data-widget="tree">
			<li class="header">MAIN NAVIGATION</li>
			<li class="active treeview menu-open"><a href="#"> <i
					class="fa fa-dashboard"></i> <span>Dashboard</span> <span
					class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li class="active"><a href="index.jsp"><i
							class="fa fa-circle-o"></i> Dashboard</a></li>
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
			<li><a href="documentation.jsp"><i class="fa fa-book"></i> <span>Documentation</span></a></li>

		</ul>
		</section> <!-- /.sidebar --> </aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
			<h1>Dashboard</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
				<li class="active">Dashboard</li>
			</ol>
			</section>

			<!-- Main content -->
			<section class="content"> <!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-aqua">
						<div class="inner">
							<h3><%=analytics.newOrders%>
							</h3>

							<p>New Orders</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h3>
								<%=analytics.sales%>
							</h3>

							<p>Sales</p>
						</div>
						<div class="icon">
							<i class="ion ion-stats-bars"></i>
						</div>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-yellow">
						<div class="inner">
							<h3><%=analytics.userRegistration%></h3>

							<p>User Registrations</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-red">
						<div class="inner">
							<h3><%=analytics.newMembers%></h3>

							<p>New Members</p>
						</div>
						<div class="icon">
							<i class="ion ion-pie-graph"></i>
						</div>
					</div>
				</div>
				<!-- ./col -->
			</div>
			<!-- /.row -->


			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">Monthly Recap Report</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-footer">
							<div class="row">
								<div class="col-sm-3 col-xs-6">

									<div class="description-block border-right">
										<span class="description-percentage text-blue"><h5><%=formatter.format(analytics.totalRevenue)%></h5></span>
										<span class="description-text">TOTAL REVENUE</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-3 col-xs-6">
									<div class="description-block border-right">
										<span class="description-percentage text-blue"><h5><%=formatter.format(analytics.totalCost)%></h5></span>
										<span class="description-text">TOTAL COST</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-3 col-xs-6">
									<div class="description-block border-right">
										<span class="description-percentage text-blue"><h5><%=formatter.format(analytics.totalprofit)%></h5></span>
										<span class="description-text">TOTAL PROFIT</span>
									</div>
									<!-- /.description-block -->
								</div>
								<!-- /.col -->
								<div class="col-sm-3 col-xs-6">
									<div class="description-block">
										<span class="description-percentage text-blue"><h5><%=formatter.format(analytics.goalcompletion)%></h5></span>
										<span class="description-text">GOAL COMPLETIONS</span>
									</div>
									<!-- /.description-block -->
								</div>
							</div>
							<!-- /.row -->
						</div>
						<!-- /.box-footer -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row --> <!-- Main row -->
			<div class="row">
				<!-- MAP & BOX PANE -->
				<div class="row">

					<div class="col-md-4">
						<!-- USERS LIST -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Latest Members</h3>

								<div class="box-tools pull-right">
									<span class="label label-danger">8 New Members</span>
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<ul class="users-list clearfix">
									<li><img src="dist/img/user1-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Ankit</a> <span
										class="users-list-date">Today</span></li>
									<li><img src="dist/img/user8-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Anurag</a> <span
										class="users-list-date">Yesterday</span></li>
									<li><img src="dist/img/user7-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Anshul</a> <span
										class="users-list-date">12 Jan</span></li>
									<li><img src="dist/img/user6-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Huma</a> <span
										class="users-list-date">12 Jan</span></li>
									<li><img src="dist/img/user2-160x160.jpg" alt="User Image">
										<a class="users-list-name" href="#">Manan</a> <span
										class="users-list-date">13 Jan</span></li>
									<li><img src="dist/img/user5-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Srija</a> <span
										class="users-list-date">14 Jan</span></li>
									<li><img src="dist/img/user4-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Monapati</a> <span
										class="users-list-date">15 Jan</span></li>
									<li><img src="dist/img/user3-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Geetika</a> <span
										class="users-list-date">15 Jan</span></li>
								</ul>
								<!-- /.users-list -->
							</div>
							<!-- /.box-footer -->
						</div>
						<!--/.box -->
					</div>
					<!-- /.col -->

					<div class="col-md-4">

						<!-- TABLE: LATEST ORDERS -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Latest Orders</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>Order ID</th>
												<th>Item</th>
												<th>Status</th>
											</tr>
										</thead>
										<tbody>

											<%
												for (int i = 0; i < orders.size(); i++) {

													if (orders.get(i).status.equals("Delivered")) {
														out.println("<tr><td><a href=>" + orders.get(i).order_id
																+ "</a></td><td>" + orders.get(i).order_name
																+ "</td><td><span class='label label-success'>"
																+ orders.get(i).status + "</span></td></tr>");
													} else {
														out.println("<tr><td><a href=>" + orders.get(i).order_id
																+ "</a></td><td>" + orders.get(i).order_name
																+ "</td><td><span class='label label-warning'>"
																+ orders.get(i).status + "</span></td></tr>");
													}
												}
											%>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>

							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<div class="col-md-4">

						<!-- PRODUCT LIST -->
						<div class="box box-primary">
							<div class="box-header with-border">
								<h3 class="box-title">Recently Added Products</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<ul class="products-list product-list-in-box">
									<%
										for (int i = 0; i < products.size(); i++) {
											out.print("<li class=item><div class='product-img'><img src=dist/img/"
													+ products.get(i).pic_id
													+ " alt='Product Image'></div><div class=product-info><a href= class=product-title>"
													+ products.get(i).name
													+ " <span class='label label-warning pull-right'>Rs.1800</span></a> <span class='product-description'>"
													+ products.get(i).desc + ". </span></div></li>");
										}
									%>
								</ul>
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.row --> </section>
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
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- SmartCart App -->
	<script src="dist/js/SmartCart.js"></script>
	<!-- Sparkline -->
	<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
	<!-- jvectormap -->
	<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS 1.0.1 -->
	<script src="plugins/chartjs/Chart.min.js"></script>
	<!-- SmartCart dashboard demo (This is only for demo purposes) -->
	<script src="dist/js/pages/dashboard2.js"></script>
	<!-- SmartCart for demo purposes -->
	<script src="dist/js/demo.js"></script>


</body>
</html>
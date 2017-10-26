<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="oscs.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SmartCart | Invoice</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">


</head>
<body onload="window.print();">
	<div class="wrapper">
		<!-- Main content -->
		<div class="invoice">
			<!-- title row -->
			<div class="row">
				<div class="col-xs-12">
					<%
						JDBCCon dj = new JDBCCon();
						ArrayList<ArrayList<String>> values = dj
								.displayInvoice((String) session.getAttribute("uname"));
					%>
					<h2 class="page-header">
						<i class="fa fa-globe"></i> SmartCart <small class="pull-right">Date:
							<%=values.get(0).get(5)%></small>
					</h2>
				</div>
				<!-- /.col -->
			</div>
			<!-- info row -->
			<div class="row invoice-info">
				<div class="col-sm-4 invoice-col">
					From
					<address>
						<strong>Smart Cart</strong><br> LTI MAHAPE<br> MUMBAI
						MAHARASHTRA<br> Phone: (804) 123-5432<br> Email:
						smartcart@lntinfotech.com
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					To
					<address>

						<%!ArrayList<String> address = new ArrayList<String>();
	ArrayList<String> detail = new ArrayList<String>();%>
						<%
							address = dj.fetchAddressForAnOrder((String) session.getAttribute("uname"),values.get(0).get(0));
							detail = dj.fetchuser((String) session.getAttribute("uname"));
						%>
						<strong><%=detail.get(0)%> <%=detail.get(1)%></strong><br>
						<%
							if (address.size() <= 1) {
						%>
						<%=address.get(0)%>
						<%
							} else {
						%>
						<%
							for (int i = 1; i < address.size(); i++) {
						%>
						<%=address.get(i)%>
						<hr>
						<br />
						<%
							}
							}
						%>
					</address>
				</div>
				<!-- /.col -->
				<div class="col-sm-4 invoice-col">
					<br> <b>Order ID:</b> <%=values.get(0).get(0) %> <br> <b>Payment Due:</b>
					<%=values.get(0).get(5)%><br>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

			<!-- Table row -->
			<div class="row">
				<div class="col-xs-12 table-responsive">
					<table class="table table-striped">

						<thead>
							<tr>
								<th>Qty</th>
								<th>Product</th>
								<th>Product ID</th>
								<th>Description</th>
								<th>Subtotal</th>
							</tr>
						</thead>
						<tbody>
							<%
								double nettotal = 0;
								double total = 0;

								for (int i = 0; i < values.size(); i++) {
									double cost = (Double.parseDouble(values.get(i).get(4))) * 0.82;
									
									nettotal += cost;
									total += Double.parseDouble(values.get(i).get(4));
									out.print("<tr><td>" + values.get(i).get(3) + "</td><td>"
											+ values.get(i).get(1) + "</td><td>"
											+ values.get(i).get(6) + "</td><td>"
											+ values.get(i).get(2) + "</td><td>Rs." + formatter.format(cost)
											+ "</td></tr>");
								}
							%>
						</tbody>
					</table>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
<hr>
<%! DecimalFormat formatter = new DecimalFormat("#0.00"); %>
			<div class="row">
				<!-- accepted payments column -->
				<div class="col-xs-6">
					<p class="lead">
						Amount Due
						<%=values.get(0).get(5)%></p>

					<div class="table-responsive">
						<table class="table">
							<tr>
								<th style="width: 50%">Subtotal:</th>
								<td>Rs.<%= formatter.format(nettotal)%></td>
							</tr>
							<tr>
								<th>Tax (18%)</th>
								<td>Rs.<%=formatter.format(total - nettotal)%></td>
							</tr>
							<tr>
								<th>Shipping:</th>
								<td>Rs.0 (Promotional Offer)</td>
							</tr>
							<tr>
								<th>Total:</th>
								<td>Rs.<%=formatter.format(total)%></td>
							</tr>
						</table>
					</div>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.content -->
	</div>
	<!-- ./wrapper -->
</body>
</html>

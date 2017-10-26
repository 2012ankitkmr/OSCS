package oscs;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.containers.Cart_details_container;
import com.containers.Product_Description_container;
import com.containers.Products_container;
import com.containers.category_Container;
import com.containers.department_Container;

import java.util.*;


public class JDBCCon {


	//fetch product detail for nav bar


	//1. delete items from user cart after a successful purchase

	public void UpdatePassword(String uname,String pass)
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement ps = con.prepareStatement("UPDATE USERS SET password='"+md5(pass)+"' WHERE user_id='"+uname+"'");
			ps.executeUpdate();
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
	public int forgetPass(String uname,Long mobile_no){
		int ret =0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM Users WHERE user_id='"+uname+"' AND mobile_no="+mobile_no);
			while(rs.next())
			{
				ret = rs.getInt(1);
			}
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return ret;

	}


	public int update_ItemFromCart(String uname)
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement st = con.createStatement();
			PreparedStatement stmt= con.prepareStatement("DELETE FROM Orders WHERE cust_id=? and order_id=?");
			PreparedStatement stmt2 = con.prepareStatement("DELETE FROM order_detail WHERE order_detail.order_id IN (SELECT order_id FROM orders WHERE orders.cust_id=?) AND order_detail.order_id=?");
			ResultSet rs = st.executeQuery("SELECT order_id FROM Orders WHERE cust_id='"+uname+"' ORDER BY order_id DESC");
			String order_id = "";
			while(rs.next())
			{
				order_id = rs.getString(1);
				break;
			}
			stmt2.setString(1, uname);
			stmt2.setString(2, order_id);
			stmt2.executeUpdate();	
			stmt.setString(1, uname);
			stmt.setString(2, order_id);
			stmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return 0;

	}




	public ArrayList<String> getAddress(String uname){
		ArrayList<String> al = new ArrayList<String>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement st = con.prepareStatement("SELECT * FROM Address WHERE user_id =?");
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE user_id =?");
			PreparedStatement st2 = con.prepareStatement("SELECT city FROM Zipcode WHERE zipcode=?");


			stmt.setString(1,uname);
			st.setString(1, uname);

			ResultSet rs2 = stmt.executeQuery();
			ResultSet rs = st.executeQuery();
			System.out.println("gdfgdf");


			while(rs2.next())
			{	al.add(rs2.getString(2)+" "+rs2.getString(3));
			al.add(String.valueOf(rs2.getLong(8)));
			//System.out.println(rs2.getString(1)+rs2.getString(2)+","+String.valueOf(rs2.getLong(8)));
			}

			while(rs.next())
			{	
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
				st2.setInt(1, rs.getInt(6));
				ResultSet rss = st2.executeQuery();
				while(rss.next())
				{
					al.add(rss.getString(1));
				}

				al.add(rs.getString(5));
				al.add(String.valueOf(rs.getInt(6)));

			}


			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return al;



	}




	//6. display the shopping cart from the database
	public ArrayList<String> showProduct(String cat_id) 
	{
		ArrayList<String> al = new ArrayList<String>();

		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM Product WHERE category_id=?");
			stmt.setString(1,cat_id);
			ResultSet rs=stmt.executeQuery();
			while(rs.next())
			{
				al.add(rs.getString(1));
				al.add(rs.getString(3));//product_id  al=0 al=6
				al.add(rs.getString(5));
				al.add(String.valueOf(rs.getInt(6)));//quantity al=3,9

			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return al;
	}

	//fetch address detail
	public ArrayList<String> fetchuser(String uname) 
	{

		ArrayList<String> user = new ArrayList<String>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement st = con.prepareStatement("SELECT first_name,last_name FROM Users WHERE user_id = ?");



			st.setString(1,uname);

			ResultSet rs = st.executeQuery();
			while(rs.next())
			{	

				user.add(rs.getString(1));
				user.add(rs.getString(2));
			}
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}

	//fetch address detail
	public ArrayList<String> fetchAddressForAnOrder(String uname,String oid) 
	{

		ArrayList<String> address = new ArrayList<String>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement st = con.prepareStatement("SELECT * FROM Address WHERE user_id = ?");
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM Ship_address WHERE user_id = ? AND order_id ='"+oid+"'");



			stmt.setString(1,uname);
			st.setString(1, uname);
			String addr;
			ResultSet rs = stmt.executeQuery();
			ResultSet rs2 = st.executeQuery();


			while(rs2.next())
			{	addr= rs2.getString(2)+","+rs2.getString(3)+".<br />"+rs2.getString(4)+"<br />"+rs2.getString(5)+"<br /> Pincode:"+rs2.getInt(6);
			address.add(addr);
			}

			while(rs.next())
			{	addr= rs.getString(5)+","+rs.getString(6)+".<br />"+rs.getString(7)+"<br />"+rs.getString(8)+"<br />"+rs.getString(9)+"<br /> Pincode:"+rs.getInt(10);
			address.add(addr);
			}
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return address;
	}
	
	//returns all addresses
	public ArrayList<String> fetchAddress(String uname) 
	{

		ArrayList<String> address = new ArrayList<String>();
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement st = con.prepareStatement("SELECT * FROM Address WHERE user_id = ?");
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM Ship_address WHERE user_id = ?");



			stmt.setString(1,uname);
			st.setString(1, uname);
			String addr;
			ResultSet rs = stmt.executeQuery();
			ResultSet rs2 = st.executeQuery();


			while(rs2.next())
			{	addr= rs2.getString(2)+","+rs2.getString(3)+".<br />"+rs2.getString(4)+"<br />"+rs2.getString(5)+"<br /> Pincode:"+rs2.getInt(6);
			address.add(addr);
			}

			while(rs.next())
			{	addr= rs.getString(5)+","+rs.getString(6)+".<br />"+rs.getString(7)+"<br />"+rs.getString(8)+"<br />"+rs.getString(9)+"<br /> Pincode:"+rs.getInt(10);
			address.add(addr);
			}
			con.close();

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return address;
	}


	//1. fetch user cart detail

	public ArrayList<String> fetchUserCart(String uname) 
	{
		ArrayList<String> cartDetail = new ArrayList<String>();
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement sc = con.createStatement();

			ResultSet rs= sc.executeQuery("SELECT cart_id,COUNT(*),SUM(sub_total) FROM Shop_cart GROUP BY cart_id");



			while(rs.next())
			{

				if(rs.getString(1).equals(uname))
				{

					cartDetail.add(rs.getString(2));
					String temp="Rs. "+(String)rs.getString(3);
					cartDetail.add(temp);
				}
			}

			con.close();
		}
		catch(Exception e)
		{
			System.out.println("Error!");
		}
		return	cartDetail;
	}


	//1. delete items from user cart after a successful purchase
	public int delete_ItemFromCart(String uname)
	{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt= con.prepareStatement("DELETE FROM Shop_cart WHERE cart_id=?");
			PreparedStatement stmt2 = con.prepareStatement("UPDATE product SET QUANTITY= QUANTITY-? WHERE product_id= ?");


			PreparedStatement st = con.prepareStatement("SELECT * FROM shop_cart,product WHERE shop_cart.product_id=product.product_id AND shop_cart.cart_id=?");
			/*Statement or = con.createStatement();
				PreparedStatement order = con.prepareStatement("INSERT INTO Orders(order_id,user_name,user_id,status) VALUES(?,?,?,?)");
				PreparedStatement order_detail = con.prepareStatement("INSERT INTO Order_detail(order_id,product_id,quantity,unit_cost,product_name,sub_total) VALUES(?,?,?,?,?,?)");
			 */st.setString(1, uname);
			 ResultSet rs = st.executeQuery();
			 /*	ResultSet rss = or.executeQuery("SELECT COUNT(*) FROM Orders"); 
						g
						System.out.println("inside");
			  */
			 while(rs.next() )
			 {
				 /*	
							while(rss.next()){
									String order_id= "OR0"+String.valueOf(rss.getInt(1)+1);
									order.setString(1,order_id);
									order_detail.setString(1,order_id);
										}
							order.setString(2,rs.getString(2));
							order.setString(3,uname);
							order.setString(4, "Placed");
							order_detail.setString(2, rs.getString(1));
							order_detail.setInt(3, Integer.parseInt(rs.getString(3)));
							order_detail.setDouble(4, Double.parseDouble(rs.getString(11)));
							order_detail.setString(5, rs.getString(10));
							order_detail.setDouble(6, Double.parseDouble(rs.getString(4)));
				  */			if(rs.getString(2).equals(uname))
				  {
					  stmt2.setString(1, rs.getString(3));
					  stmt2.setString(2, rs.getString(1));
					  stmt2.executeUpdate();				

				  }
			 }

			 stmt.setString(1, uname);
			 stmt.executeUpdate();
			 /*order.executeUpdate();
				order_detail.executeUpdate();

			  */
			 con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		return 0;

	}
	protected String order_id;
	//2. insert shipping address of user
	public int insert_ShipAddress(String[] data)
	{

		try{
			System.out.println("insert ship address");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt=con.prepareStatement("INSERT INTO Ship_Address VALUES(?,?,?,?,?,?,?,?,?,?)");

			PreparedStatement st = con.prepareStatement("SELECT * FROM shop_cart,product WHERE shop_cart.product_id=product.product_id AND shop_cart.cart_id=?");
			Statement or = con.createStatement();
			PreparedStatement order = con.prepareStatement("INSERT INTO Orders(order_id,cust_id,status) VALUES(?,?,?)");
			PreparedStatement order_detail = con.prepareStatement("INSERT INTO Order_detail(order_id,product_id,quantity,unit_cost,product_name,sub_total) VALUES(?,?,?,?,?,?)");

			ResultSet rss = or.executeQuery("SELECT COUNT(*) FROM Orders"); 

			st.setString(1, data[0]);

			ResultSet rs = st.executeQuery();
			while(rss.next()){
				order_id= "OR10"+String.valueOf(rss.getInt(1)+1);
				order.setString(1,order_id);
				stmt.setString(2,order_id);

				System.out.println(order_id+",");
			}
			order.setString(2,data[0]);
			order.setString(3, "Confirmed");

			order.executeUpdate();
			while(rs.next() )
			{
				order_detail.setString(1,order_id);
				order_detail.setString(2, rs.getString(1));
				order_detail.setInt(3, Integer.parseInt(rs.getString(3)));
				order_detail.setDouble(4, Double.parseDouble(rs.getString(11)));
				order_detail.setString(5, rs.getString(10));
				order_detail.setDouble(6, Double.parseDouble(rs.getString(4)));
				order_detail.executeUpdate();

			}




			stmt.setString(1, data[0]);
			int k=1;
			for(int i=3;i<=10;i++) //users
			{

				if(i==4 || i==10)
				{
					stmt.setLong(i, Long.parseLong(data[k]));
				}
				else 
				{
					stmt.setString(i,data[k]);
				}
				k++;
			}


			stmt.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}	



		return 0;

	}


	public static String md5(String input) {

		String md5 = null;

		if(null == input) return null;


		MessageDigest digest;
		try {
			digest = MessageDigest.getInstance("MD5");
			digest.update(input.getBytes(), 0, input.length());

			//Converts message digest value in base 16 (hex) 
			md5 = new BigInteger(1, digest.digest()).toString(16);
		}
		catch (NoSuchAlgorithmException e) {

			e.printStackTrace();
		}

		return md5;
	}


	//3. inserting the user details and his/her address in database
	public int RegisterUser(String s[]) 
	{
		int r1=0,r2=0,r3=0;
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt=con.prepareStatement("INSERT INTO Users VALUES(?,?,?,?,?,?,TO_DATE(?),?,?)");
			PreparedStatement stmt2=con.prepareStatement("INSERT INTO Address VALUES(?,?,?,?,?,?)");
			PreparedStatement stmt3=con.prepareStatement("INSERT INTO Zipcode VALUES(?,?)");
			Statement zipstmt =con.createStatement();
			ResultSet rs = zipstmt.executeQuery("SELECT COUNT(*) FROM Zipcode WHERE Zipcode="+s[13]);
			int k=0;

			con.setAutoCommit(false);

			for(int i=1;i<=8;i++) //users
			{

				if(i==8)
				{
					stmt.setLong(i, Long.parseLong(s[k]));
				}
				else if(i==6)
				{
					stmt.setString(i,md5(s[k]));

				}
				else
				{

					stmt.setString(i,s[k]);
				}

				k++;
			}
			stmt.setInt(9,0);

			r1= stmt.executeUpdate();

			while(rs.next())
			{
				r3=rs.getInt(1);
			}
			if(r3==0)
			{
				//insert into zipcode
				stmt3.setString(2, s[11]);
				stmt3.setInt(1, Integer.parseInt(s[13]));
				r3 = stmt3.executeUpdate();
			}

			//insert into address
			stmt2.setString(1,s[3]);

			for(int i=2;i<=6;i++) 
			{
				if(k==11)
				{	k++;
				i--;
				continue;
				}
				else if(i==6)
					stmt2.setLong(i,Long.parseLong(s[k]));
				else 
					stmt2.setString(i,s[k]);

				k++;
			}

			r2 = stmt2.executeUpdate();

			con.commit();
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return (r1&r2&r3);
	}

	//4. add product to cart
	public int add_product(String product_id,String uname) 
	{

		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt=con.prepareStatement("INSERT INTO Shop_cart(product_id,cart_id,quantity,sub_total) VALUES(?,?,?,?)");		
			Statement sc = con.createStatement();

			ResultSet rs= sc.executeQuery("SELECT * FROM Product");


			while(rs.next())
			{

				if(rs.getString(1).equals(product_id))
				{
					stmt.setString(1, rs.getString(1));
					stmt.setString(2,uname);
					stmt.setInt(3,1);
					stmt.setDouble(4, rs.getDouble(6));

				}
			}
			stmt.executeUpdate();
			con.close();
		}
		catch(Exception e)
		{
			return -1;
		}
		return 0;
	}


	//5. login verification
	public int login_verify (String s,String t) 
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT user_id,password FROM Users");
			while(rs.next())

			{
				String yt=rs.getString(1);
				String yy=rs.getString(2);
				if(yt.equals(s) && yy.equals(t))
					return 1;
			}


			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return 0;
	}


	//6. display the shopping cart from the database
	public ArrayList<String> displayCart(String uname) 
	{
		ArrayList<String> al = new ArrayList<String>();

		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT Shop_cart.product_id,Shop_cart.cart_id,Product.pic_id,Product.product_name,Shop_cart.quantity ,Product.unit_price,Shop_cart.sub_total FROM Shop_cart,Product WHERE Shop_cart.product_id=Product.product_id");
			while(rs.next())
			{
				if(uname.equals(rs.getString(2)))
				{
					al.add(rs.getString(1));//product_id  al=0 al=6
					al.add(rs.getString(3));//pic_id  al=1,7
					al.add(rs.getString(4));//prod name al=2,8
					al.add(String.valueOf(rs.getInt(5)));//quantity al=3,9
					al.add(String.valueOf(rs.getDouble(6)));//unitcost al=4,10
					al.add(String.valueOf(rs.getDouble(7)));//sub_tota al=5,11

				}
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return al;
	}


	//display receipt
	public ArrayList<String> displayReceipt(String uname) 
	{
		ArrayList<String> al = new ArrayList<String>();
		String s="";
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement ps=con.prepareStatement("SELECT o1.cust_id,o1.order_id,o2.product_name,o2.unit_cost,o2.quantity,o2.sub_total,o1.date_ordered FROM Orders  o1, Order_detail  o2 WHERE o1.order_id =o2.order_id AND cust_id=? ORDER BY o2.order_id DESC");

			ps.setString(1,uname);
			ResultSet rs = ps.executeQuery();

			int k=1;
			System.out.println("String"+s);
			while(rs.next())
			{
				if(k>0)
				{
					s=rs.getString(2);
					k=-1;
				}
				if(s.equals(rs.getString(2)))
				{ 
					al.add(rs.getString(2));//order_id  al=0 al=8
					al.add(rs.getString(3));//product_name  al=1,9
					al.add(String.valueOf(rs.getInt(5)));  //quantity
					al.add(String.valueOf(rs.getDouble(6)));//sub_total al=4 ,12
					al.add(String.valueOf(rs.getDate(7)));//ordered_date al=5,13
				}
				else{

				}

			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return al;
	}
	// 7. display orders


	//display invoice
	public ArrayList<ArrayList<String>> displayInvoice(String uname) 
	{
		ArrayList<ArrayList<String>> ret = new ArrayList<>();

		String s="";
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT o1.cust_id,o1.order_id,o2.product_name,o2.unit_cost,o2.quantity,o2.sub_total,o1.date_ordered,o2.product_id FROM Orders  o1, Order_detail  o2 WHERE o1.order_id =o2.order_id AND cust_id='"+uname+"' ORDER BY o1.order_id DESC");
			int k=1;
			while(rs.next())
			{
				ArrayList<String> al = new ArrayList<>();


				if(k>0)
				{
					s=rs.getString(2);
					k=-1;
				}
				if(s.equals(rs.getString(2) ))
				{

					al.add(rs.getString(2));//order_id  al=0 al=8
					al.add((rs.getString(3).split(" "))[0]);//product_name  al=1,9
					al.add(rs.getString(3)); // al 2 brief desc
					al.add(String.valueOf(rs.getInt(5)));  // al 3 quantity
					al.add(String.format("%.2f", rs.getDouble(6)));//sub_total al=4 
					al.add(String.valueOf(rs.getDate(7)));//ordered_date al=5
					al.add(rs.getString(8)); // product_id  al 6
					ret.add(al);
				}
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return ret;
	}



	public ArrayList<String> displayOrders(String uname) 
	{
		ArrayList<String> al = new ArrayList<String>();

		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("SELECT o1.cust_id,o1.order_id,o2.product_name,o2.unit_cost,o2.quantity,o2.sub_total,o1.date_ordered,sa.address1,sa.address2,sa.city,sa.state,sa.zipcode,o1.status FROM Orders  o1, Order_detail  o2, Ship_address sa WHERE o1.order_id =o2.order_id  AND sa.user_id= o1.cust_id AND sa.order_id=o1.order_id");
			PreparedStatement ps = con.prepareStatement("UPDATE Orders SET Status='Delivered' WHERE cust_id=? ");

			java.sql.Date ourJavaDateObject = new java.sql.Date(Calendar.getInstance().getTime().getTime());


			while(rs.next())
			{

				if(uname.equals(rs.getString(1) ))
				{


					al.add(rs.getString(2));//order_id  al=0 al=8
					al.add(rs.getString(3));//product_name  al=1,9
					al.add(String.valueOf(rs.getDouble(4)));//unit_cost al=2,10
					al.add(String.valueOf(rs.getInt(5)));//quantity al=3,11
					al.add(String.valueOf(rs.getDouble(6)));//sub_total al=4 ,12
					al.add(String.valueOf(rs.getDate(7)));//ordered_date al=5,13
					String addr= rs.getString(8)+","+rs.getString(9)+".<br />"+rs.getString(10)+"<br />"+rs.getString(11)+"<br /> Pincode:"+rs.getInt(12);
					al.add(addr);
					al.add(rs.getString(13));//order_staus al=7,15

					//get time from date
					String t= String.valueOf(ourJavaDateObject.getTime());
					String u= String.valueOf(rs.getDate(7).getTime());


					long diff_date =Long.parseLong(t)-Long.parseLong(u);
					//check for difference
					System.out.println(t+","+u);
					if((diff_date/60000)>=1)
					{
						ps.setString(1,uname);
						ps.executeUpdate();
					}
				}
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return al;
	}

	// 8. update cart
	public int update_item(String pro_id,String uname, int quantity) 
	{
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt=con.prepareStatement("UPDATE Shop_cart SET quantity=? , sub_total = ? WHERE cart_id=? AND product_id=?");		

			Statement sc= con.createStatement();
			ResultSet rs=sc.executeQuery("select product_id,quantity,unit_price from Product ");

			while(rs.next()){

				if(rs.getString(1).equals(pro_id))
				{
					if(rs.getInt(2) < quantity)
					{
						return -1;
					}

					stmt.setInt(1, quantity);
					stmt.setDouble(2, quantity*rs.getDouble(3));
					stmt.setString(3,uname);
					stmt.setString(4, pro_id);
				}}

			stmt.executeUpdate();

			con.close();
		}
		catch(Exception e)
		{
		}
		return 0;
	}





	// 9. delete  cart Item
	public void delete_item(String pro_id,String uname)
	{
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			PreparedStatement stmt=con.prepareStatement("DELETE Shop_cart WHERE cart_id=? AND product_id=?");		

			stmt.setString(1,uname);
			stmt.setString(2,pro_id);
			stmt.executeUpdate();
			con.close();

		}
		catch(Exception e)
		{
		}
	}


	public  ArrayList<department_Container> getDepartments() throws SQLException
	{
		ArrayList<department_Container> temp = new ArrayList<>();
		//loading drivers
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "SELECT d.dept_id,d.dept_name,count(dept_name) FROM Department d,Category c  WHERE d.dept_id=c.dept_id group by d.dept_id,d.dept_name ORDER BY d.dept_id,d.dept_name ";

			ArrayList<department_Container> dlist = new ArrayList<>();

			ResultSet rs = stmt.executeQuery(sql);	 

			while (rs.next()) {
				department_Container dDetail = new department_Container();
				dDetail.dept_id=rs.getString(1);
				dDetail.dname = rs.getString(2);
				dDetail.count = rs.getInt(3);
				dlist.add(dDetail);
			}
			con.close();
			return dlist;



		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return temp;

	}

	public ArrayList<category_Container> getCategories() throws SQLException
	{
		ArrayList<category_Container> temp = new ArrayList<>();
		//loading drivers
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "select * from  category order by dept_id,category_id";

			ArrayList<category_Container> depts = new ArrayList<>();
			ResultSet rs = stmt.executeQuery(sql);	 

			while (rs.next()) {
				category_Container cDetail = new category_Container();
				cDetail.c_id =rs.getString(1);
				cDetail.c_name = rs.getString(3);

				depts.add(cDetail);

			}
			con.close();
			return depts;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return temp;

	}



	public  Cart_details_container showcart() throws SQLException
	{
		Cart_details_container temp = new Cart_details_container();
		//loading drivers
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "SELECT COUNT(*),SUM(sub_total) FROM Shop_cart WHERE cart_id = 'ankit_1'";
			ResultSet rs = stmt.executeQuery(sql);

			Cart_details_container cartDetails = new Cart_details_container();

			while (rs.next()) {
				cartDetails.cart_number=rs.getInt(1);
				cartDetails.cart_amount_sum=rs.getDouble(2);

			}
			con.close();
			return cartDetails;

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;

	}

	int MAXSIZE=100;
	public  ArrayList<Products_container> showProds() throws SQLException
	{
		ArrayList<Products_container> temp = new ArrayList<Products_container>();
		//loading drivers
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "SELECT * FROM Product order by product_id";
			Products_container[] templist = new Products_container[MAXSIZE];

			ArrayList<Products_container> plist = new ArrayList<>();

			ResultSet rs = stmt.executeQuery(sql);	 
			int cnt=0;		 
			while (rs.next()) {
				Products_container pDetail = new Products_container();
				pDetail.p_name = rs.getString(5);
				pDetail.price = rs.getDouble(6);
				pDetail.pic_id=rs.getString(3);
				pDetail.p_id = rs.getString(1);
				templist[Integer.parseInt(pDetail.p_id.substring(3))-1]=pDetail;
				cnt++;
				// System.out.println("Asd "+(Integer.parseInt(pDetail.p_id.substring(3))-1));
			}
			for(int i = 0;i<cnt;i++)
			{ plist.add(i,templist[i]);


			}
			con.close();
			return plist;

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return temp;

	}


	public  Product_Description_container showdesc(String pid) throws SQLException
	{
		Product_Description_container temp = new Product_Description_container();
		//loading drivers
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// connection
			Connection con= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");


			Statement stmt=con.createStatement();
			String sql = "SELECT * FROM ProductDescription,product WHERE product.product_id = '"+pid+"' AND product.product_id=ProductDescription.product_id";
			ResultSet rs = stmt.executeQuery(sql);

			Product_Description_container pDetail = new Product_Description_container();

			while (rs.next()) {
				pDetail.pid=rs.getString(1); 
				pDetail.p_name = rs.getString(2);
				pDetail.p_br_desc=rs.getString(3);
				pDetail.p_desc = rs.getString(4);
				pDetail.p_brand=rs.getString(5);
				pDetail.p_type = rs.getString(6);
				pDetail.p_feature=rs.getString(7);
				pDetail.pic_id =  rs.getString(10);
				pDetail.qty = rs.getInt(14);
				pDetail.price =  rs.getDouble(13);

			}
			con.close();
			return pDetail;



		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return temp;

	}




	public ArrayList<String> retreive_data() 
	{
		ArrayList<String> pl = new ArrayList<String>();
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");

			Statement stmt1=con.createStatement();

			ResultSet rs=stmt1.executeQuery("SELECT * from Product");

			while(rs.next())
			{
				pl.add(rs.getString(1));
				pl.add(rs.getString(3));
				pl.add(rs.getString(5));
				pl.add(rs.getString(6));	
			}			      	
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return pl;
	}
	public ArrayList<String> retreive_department() 
	{
		ArrayList<String> dl = new ArrayList<String>();
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");

			Statement stmt1=con.createStatement();

			ResultSet rs=stmt1.executeQuery("SELECT * from Department");

			while(rs.next())
			{

				dl.add(rs.getString(1));
				dl.add(rs.getString(2));
				dl.add(rs.getString(3));	
			}			      	
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return dl;
	}


	public ArrayList<String> retreive_category(String dep_id) 
	{
		ArrayList<String> cl = new ArrayList<String>();
		try{

			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");

			Statement stmt1=con.createStatement();

			ResultSet rs=stmt1.executeQuery("SELECT * from Category");

			while(rs.next())
			{

				if(dep_id.equals(rs.getString(2)))
				{
					cl.add(rs.getString(1));
					cl.add(rs.getString(3));
					cl.add(rs.getString(4));	


				}
			}			      	
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return cl;
	}


	public ArrayList<String> SearchProduct(String pro_name, String search_type)
	{
		String s=null;
		ArrayList<String> sl = new ArrayList<String>();
		try{


			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","scott","tiger");
			Statement stmt=con.createStatement();
			if(search_type.equals("ALL"))
			{
				s="SELECT * FROM Product WHERE LOWER(product_name) like '%"+pro_name.toLowerCase()+"%' ";
			}
			else
			{
				s="SELECT * from Product where LOWER(product_name) like '%"+pro_name.toLowerCase()+"%' AND dept_id='"+search_type+"' ";
			}


			ResultSet rs=stmt.executeQuery(s);


			while(rs.next())
			{

				sl.add(rs.getString(1));
				sl.add(rs.getString(3));
				sl.add(rs.getString(5));

				sl.add(rs.getString(6));
			}			      	
			con.close();
		}
		catch(Exception e)
		{

			System.out.println("Exception occured");

		}
		return sl;
	}


}

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
	<div class="span6"><strong></strong></div>
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
						<ul id="topMenu" style="text-align:right; margin:15px;">
<% if( (session.getAttribute("uname"))!=null)
	{ %>
<li class="dropdown" style="color:white; margin-top:15px;" > 
<% out.println("Hello, "+session.getAttribute("uname")); %>
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
<!-- Sidebar ================================================== 
	<div id="sidebar" class="span3">
		<div class="well well-small"><a id="myCart" href="product_summary.html"><img src="themes/images/ico-cart.png" alt="cart">3 Items in your cart  <span class="badge badge-warning pull-right"></span></a></div>
		<ul id="sideManu" class="nav nav-tabs nav-stacked">
			<li class="subMenu open"><a> ELECTRONICS [230]</a>
				<ul>
				<li><a class="active" href="products.html"><i class="icon-chevron-right"></i>Cameras (100) </a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Computers, Tablets & laptop (30)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Mobile Phone (80)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Sound & Vision (15)</a></li>
				</ul>
			</li>
			<li class="subMenu"><a> CLOTHES [840] </a>
			<ul style="display:none">
				<li><a href="products.html"><i class="icon-chevron-right"></i>Women's Clothing (45)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Women's Shoes (8)</a></li>												
				<li><a href="products.html"><i class="icon-chevron-right"></i>Women's Hand Bags (5)</a></li>	
				<li><a href="products.html"><i class="icon-chevron-right"></i>Men's Clothings  (45)</a></li>
				<li><a href="products.html"><i class="icon-chevron-right"></i>Men's Shoes (6)</a></li>												
				<li><a href="products.html"><i class="icon-chevron-right"></i>Kids Clothing (5)</a></li>												
				<li><a href="products.html"><i class="icon-chevron-right"></i>Kids Shoes (3)</a></li>												
			</ul>
			</li>
			
			<li><a href="products.html">HEALTH & BEAUTY [18]</a></li>
			<li><a href="products.html">SPORTS & LEISURE [58]</a></li>
			
		</ul>
		<br/>
		  <div class="thumbnail">
			<img src="themes/images/products/panasonic.jpg" alt="Smartcart panasonoc New camera"/>
			<div class="caption">
			  <h5>Panasonic</h5>
				<h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="product_summary.html">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">Rs.222.00</a></h4>
			</div>
		  </div><br/>
			<div class="thumbnail">
				<img src="themes/images/products/kindle.png" title="Smartcart New Kindel" alt="Smartcart Kindel">
				<div class="caption">
				  <h5>Kindle</h5>
				    <h4 style="text-align:center"><a class="btn" href="product_details.html"> <i class="icon-zoom-in"></i></a> <a class="btn" href="product_summary.html">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">Rs.222.00</a></h4>
				</div>
			  </div><br/>
			
			 
	</div>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Terms and Conditions</li>
    </ul>
	<h3> Terms and Conditions</h3>	
	<hr class="soft"/>

<p align="justify">This document is an electronic record in terms of Information Technology Act, 2000 and rules there under as applicable and the amended provisions pertaining to electronic records in various statutes as amended by the Information Technology Act, 2000. This electronic record is generated by a computer system and does not require any physical or digital signatures.
This document is published in accordance with the provisions of Rule 3 (1) of the Information Technology (Intermediaries guidelines) Rules, 2011 that require publishing the rules and regulations, privacy policy and Terms of Use for access or usage of www.Smartcart.com website.
The domain name www.Smartcart.com (hereinafter referred to as "Website") is owned by Smartcart Internet Private Limited a company incorporated under the Companies Act, 1956 with its registered office at Vaishnavi Summit, Ground Floor, 7th Main, 80 feet Road, 3rd Block, Koramangala Industrial Layout, Next to Wipro office, Corporation Ward No. 68, Koramangala, Bangalore - 560 034, Karnataka, India (hereinafter referred to as "Smartcart").
Your use of the Website and services and tools are governed by the following terms and conditions ( "Terms of Use" ) as applicable to the Website including the applicable policies which are incorporated herein by way of reference. If You transact on the Website, You shall be subject to the policies that are applicable to the Website for such transaction. By mere use of the Website, You shall be contracting with Smartcart Internet Private Limited and these terms and conditions including the policies constitute Your binding obligations, with Smartcart.
For the purpose of these Terms of Use, wherever the context so requires "You" or "User" shall mean any natural or legal person who has agreed to become a buyer on the Website by providing Registration Data while registering on the Website as Registered User using the computer systems. Smartcart allows the User to surf the Website or making purchases without registering on the Website. The term "We" , "Us" , "Our" shall mean Smartcart Internet Private Limited.
When You use any of the services provided by Us through the Website, including but not limited to, (e.g. Product Reviews, Seller Reviews), You will be subject to the rules, guidelines, policies, terms, and conditions applicable to such service, and they shall be deemed to be incorporated into this Terms of Use and shall be considered as part and parcel of this Terms of Use. We reserve the right, at Our sole discretion, to change, modify, add or remove portions of these Terms of Use, at any time without any prior written notice to You. It is Your responsibility to review these Terms of Use periodically for updates / changes. Your continued use of the Website following the posting of changes will mean that You accept and agree to the revisions. As long as You comply with these Terms of Use, We grant You a personal, non-exclusive, non-transferable, limited privilege to enter and use the Website.
ACCESSING, BROWSING OR OTHERWISE USING THE SITE INDICATES YOUR AGREEMENT TO ALL THE TERMS AND CONDITIONS UNDER THESE TERMS OF USE, SO PLEASE READ THE TERMS OF USE CAREFULLY BEFORE PROCEEDING. By impliedly or expressly accepting these Terms of Use, You also accept and agree to be bound by Smartcart Policies ((including but not limited to Privacy Policy available at Privacy) as amended from time to time.
</p>

<h5>Membership Eligibility</h5>
<p align="justify">Use of the Website is available only to persons who can form legally binding contracts under Indian Contract Act, 1872. Persons who are "incompetent to contract" within the meaning of the Indian Contract Act, 1872 including minors, un-discharged insolvents etc. are not eligible to use the Website. If you are a minor i.e. under the age of 18 years, you shall not register as a User of the Smartcart website and shall not transact on or use the website. As a minor if you wish to use or transact on website, such use or transaction may be made by your legal guardian or parents on the Website. Smartcart reserves the right to terminate your membership and / or refuse to provide you with access to the Website if it is brought to Smartcart's notice or if it is discovered that you are under the age of 18 years.
Your Account and Registration Obligations
If You use the Website, You shall be responsible for maintaining the confidentiality of your Display Name and Password and You shall be responsible for all activities that occur under your Display Name and Password. You agree that if You provide any information that is untrue, inaccurate, not current or incomplete or We have reasonable grounds to suspect that such information is untrue, inaccurate, not current or incomplete, or not in accordance with the this Terms of Use, We shall have the right to indefinitely suspend or terminate or block access of your membership on the Website and refuse to provide You with access to the Website.
</p>

<h5>Communications</h5>
<p align="justify">When You use the Website or send emails or other data, information or communication to us, You agree and understand that You are communicating with Us through electronic records and You consent to receive communications via electronic records from Us periodically and as and when required. We may communicate with you by email or by such other mode of communication, electronic or otherwise.
Platform for Transaction and Communication
The Website is a platform that Users utilize to meet and interact with one another for their transactions. Smartcart is not and cannot be a party to or control in any manner any transaction between the Website's Users.
Disclaimer: Pricing on any product(s) as is reflected on the Website may due to some technical issue, typographical error or product information published by seller may be incorrectly reflected and in such an event seller may cancel such your order(s).
You release and indemnify Smartcart and/or any of its officers and representatives from any cost, damage, liability or other consequence of any of the actions of the Users of the Website and specifically waive any claims that you may have in this behalf under any applicable law. Notwithstanding its reasonable efforts in that behalf, Smartcart cannot take responsibility or control the information provided by other Users which is made available on the Website. You may find other User's information to be offensive, harmful, inconsistent, inaccurate, or deceptive. Please use caution and practice safe trading when using the Website.
Please note that there could be risks in dealing with underage persons or people acting under false pretence.</p>

<h5>Charges</h5>
<p align="justify">Membership on the Website is free for buyers. Smartcart does not charge any fee for browsing and buying on the Website. Smartcart reserves the right to change its Fee Policy from time to time. In particular, Smartcart may at its sole discretion introduce new services and modify some or all of the existing services offered on the Website. In such an event Smartcart reserves the right to introduce fees for the new services offered or amend/introduce fees for existing services, as the case may be. Changes to the Fee Policy shall be posted on the Website and such changes shall automatically become effective immediately after they are posted on the Website. Unless otherwise stated, all fees shall be quoted in Indian Rupees. You shall be solely responsible for compliance of all applicable laws including those in India for making payments to Smartcart Internet Private Limited.
</p>
<h5>Use of the Website</h5>
<p align="justify">You agree, undertake and confirm that Your use of Website shall be strictly governed by the following binding principles:
You shall not host, display, upload, modify, publish, transmit, update or share any information which:<br>

(a) belongs to another person and to which You does not have any right to;<br>
(b) is grossly harmful, harassing, blasphemous, defamatory, obscene, pornographic, paedophilic, libellous, invasive of another's privacy, hateful, or racially, ethnically objectionable, disparaging, relating or encouraging money laundering or gambling, or otherwise unlawful in any manner whatever; or unlawfully threatening or unlawfully harassing including but not limited to "indecent representation of women" within the meaning of the Indecent Representation of Women (Prohibition) Act, 1986;<br>
(c) is misleading in any way;<br>
(d) is patently offensive to the online community, such as sexually explicit content, or content that promotes obscenity, paedophilia, racism, bigotry, hatred or physical harm of any kind against any group or individual;<br>
(e) harasses or advocates harassment of another person;<br>
(f) involves the transmission of "junk mail", "chain letters", or unsolicited mass mailing or "spamming";<br>
(g) promotes illegal activities or conduct that is abusive, threatening, obscene, defamatory or libellous;<br>
(h) infringes upon or violates any third party's rights [including, but not limited to, intellectual property rights, rights of privacy (including without limitation unauthorized disclosure of a person's name, email address, physical address or phone number) or rights of publicity];<br>
(i) promotes an illegal or unauthorized copy of another person's copyrighted work (see "Copyright complaint" below for instructions on how to lodge a complaint about uploaded copyrighted material), such as providing pirated computer programs or links to them, providing information to circumvent manufacture-installed copy-protect devices, or providing pirated music or links to pirated music files;<br>
(j) contains restricted or password-only access pages, or hidden pages or images (those not linked to or from another accessible page);<br>
(k) provides material that exploits people in a sexual, violent or otherwise inappropriate manner or solicits personal information from anyone;<br>
(l) provides instructional information about illegal activities such as making or buying illegal weapons, violating someone's privacy, or providing or creating computer viruses;<br>

We reserve the right, but has no obligation, to monitor the materials posted on the Website. Smartcart shall have the right to remove or edit any content that in its sole discretion violates, or is alleged to violate, any applicable law or either the spirit or letter of these Terms of Use. Notwithstanding this right, YOU REMAIN SOLELY RESPONSIBLE FOR THE CONTENT OF THE MATERIALS YOU POST ON THE WEBSITE AND IN YOUR PRIVATE MESSAGES. Please be advised that such Content posted does not necessarily reflect Smartcart views. In no event shall Smartcart assume or have any responsibility or liability for any Content posted or for any claims, damages or losses resulting from use of Content and/or appearance of Content on the Website. You hereby represent and warrant that You have all necessary rights in and to all Content which You provide and all information it contains and that such Content shall not infringe any proprietary or other rights of third parties or contain any libellous, tortious, or otherwise unlawful information.
</p>
<h5>Contents Posted on Site</h5>
<p align="justify"><p align="justify">All text, graphics, user interfaces, visual interfaces, photographs, trademarks, logos, sounds, music and artwork (collectively, "Content"), is a third party user generated content and Smartcart has no control over such third party user generated content as Smartcart is merely an intermediary for the purposes of this Terms of Use.
Except as expressly provided in these Terms of Use, no part of the Website and no Content may be copied, reproduced, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted or distributed in any way (including "mirroring") to any other computer, server, Website or other medium for publication or distribution or for any commercial enterprise, without Smartcart's express prior written consent.
</p>
<h5>Privacy</h5>
<p align="justify">We view protection of Your privacy as a very important principle. We understand clearly that You and Your Personal Information is one of Our most important assets. We store and process Your Information including any sensitive financial information collected (as defined under the Information Technology Act, 2000), if any, on computers that may be protected by physical as well as reasonable technological security measures and procedures in accordance with Information Technology Act 2000 and Rules there under. Our current Privacy Policy is available at Privacy. If You object to Your Information being transferred or used in this way please do not use Website.
We may share personal information with our other corporate entities and affiliates. These entities and affiliatesmay market to you as a result of such sharing unless you explicitly opt-out.
</p>
<h5>Disclaimer of Warranties and Liability</h5>
<p align="justify">This Website, all the materials and products (including but not limited to software) and services, included on or otherwise made available to You through this site are provided on "as is" and "as available" basis without any representation or warranties, express or implied except otherwise specified in writing. Without prejudice to the forgoing paragraph, Smartcart does not warrant that:
This Website will be constantly available, or available at all; or
The information on this Website is complete, true, accurate or non-misleading.

Smartcart will not be liable to You in any way or in relation to the Contents of, or use of, or otherwise in connection with, the Website. Smartcart does not warrant that this site; information, Content, materials, product (including software) or services included on or otherwise made available to You through the Website; their servers; or electronic communication sent from Us are free of viruses or other harmful components.
Nothing on Website constitutes, or is meant to constitute, advice of any kind. All the Products sold on Website are governed by different state laws and if Seller is unable to deliver such Products due to implications of different state laws, Seller will return or will give credit for the amount (if any) received in advance by Seller from the sale of such Product that could not be delivered to You.
</p>
<h5>Payment</h5>
<p align="justify">While availing any of the payment method/s available on the Website, we will not be responsible or assume any liability, whatsoever in respect of any loss or damage arising directly or indirectly to You due to:
Lack of authorization for any transaction/s, or<br>
Exceeding the preset limit mutually agreed by You and between "Bank/s", or<br>
Any payment issues arising out of the transaction, or<br>
Decline of transaction for any other reason/s<br>
All payments made against the purchases/services on Website by you shall be compulsorily in Indian Rupees acceptable in the Republic of India. Website will not facilitate transaction with respect to any other form of currency with respect to the purchases made on Website.<br>
Before shipping / delivering your order to you, Seller may request you to provide supporting documents (including but not limited to Govt. issued ID and address proof) to establish the ownership of the payment instrument used by you for your purchase. This is done in the interest of providing a safe online shopping environment to Our Users.<br>
</p>
<h5>Applicable Law</h5>
<p align="justify">Terms of Use shall be governed by and interpreted and construed in accordance with the laws of India. The place of jurisdiction shall be exclusively in Bangalore.
</p>
<h5>Jurisdictional Issues/Sale in India Only</h5>
<p align="justify">Unless otherwise specified, the material on the Website is presented solely for the purpose of sale in India. Smartcart make no representation that materials in the Website are appropriate or available for use in other locations/Countries other than India. Those who choose to access this site from other locations/Countries other than India do so on their own initiative and Smartcart is not responsible for supply of products/refund for the products ordered from other locations/Countries other than India, compliance with local laws, if and to the extent local laws are applicable.
</p>
<h5>Trademark, Copyright and Restriction</h5>
<p align="justify">This site is controlled and operated by Smartcart and products are sold by respective Sellers. All material on this site, including images, illustrations, audio clips, and video clips, are protected by copyrights, trademarks, and other intellectual property rights. Material on Website is solely for Your personal, non-commercial use. You must not copy, reproduce, republish, upload, post, transmit or distribute such material in any way, including by email or other electronic means and whether directly or indirectly and You must not assist any other person to do so. Without the prior written consent of the owner, modification of the materials, use of the materials on any other website or networked computer environment or use of the materials for any purpose other than personal, non-commercial use is a violation of the copyrights, trademarks and other proprietary rights, and is prohibited. Any use for which You receive any remuneration, whether in money or otherwise, is a commercial use for the purposes of this clause.
</p>
<h5>Trademark complaint</h5>
<p align="justify">Smartcart respects the intellectual property of others. In case You feel that Your Trademark has been infringed, You can write to Smartcart at infringement@Smartcart.com or ss@Smartcart.com.
</p>
<h5>Product Description</h5>
<p align="justify">Smartcart we do not warrant that Product description or other content of this Website is accurate, complete, reliable, current, or error-free and assumes no liability in this regard.
</p>
<h5>Contact Us</h5>
<p align="justify">Please contact us for any questions or comments (including all inquiries unrelated to copyright infringement) regarding this Website.<br>

Grievance officer
In accordance with Information Technology Act 2000 and rules made there under, the name and contact details of the Grievance Officer are provided below:<br>
Smartcart Internet Pvt Ltd.</p>

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
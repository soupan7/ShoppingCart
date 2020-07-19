<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cart and Order</title>
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-color: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
}

/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing div. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 15px; /* adding the padding to the sides of the elements within the divs, instead of the divs themselves, gets rid of any box model math. A nested div with side padding can also be used as an alternate method. */
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}
/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
}

/* ~~ this fixed width container surrounds the other divs ~~ */
.container {
	width: 960px;
	background-color: #FFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
}

/* ~~ the header is not given a width. It will extend the full width of your layout. It contains an image placeholder that should be replaced with your own linked logo ~~ */
.header {
	background-color: #ADB96E;
}

/* ~~ This is the layout information. ~~ 

1) Padding is only placed on the top and/or bottom of the div. The elements within this div have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the div itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design.

*/

.content {

	padding: 10px 0;
}

/* ~~ The footer ~~ */
.footer {
	padding: 10px 0;
	background-color: #CCC49F;
}

/* ~~ miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty div as the final element following the last floated div (within the #container) if the #footer is removed or taken out of the #container */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
-->
</style>
<link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css" />
<link href="SpryAssets/SpryValidationSelect.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
<script src="SpryAssets/SpryValidationSelect.js" type="text/javascript"></script>
<script>
	function checkdata(){
		var x = document.getElementById("Catagory").value;
		document.getElementById("text1").value = x.toString();
	}
</script>
</head>

<body>

<div class="container">
  <div class="header"><a href="#"></a>
    <table width="100%" border="1">
      <tr>
        <td width="19%"><img src="images/Shopping Cart.jpg" alt="Insert Logo Here" name="Insert_logo" width="180" height="90" id="Insert_logo" style="background-color: #C6D580; display:block;" /></td>
        <td width="50%"><form action="Search.jsp" method="post"><table width="100%">
  <tr>
    <td width="70%"><input name="searchtext" type="text" size="70" maxlength="100" /></td>
    <td width="30%"><input type="submit" name="submit" id="submit" value="Search" /></td>
  </tr>
</table>
</form></td>
        <td width="31%"><table width="100%">
  <tr>
    <td><label><font color="#FF0000"><strong>Customer Service 24x7<br />1800254768</strong></label></td>
  </tr>
  <tr>
    <%
  	String ses=(String)session.getAttribute("USER");
  	if(session.getAttribute("USER")!=null){
  %>
  	<td><a href="index.jsp"><font color="#FFFFFF" size="-1"><strong>Home</strong></a> <font color="#FFFFFF" size="-1"><strong><%= ses %></strong> <a href="LogoutServlet"><strong>Logout</strong></a></font></td>
  <% }
  	else{
  	%>
    <jsp:forward page="login.jsp" />
    <%} %>
  </tr>
</table>
</td>
      </tr>
    </table> 
  
    <!-- end .header --></div>
  <div class="content">
    <table width="100%">
  <tr bgcolor="#FF0000">
    <th><font color="#FFFFFF">User Portal</font></th>
  </tr>
</table>
    <div id="TabbedPanels1" align="center" class="TabbedPanels">
<ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab" tabindex="0">Wish List</li>
        <li class="TabbedPanelsTab" tabindex="0">Order List</li>
      </ul>
      <div class="TabbedPanelsContentGroup">
         <div class="TabbedPanelsContent">
           
            <table width="100%">
  	<tr align="center"><th>Image</th><th>Products</th><th>Price</th><th>Description</th></tr>
<% 
	
	ResultSet rs1=null;
	ResultSet rs2=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","");
		String sql1="Select * from Temp_Details where u_email=?";
		PreparedStatement ps1=con.prepareStatement(sql1);
		ps1.setString(1, (String)session.getAttribute("EMAIL"));
		rs1=ps1.executeQuery();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
  	double i=0.0;
  	while(rs1.next()){
  		Class.forName("com.mysql.jdbc.Driver");
  		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","");
  		String sql2="Select * from Product_Details where p_id=?";
		PreparedStatement ps2=con1.prepareStatement(sql2);
		ps2.setDouble(1, rs1.getDouble(1));
		rs2=ps2.executeQuery();
		if(rs2.next())
		{
			i=i+rs2.getDouble(4);
  		%>
 
  			<tr><form action="RemoveTemp" method="post"><th><img src="<%= rs2.getString(6)%>" align="middle" height="75px" width="150px"/></th><input type="hidden" name="text1" value="<%= rs2.getDouble(1) %>"/><th><label4><%= rs2.getString(3) %></label4></th><th><label5><%= rs2.getDouble(4) %></label5></th><th><label6><%= rs2.getString(5) %></label6></th><th><input type="submit" value="Remove"/></th></form></tr>
  	<%
		}
  	}
  	%>
  	<tr></tr><tr></tr><tr></tr><tr><td></td><td>Total Amount= <%= i%></td><td><form action="PlaceOrder" method="post" align="center"><input type="submit" value="    Buy    "/></form></td></tr>
  </table>
        </div>
         <div class="TabbedPanelsContent">
  <table width="100%">
  	<tr align="center"><th>Image</th><th>Products</th><th>Price</th><th>Description</th></tr>
<% 
ResultSet rs3=null;
ResultSet rs4=null;
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","");
	String sql3="Select * from Order_Details where u_email=?";
	PreparedStatement ps3=con.prepareStatement(sql3);
	ps3.setString(1, (String)session.getAttribute("EMAIL"));
	rs3=ps3.executeQuery();
}
catch(SQLException e)
{
	e.printStackTrace();
}
	while(rs3.next()){
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","");
		String sql4="Select * from Product_Details where p_id=?";
	PreparedStatement ps4=con1.prepareStatement(sql4);
	ps4.setDouble(1, rs3.getDouble(2));
	rs4=ps4.executeQuery();
	if(rs4.next())
  		%>
  		<tr><th><img src="<%= rs4.getString(6)%>" align="middle" height="75px" width="150px"/></th><th><label4><%= rs4.getString(3) %></label4></th><th><label5><%= rs4.getDouble(4) %></label5></th><th><label6><%= rs4.getString(5) %></label6></th></tr>
  	<%
  	}
  	%>
  </table>
      </div>
    </div>
    <!-- end .content --></div>
 <div class="footer">
  <table width="100%">
  <tr>
    <td><strong>ABOUT US</strong></td>
    <td><strong>SUPPORT</strong></td>
    <td><strong>Follow us</strong></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>News</td>
    <td>Customer Services</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Investor Relations</td>
    <td>Technical Support</td>
    <td><img src="images/Facebook-icon.png" width="30" height="30" /><img src="images/images.png" width="30" height="30" /><img src="images/Twitter_bird_icon.png" width="30" height="30" /><img src="images/Instagram-icon.png" width="30" height="30" /></td>
  </tr>
  <tr>
    <td>Social Responsibility</td>
    <td>Online Support</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Our Company</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

    <!-- end .footer --></div>
  <!-- end .container --></div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
</script>
</body>
</html>
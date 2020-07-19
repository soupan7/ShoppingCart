<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administrator</title>
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
  	if(session.getAttribute("USER")=="ADMIN"){
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
    <th><font color="#FFFFFF">Management</font></th>
  </tr>
</table>
    <div id="TabbedPanels1" align="center" class="TabbedPanels">
<ul class="TabbedPanelsTabGroup">
        <li class="TabbedPanelsTab" tabindex="0">Add Items</li>
        <li class="TabbedPanelsTab" tabindex="0">Update Items</li>
        <li class="TabbedPanelsTab" tabindex="0">Delete Items</li>
        <li class="TabbedPanelsTab" tabindex="0">Product Grid</li>
        <li class="TabbedPanelsTab" tabindex="0">User Grid</li>
        <li class="TabbedPanelsTab" tabindex="0">Order Grid</li>
      </ul>
      <div class="TabbedPanelsContentGroup">
        <div class="TabbedPanelsContent"><form action="AddItem" enctype="multipart/form-data" method="post"><table width="50%">
  <tr>
    <td>Choose Catagory</td>
    <td><span id="spryselect1">
      <label for="Catagory"></label>
      <select name="Catagory" id="Catagory" onchange="checkdata()">
      	<option value="">--select--</option>
	  	<option value="Mobile">Mobile</option>
      	<option value="Tablets">Tablets</option>
      	<option value="Computers">Computers</option>
      	<option value="Men_clothings">Men Clothings</option>
        <option value="Men_Footwear">Men Footwear</option>
        <option value="Men_Watches">Men Watches</option>
        <option value="Men_Bags">Men Bags</option>
        <option value="Women_Clothings">Women Clothigs</option>
        <option value="Women_Footwear">Women Footwear</option>
        <option value="Women_Watches">Women Watches</option>
        <option value="Women_Bags">Women Bags</option>
        <option value="Jewellery">Jewellery</option>
        <option value="Beauty_Wellness">Beauty & Wellness</option>
        <option value="Baby_Diapers">Baby Diapers</option>
        <option value="Baby_Clothings">Baby Clothings</option>
        <option value="Boys_Clothings">Boys Clothings</option>
        <option value="Boys_Footweare">Boys Footweare</option>
        <option value="Girls_Clothing">Girls Clothing</option>
        <option value="Girls_Footweare">Girls Footweare</option>
        <option value="Books">Books</option>
        <option value="Kitchen">Kitchen</option>
      </select>
     <td><input type="hidden" name="text1" id="text1"/></td>
  </tr>
  <tr>
    <td>Product Name</td>
    <td><input name="PA_NAME" type="text" size="30" maxlength="30" /></td>
  </tr>
  <tr>
    <td>Product Price</td>
    <td><input name="PA_PRICE" type="text" size="30" maxlength="10" /></td>
  </tr>
  <tr>
    <td>Product Details</td>
    <td><textarea name="PA_DETAILS" cols="30"></textarea></td>
  </tr>
  <tr>
    <td>Product Image</td>
    <td><input name="PA_IMAGE" type="file" size="30" maxlength="10" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="Submit" id="Submit" value="Submit" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
        </table></form>
</div>
        <div class="TabbedPanelsContent">
        <form action="UpdateItem" enctype="multipart/form-data" method="post"><table width="50%">
  <tr>
    <td>Product ID</td>
    <td><input name="PU_ID" type="text" size="30" maxlength="10" /></td>
  </tr>
  <tr>
    <td>Product Name</td>
    <td><input name="PU_NAME" type="text" size="30" maxlength="30" /></td>
  </tr>
  <tr>
    <td>Product Price</td>
    <td><input name="PU_PRICE" type="text" size="30" maxlength="10" /></td>
  </tr>
  <tr>
    <td>Product Details</td>
    <td><textarea name="PU_DETAILS" cols="30"></textarea></td>
  </tr>
  <tr>
    <td>Choose Catagory</td>
    <td><input name="PU_IMAGE" type="file" size="30" maxlength="10" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="Submit" id="Submit" value="Update" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
        </table></form></div>
        <div class="TabbedPanelsContent">
        <form action="DeleteItem" method="post"><table width="50%">
  <tr>
    <td>Product ID</td>
    <td><input name="PD_ID" type="text" size="30" maxlength="10" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="Submit" id="Submit" value="Delete" /></td>
  </tr>
        </table></form></div>
         <div class="TabbedPanelsContent">
          
  <table width="100%">
  	<tr align="center"><th>Image</th><th>Product ID</th><th>Catagory</th><th>Products</th><th>Price</th><th>Description</th></tr>
<% 
	
	ResultSet rs=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","0");
		String sql="Select * from Product_Details";
		PreparedStatement ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
  	boolean odd=true;
  	while(rs.next()){
  		%>
  		<tr><th><img src="<%= rs.getString(6)%>" align="middle" height="75px" width="150px"/></th><th><label7><%= rs.getDouble(1) %></label7></th><th><label8><%= rs.getString(2) %></label8></th><th><label4><%= rs.getString(3) %></label4></th><th><label5><%= rs.getDouble(4) %></label5></th><th><label6><%= rs.getString(5) %></label6></th></tr>
  	<%	odd = odd ? false : true;
  	}
  	%>
  	</table>
        </div>
         <div class="TabbedPanelsContent">
         <table width="100%">
  	<tr align="center"><th>Email</th><th>Name</th><th>Gender</th><th>Address</th><th>Phone</th><th>Password</th></tr>
<%
	ResultSet rs1=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","0");
		String sql="Select * from User_Profile";
		PreparedStatement ps1=con.prepareStatement(sql);
		rs1=ps1.executeQuery();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
  	while(rs1.next()){
  		%>
  		<tr><th><label7><%= rs1.getString(1) %></label7></th><th><label8><%= rs1.getString(2) %> <%= rs1.getString(3) %></label8></th><th><label4><%= rs1.getString(4) %></label4></th><th><label6><%= rs1.getString(5) %></label6></th><th><label5><%= rs1.getString(6) %></label5></th><th><label6><%= rs1.getString(7) %></label6></th></tr>
  	<%
  	}
  	%>
        </table></div>
                 <div class="TabbedPanelsContent">
         <table width="100%">
  	<tr align="center"><th>Order ID</th><th>Product ID</th><th>Email</th><th>Date</th></tr>
<%
	ResultSet rs2=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/shopping_cart","root","0");
		String sql="Select * from Order_Details";
		PreparedStatement ps2=con.prepareStatement(sql);
		rs2=ps2.executeQuery();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
  	boolean odd2=true;
  	while(rs2.next()){
  		%>
  		<tr><th><label7><%= rs2.getDouble(1) %></label7></th><th><label8><%= rs2.getDouble(2) %></label8></th><th><label4><%= rs2.getString(3) %></label4></th><th><label6><%= rs2.getString(4) %></label6></th></tr>
  	<%	odd2 = odd2 ? false : true;
  	}
  	%>
        </table></div>
      </div>
    </div>
    <!-- end .content --></div>
  <div class="footer">
    <p></p>
<!-- end .footer --></div>
  <!-- end .container --></div>
<script type="text/javascript">
var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
var spryselect1 = new Spry.Widget.ValidationSelect("spryselect1");
</script>
</body>
</html>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Product</title>
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
.odd{
	background-color:"#6666CC";
}
.even{
	background-color:"#3399FF";
}
-->
</style>
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>

</head>

<body>
<script type="text/javascript">
	function myFunction(){
		var x=document.getElementById("button").value;
		document.getElementById("demo").innerHTML="row number "+ x +".";
	}
</script>
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
    <td><a href="index.jsp"><font color="#FFFFFF" size="-1"><strong>Home</strong></a> <a href="login.jsp"><font color="#FFFFFF" size="-1"><strong>Login</strong></a> <a href="Registration.html"><font color="#FFFFFF" size="-1"><strong>Register</strong></a></td>
    <%} %>
  </tr>
</table>
</td>
      </tr>
    </table> 
  
    <!-- end .header --></div>
  <div class="content">
    <table width="100%" border="1">
      <tr>
        <td><ul id="MenuBar1" class="MenuBarHorizontal">
          <li><a class="MenuBarItemSubmenu" href="#">Electronics</a>
      <ul>
      	<li><a href="SearchCatagory.jsp?text1=Mobile">Mobile</a></li>
        <li><a href="SearchCatagory.jsp?text1=Tablets">Tablets</a></li>
        <li><a href="SearchCatagory.jsp?text1=Computers">Computers</a></li></ul>
      </li>
      <li><a class="MenuBarItemSubmenu"href="#">Men</a>
      <ul>
      	  <li><a href="SearchCatagory.jsp?text1=Men_clothings">All clothings</a></li>
          <li><a href="SearchCatagory.jsp?text1=Men_Footwear">All Footwear</a></li>
          <li><a href="SearchCatagory.jsp?text1=Men_Watches">Watches</a></li>
          <li><a href="SearchCatagory.jsp?text1=Men_Bags">Bags</a></li>
        </ul>
      </li>
      <li><a class="MenuBarItemSubmenu" href="#">Women</a>
        <ul>
          <li><a href="SearchCatagory.jsp?text1=Women_Clothings">All Clothing</a></li>
          <li><a href="SearchCatagory.jsp?text1=Women_Footwear">All Footwear</a></li>
          <li><a href="SearchCatagory.jsp?text1=Women_Watches">Watches</a></li>
          <li><a href="SearchCatagory.jsp?text1=Women_Bags">Bags</a></li>
          <li><a href="SearchCatagory.jsp?text1=Jewellery">Jewellery</a></li>
          <li><a href="SearchCatagory.jsp?text1=Beauty_Wellness">Beauty & Wellness</a></li>
        </ul>
      </li>
      <li><a href="#">Baby & Kids</a>
      	<ul>
        	<li><a class="MenuBarItemSubmenu" href="#">Babies</a>
            	<ul>
                	<li><a href="SearchCatagory.jsp?text1=Baby_Diapers">Baby Diapers</a></li>
                    <li><a href="SearchCatagory.jsp?text1=Baby_Clothings">Baby Clothings</a></li>
            	</ul>
            </li>
            <li><a class="MenuBarItemSubmenu" href="#">Boys</a>
            	<ul>
                	<li><a href="SearchCatagory.jsp?text1=Boys_Clothings">Clothings</a></li>
                    <li><a href="SearchCatagory.jsp?text1=Boys_Footweare">Footwear</a></li>
            	</ul>
            </li>
            <li><a class="MenuBarItemSubmenu" href="#">Girls</a>
            	<ul>
                	<li><a href="SearchCatagory.jsp?text1=Girls_Clothing">Clothings</a></li>
                    <li><a href="SearchCatagory.jsp?text1=Girls_Footweare">Footwear</a></li>
            	</ul>
            </li>
        </ul>
      </li>
      <li><a href="SearchCatagory.jsp?text1=Books">Books</a></li>
      <li><a href="SearchCatagory.jsp?text1=Kitchen">Kitchen </a></li>
      <li><label>  </label> </li>
      <li><a href="CartAndOrder.jsp">Cart & Order</a></li>
      <li>  </li>
        </ul><input type="hidden" name="text1" id="text1"/></td>
      </tr>
    <tr bgcolor="#FF0000"><th><font color="#FFFFFF"><strong><%= (String)request.getParameter("text1")%></strong></font></th></tr>
  </table>
  <table width="100%">
  	<tr align="center"><th>Image</th><th>Products</th><th>Price</th><th>Description</th></tr>
<% 
	
	ResultSet rs=null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://loacalhost/shopping_cart","root","0");
		String sql="Select * from Product_Details where p_catagory=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, request.getParameter("text1"));
		rs=ps.executeQuery();
	}
	catch(SQLException e)
	{
		e.printStackTrace();
	}
  	boolean odd=true;
  	while(rs.next()){
  		%>
  		<tr><form action="AddTemp" method="post"><th><img src="<%= rs.getString(6)%>" align="middle" height="75px" width="150px"/></th><input type="hidden" name="text1" value="<%= rs.getDouble(1) %>"/><th><label4><%= rs.getString(3) %></label4></th><th><label5><%= rs.getDouble(4) %></label5></th><th><label6><%= rs.getString(5) %></label6></th><th><input type="submit" value="Add to cart" onclick="myFunction()"/></th></form></tr>
  	<%	odd = odd ? false : true;
  	}
  	%>
  </table>
  <p id="demo"></p>
  </div>
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
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Index Page</title>
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
<link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>

 <!-- Insert to your webpage before the </head> -->
    <script src="sliderengine/jquery.js"></script>
    <script src="sliderengine/amazingslider.js"></script>
    <link rel="stylesheet" type="text/css" href="sliderengine/amazingslider-1.css">
    <script src="sliderengine/initslider-1.js"></script>
    <!-- End of head section HTML codes -->
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
    <td><label><font color="#FF0000"><strong>Customer Service 24x7<br />1800254768</strong></font></label></td>
  </tr>
  <tr>
  <%
  	String ses=(String)session.getAttribute("USER");
  	if(session.getAttribute("USER")!=null){
  %>
  	<td><a href="index.jsp"><font color="#FFFFFF" size="-1"><strong>Home</strong></font></a> <font color="#FFFFFF" size="-1"><strong><%= ses %></strong> <a href="LogoutServlet"><strong>Logout</strong></a></font></td>
  <% }
  	else{
  	%>
    <td><a href="index.jsp"><font color="#FFFFFF" size="-1"><strong>Home</strong></font></a> <a href="login.jsp"><font color="#FFFFFF" size="-1"><strong>Login</strong></font></a> <a href="Registration.html"><font color="#FFFFFF" size="-1"><strong>Register</strong></font></a></td>
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
    </table>
    <table width="100%"bgcolor="#CC0000">
    	<tr>
        	<td><marquee><strong><font color="#FFFFFF">New Products</strong></marquee>
        </tr>
    </table>
   <table width="100%" bgcolor="#999999">
  <tr>
    <td width="99%">
    <!-- Insert to your webpage where you want to display the slider -->
    <div id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:700px;padding-left:0px; padding-right:250px;margin:0px auto 0px;">
        <div id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
            <ul class="amazingslider-slides" style="display:none;">
                <li><img src="images/htc4-one-T7.png" alt="htc4-one-T7" data-description="Just Feel The Technology" />
                </li>
                <li><img src="images/HTCONESilver_Left_BIG.png" alt="HTCONESilver_Left_BIG" data-description="Show off yourself" />
                </li>
                <li><img src="images/adidas-originals-adi-color-fw10-footwear20.png" alt="adidas-originals-adi-color-fw10-footwear20" data-description="Make your feet look Rooking" />
                </li>
                <li><img src="images/RYLAND-BKT_BlackTan3_2.png" alt="RYLAND-BKT_BlackTan3_2" />
                </li>
                <li><img src="images/DSquared2-Pre-Fall-Winter-2012-2013-Women-s-Clothing-barbara-palvin-model-34246099-333-500.png" alt="Trendy Top & midi Skirt" />
                </li>
                <li><img src="images/DSquared2-Pre-Fall-Winter-2012-2013-Women-s-Clothing-barbara-palvin-model-34246103-333-500.png" alt="Trendy Capris" />
                </li>
            </ul>
            <ul class="amazingslider-thumbnails" style="display:none;">
                <li><img src="images/htc4-one-T7-tn.jpg" alt="htc4-one-T7" /></li>
                <li><img src="images/HTCONESilver_Left_BIG-tn.jpg" alt="HTCONESilver_Left_BIG" /></li>
                <li><img src="images/adidas-originals-adi-color-fw10-footwear20-tn.jpg" alt="adidas-originals-adi-color-fw10-footwear20" /></li>
                <li><img src="images/RYLAND-BKT_BlackTan3_2-tn.jpg" alt="RYLAND-BKT_BlackTan3_2" /></li>
                <li><img src="images/DSquared2-Pre-Fall-Winter-2012-2013-Women-s-Clothing-barbara-palvin-model-34246099-333-500-tn.jpg" alt="Trendy Top & midi Skirt" /></li>
                <li><img src="images/DSquared2-Pre-Fall-Winter-2012-2013-Women-s-Clothing-barbara-palvin-model-34246103-333-500-tn.jpg" alt="Trendy Capris" /></li>
            </ul>
        <div class="amazingslider-engine"><a href="http://amazingslider.com" title="Responsive JavaScript Slideshow">Responsive JavaScript Slideshow</a></div>
        </div>
    </div>
    <!-- End of body section HTML codes --></td>
  </tr>
</table>

  </div>
  
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
var MenuBar2 = new Spry.Widget.MenuBar("MenuBar2", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
</script>
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
    <td>Social Responcibility</td>
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
</body>
</html>

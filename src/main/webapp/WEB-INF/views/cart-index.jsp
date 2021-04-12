<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : Georgios Tsalikis
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<head>
    <title>Bookaporta bookstore - Cart</title>
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <!--  <link href="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/george.css" rel="stylesheet" type="text/css"/> -->
    <!-- Style for header included here due to path issues. -->
<style>

body {
     box-sizing: content-box ;    
     width: 1182px ; 
     margin: 0 auto;        
}

h3 { position: relative; 
     text-align: center; 
     font-family:  Georgia, serif; font-size: 16pt;
}
header {
     display: flex;
     flex-flow: column;
     height: 130px;
}

#top-box {
    width: 100vw;
    height: 15px;
    position: fixed;
    z-index: 2;
    background-color: #ffd04d;
    right: 0px;
    top: 0;
}  
#top-container {
    height: 70px;
    display: inline-flex;
    flex-flow: row wrap;
    justify-content: space-between;
    width: 1182px;
    top: 40px;
    position: relative;
}
#logo {
	/* ; */
	cursor: pointer;
	position: relative;
	/*! top: 50px; */
	/* left: 60px; */
	margin-left: 20px;
        height: 60px;
	flex: 0 0 270px;
}

#search {

	display: inline-flex;
	position: relative;
	margin: 0 20px;
	/* padding-top: 20px; */
	/*! top: 50px; */
	height: 60px;
	/*! width: 450px; */
	/*! float: right; */	font-size: 16pt;
	/*! flex: 1 1; */
}
#searchBar {
	position: relative;
	display: inline-flex;
	/*! width: 200px; */
	/*! flex: 0 0 60px; */
	/*! border-radius: 3px 0 0 3px; */
	/*! margin: 0 auto; */
	/*! left: 100px; */
	/*! top: 15px; */
}
input#searchField {
    position: relative;
 left: 0;   
 font-size: 16px;
 margin: 0;
}
   
#searchBar #searchBox input[type="submit"] {
	display: flex;
	flex: 0 0 40px;
	position: relative;
	width: 100%;
	min-height: 1px;
	padding-right: 24px;
	padding-left: 24px;
	background-color: #ffd04d;
	height: 60px;

	color: #ffd04d;
	cursor: pointer;
	background-image: url("https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/magnifier.png");
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 19px;
	border-style: solid;
	border-width: 2px;
	border-color: #ffd04d;
	border-radius: 0 3px 3px 0;
        margin: 0 0 0 -2px;
	font-size: 0;
        left: 0;
    }

#account-checkbox {
        /*! left: 3%; */
	/*! bottom: 30px; */
	position: relative;
        height: 40px;
	color: black;
	border: none;
	border-bottom: 3px solid #2794ad;
	font-size: 14pt;
        height: 30px;
        text-decoration: none;
        background-color: transparent;
}

.myAccount {
	/* display: flex; */
	position: relative;
	height: min-content;
	top: 10px;
	/* left: 70%; */
	/* flex: 0 0 800px; */
}
.myAccount p {
    font-family: "Georgia", serif;
    font-style: oblique;
    font-size: 12pt;
    border: none;
    bottom: 2px;
    /*! position: absolute; */
    width: max-content;
    margin: 0;
}
.myAccount-modal {
        position: relative;
        display: inline-block;
        left: 350px;
        top: 20px;
    }
    

#my-account-menu  li {
text-align: end;

padding-right: 10px;
}
ul#my-account-menu  {
 list-style-type: none;
}

#my-account-menu a {

    
    
    color: black;
    text-decoration: none;
    font-size: 14pt;
}
#login-modal {
	position: absolute;
	font-family: Helvetica, Arial, sans-serif;
	z-index: 10;
	height: auto;
	width: 200px;
	background-color: white;
	color: #2794ad;
	display: none;
	border-radius: 5px;
	border: 1px solid #cccccc;
	right: 105px;
	top: 75px;
	/* width: min-content; */        font-size: 14pt;
  text-decoration: none;
	text-align: start;
	box-shadow: 3px 3px 12px lightgrey;
}
   
#command {
 display: grid;
 background: none;
 /*! color: beige; */
}

#cart {
	position: relative;
	display: flex;
	color: black;
	cursor: pointer;
	/* margin-left: 40px; */
	height: 80px;
	width: 80px;
	/*! flex: 0 0; */
	/*! left: 30px; */
	/*! bottom: 20px; */
}

#cart-img {
	background-image: url("https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/basket-empty.png");
	background-size: 50px 50px;
	background-repeat: no-repeat;
	width: 50px;
	height: 50px;
	bottom: 28px;
	right: 3px;
}

#cart-elipse {
    background-image: url("https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/basket+elipse.png");
	background-size: 40px 35px;
	background-repeat: no-repeat;
	width: 40px;
	height: 40px;
        display: block;
    z-index: -1;
    bottom: 6px;
}
#cart-amount {        
    position: relative;
    /*! top: 34px; */
    left: 28px;
    /*! width: min-content; */
    /*! z-index: 2; */
    /*! height: min-content; */
}  
#cart a {
	/*! bottom: 200px; */
        /*! left: 36px; */
	position: relative;
        text-decoration: none;
        color: black;
        display: block;
}   
    
.clickable {
 height: 80px;
 width: 80px;
 /*! right: 50px; */
 position: relative;
}
  

.clickable p {  
	margin: 0;
	width: min-content;
	position: relative;
	bottom: 25px;
	left: 4px;
}


hr.thin-line-separator {
    height: 1px; 
    border-width: 0; 
    /*! color: #ff8181; */ 
    background-color: #c3c3c3;
     top: 50px;
 position: relative;
 width: 1182px;

}

hr.thick-line-separator {
    height: 3px; 
    border-width: 0; 
    color: #2794ad;
    background-color: #2794ad;  
    width: 1182px;
}

    
  /***      ***  CART-INDEX styles  ***   ***/
  
    #empty-error-page {
        display :none;
        position: relative;

        margin: 200px;
    }
.cart-books table {
	background-color: #f7f6ff;
	border-radius: 10px;
	/*! border: 5px; */
	padding: 10px;
	/*! max-width: 2000px; */
	margin: 10px;
        /*! max-width: 800px; */
	flex: 2 2 auto;
}
th {
    text-align: justify;
}
    
section#cart-section {
        /*! width: 1182px; */
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        position: relative;

    }
    
div.title {}
button[type="submit"] {
       width: 61px;
       height: 28px;
       background-color: #2794ad;
       color: white;
       border-bottom-left-radius: 5px;
       border-bottom-right-radius: 5px;
       border: 0;
       margin-top: -2px;
       padding-bottom: 3px
}
    
div.shopping-cart {

    display: flex;
    flex-flow: column wrap; 
    position: relative;
    flex: 2 2 500px;
}

div.cart-books {
        display: flex;
            flex-direction: row;
        flex-wrap: wrap;
        flex: 1 1;
        height: 211px;
    }
    
a#continue-shopping {
    bottom: 30px;
	height: 30px;
	background-color: gold;
	padding: 8px 8px 1px 8px;
	border-radius: 12px;
	color: black;
	text-decoration: none;
}
a#proceed-checkout {
	height: 40px;
	background-color: #2794ad;
	/* padding: 8px 0px 15px 18px;  */
	/*! border-radius: 12px; */
	color: white;
	text-decoration: none;
	width: 250px;
        border-radius: 0 0 12px 12px;
	/* border-end-start-radius: 12px;
	border-end-end-radius: 12px; */
}

.next-step {
        display: flex;
        flex-flow: column wrap;
        justify-content: center;
        flex: 0 1 200px;
        text-align: center;
    }

#table-title {
    
}
#table-format {
    font-size: 10pt;
    font-style: oblique
}

#total-box {

    height: 30px;
    width: auto;
    border: 3px solid gray;
    /* padding-bottom: 50px;  */
    border-radius: 12px 12px 0 0;
    /*border-start-start-radius: 12px;
    border-start-end-radius: 12px; */
    border-bottom: 0; 
}

#quantity {
    max-width: 60px;
}

table.group-a {
    
}

table.group-b {
    
}

/***        ***      *** FOOTER styles ***      ***      ***/
#footer {
    display: flex;
    position: relative;
    width: auto;
    flex-flow:  wrap;
}

.footerBlock {
    position: relative;
    flex: 1 1 200px;
    width: auto;
    line-height: 2;
}

#whoweare {
    position: relative;
    background-color: #ededed;
    display: block;
    text-align: center;
    padding: 20px;
    margin: 0;
    line-height: 1.4;
}

#helpfulLinks {
    /*! text-align: center; */
    
    background-color: #ededed;
    border-left: 1px solid #cccccc;
    border-right: 1px solid #cccccc;
}

#helpfulLinks ul {
    text-align: start;
    padding-left: 25%;
    margin-top: 0;
}

#helpfulLinks a {
    text-decoration: none;
    color: black;
}

#socialLinks {
    display: flex;
    background-color: #e0e0e0;
    justify-content: center;
}
#socialLinks img {
    padding-top: 5px;
    margin-right: 10px;
} 

#socialLinks ul {        
    left: 25%;
    position: initial;
    padding-left: 0px;
}            
</style>
</head>

<body>
<header id="main-header">
    <div id="top-box"></div>
    
    <div id="top-container">   
        
        <div id="logo">
            <a href="/bookstore/">
                <img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/bookaporta-logo.png"  width="300" height="50"  alt="Bookaporta logo"/>   
            </a>
        </div>
        
        <div id="search">    
            <div id="searchBar">
                    <input id="searchField" type="text" placeholder="Search"  size="40"/>
                <div id="searchBox">
                    <input  type="submit" value="Search"/>
                </div>
            </div>
        </div>
        

        <div class="myAccount"> 
            <sec:authorize access="!isAuthenticated()">
                <!-- if user is not authenticated, show this link. Otherwise, it stays hidden.--> 

                <a id="account-checkbox" href="${pageContext.request.contextPath}/login">Login / Register</a>
            </sec:authorize> 
            <sec:authorize access="hasRole('ADMIN')">
                 <p>Welcome, <sec:authentication property="principal.username"/>!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>       
            </sec:authorize>
            <sec:authorize access="hasRole('CUSTOMER')">
                <p>Welcome, <sec:authentication property="principal.username" />!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>
            </sec:authorize>
            <sec:authorize access="hasRole('SERVICEAGENT')">
                <p>Welcome, <sec:authentication property="principal.username" />!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>            
            </sec:authorize>   
            <sec:authorize access="hasRole('STOCKMANAGER')">   
                <p>Welcome, <sec:authentication property="principal.username" />!</p>
                <input type="button"  onclick="toggleModal()" id="account-checkbox" value="Μy Account"/>
            </sec:authorize>
        </div>
    
        <div id="login-modal" >
            <div >
                <ul id="my-account-menu">
                    <sec:authorize access="hasRole('ADMIN')">
                        <li>
                            Role(s):<sec:authentication property="principal.authorities"/>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin">Administrator Management Page</a>
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('CUSTOMER')">
                        <li>
                            <a href="${pageContext.request.contextPath}/customer">Account Details</a>
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('SERVICEAGENT')">
                        <li>
                            <a href="${pageContext.request.contextPath}/service">Go to Customer Service Agent Management Page</a>        
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>
                        </li>
                    </sec:authorize>
                    <sec:authorize access="hasRole('STOCKMANAGER')">
                        <li>
                            Role(s):<sec:authentication property="principal.authorities"/>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/stock">Go to Stock Management Page</a>
                        </li>
                        <li>
                            <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                <input type="submit" value="Logout">
                            </form:form>                            
                        </li>
                    </sec:authorize>
                </ul>
            </div>
        </div>   

  
                  
        <div id="cart">
             <% int cartAmount = 0; %>
              <c:forEach var="cartitem" items="${sessionScope.cart}">
                  
                       <c:set var="item" value="${cartitem.quantity}"></c:set>

                <% cartAmount = cartAmount + (int) pageContext.getAttribute("item");  %>
                  
              </c:forEach>
              
             <div id="cart-amount"><%=cartAmount%>​​​​​​​</div>
             <div class="clickable">
            <a id="cart-elipse" href="${pageContext.request.contextPath}/cart/index"></a>     
            <a id="cart-img" href="${pageContext.request.contextPath}/cart/index"></a>
            <p>Cart</p>
            </div>  
        </div>         
    </div>


<hr class="thin-line-separator" />
   
</header>
        


<div style="display: none" id="empty-error-page">
    <h1>Your cart is currently empty.</h1>
    <a id="continue-shopping" style="padding-bottom: 7px; font-size: 22pt;" href="${pageContext.request.contextPath}/home">Buy yourself something first!</a>
</div>

<section id="cart-section">

 
    

    
    <div class="title">
            <h3>Shopping Cart</h3>

        <hr class="thick-line-separator"/>
    </div>
 <div style="display: flex; flex-direction: row;">
<div class="shopping-cart">   
    

   
        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <br>

        <% double total = 0.0; %>
        
        <c:forEach var="cartitem" items="${sessionScope.cart}">
     <div class="cart-books">       
        <table class="group-a">
            <tr>
                <th></th>
                <th>Title</th>

            </tr>

            

                <c:set var="subtotal" value="${cartitem.bookdetails.price * cartitem.quantity}"></c:set>



                <% total = total + (double) pageContext.getAttribute("subtotal");  %>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/books/search/${cartitem.bookdetails.book.bookid}"><img src="${cartitem.bookdetails.frontcover}" width="100"></a></td>
                    <td><p id="table-title">${cartitem.bookdetails.book.title}</p>
                        <p id="table-format">${cartitem.bookdetails.format.name}</p>
                    </td>
                    
 
                </tr> 
        </table>                   
                    
                    
                    
                    
                    
            <table class="group-b">
            <tr>

                <th>Quantity</th>
                <th>Subtotal</th>
                <th></th>
            </tr>                
                    
                    <td>
                        <c:choose>
                            <c:when test = "${cartitem.bookdetails.format.formatid != 4}">
                                <form:form action = "${pageContext.request.contextPath}/cart/index" method="post">
                                    <input name="bookid" id="bookid" value="${cartitem.bookdetails.book.bookid}" hidden>
                                    <input name="formatid" id="formatid" value="${cartitem.bookdetails.format.formatid}" hidden>
                                    <input type= "number" id="quantity" name ="quantity" value = ${cartitem.quantity } min="1" placeholder = "${cartitem.quantity }">
                             
                                    <button type="submit">Update</button>
                     
                                </form:form>
                            </c:when>

                            <c:otherwise>
                                ${cartitem.quantity }
                            </c:otherwise>
                        </c:choose>

                    </td>
                    <td> <fmt:formatNumber value="${subtotal}" maxFractionDigits="3"/>&euro;</td>
                    <td><a href="${pageContext.request.contextPath}/cart/remove/${cartitem.bookdetails.book.bookid}/${cartitem.bookdetails.format.formatid}">Remove</a></td>



                </tr> 
        </table>
                    <p></p>
</div>
            </c:forEach>

            <% pageContext.setAttribute("total", total); %>
    
         
</div>


    <div class="next-step">
    <div id="total-box">
        Total:<fmt:formatNumber value="${total}" maxFractionDigits="3"/>&euro; 
        </div>
        <a id="proceed-checkout"  href="${pageContext.request.contextPath}/cart/address">Proceed to Delivery Options or Payment</a>
    
        <p>OR</p>
        <a id="continue-shopping" href="${pageContext.request.contextPath}/home">Continue shopping</a>
    </div>   
 </div>
</section>
    
<footer>
<hr style="height: 1px; border-width: 0; color: #2794ad; background-color: #2794ad;"/>  

<div id="footer">
    
    <div style="text-align: center; padding-bottom: 20px; margin: 0;" id="whoweare" class="footerBlock">
        <p>Who we are</p>
        <p> At BookaPorta, we love high street shopping. From browsing to buying, finding new shops to meeting passionate staff. If we could live in a bookshop, we’d probably do it. Therefore, we decided to open a bookshop ourselves.
            We're working hard to keep that fun and sociable shopping experience alive for 15 years. </p>
    </div>
    
    <div id="helpfulLinks" class="footerBlock">
        <p style="text-align: center;  padding-bottom: 20px;">Helpful links</p>
        <ul>
            <li><a href="/bookstore/login">Sign in / Register</a></li>
            <li><a href="#">My Account</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact us</a></li>
            <li><a href="${pageContext.request.contextPath}/faqs">FAQs</a></li>
            <li><a href="#">Log out</a></li>
        </ul>
    </div>
    
    <div id="socialLinks" class="footerBlock">
        <ul         style="float: left;
        left: 17%;">
            <li><span class="social-rendering"><img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/f_logo_RGB-Blue_128.png" width="24" height="24" alt="Facebook logo"/>Facebook</span></li>
            
            <li><span class="social-rendering"><img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/2021+Twitter+logo+-+blue-128.png" width="24" height="24" alt="Twitter logo"/>Twitter</span></li>
            
            <li><span class="social-rendering"><img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/pinterest-logo-128.png" alt="Pinterest logo" width="24" height="24"/>Pinterest</span></li>
            <li><span class="social-rendering"><img src="https://peoplecertproject.s3.eu-central-1.amazonaws.com/UI/yt_logo_rgb_light-128.png" alt="YouTube logo"  height="16"/></span></li>
            
            
        </ul>
    </div>
         
    
</div>
            
</footer>
<script>
    if (<%=cartAmount%> === 0 ) {
        document.getElementById("cart-section").style.display = "none";
        document.getElementById("empty-error-page").style.display = "block";
    };

    let loginModal = document.getElementById("login-modal").style;
    function toggleModal()
    {
        if (loginModal.display !== "inline-block") loginModal.display = "inline-block";
        else loginModal.display = "none";
    }

    
    if (<%=cartAmount%> === 0) {
        document.getElementById("cart-elipse").style.visibility = "hidden";
        document.getElementById("cart-amount").style.visibility = "hidden";
    }
</script>
</body>
</html>

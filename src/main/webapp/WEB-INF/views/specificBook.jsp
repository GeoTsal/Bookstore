<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <title>JSP Page</title>
        <script src="./javascript/dropDownBtn.js"></script> 
         <link rel="stylesheet" href="./css/specificBook.css">
         
        </head>
        
        <body>
        <div class="grid-container">
        <header class="header"><header>
        
        
        <div class="frontcover">
        <img class="frontcover" src="${bookdetails.book.frontcover}"
        alt="frontcover not found">
        </div>
        
        <div class="bookDetails">
        <span class=title>${book.title}</span>
        <span class="booktype-dropdown">
        <button onclick="myFunction()" class="dropbtn">${bookdetails.book.format.name}</button>
                <div id="myDropdown" class="dropdown-content">
        <c:forEach items="${SameBooksDifFormat}" var="book">
        <a href="${pageContext.request.contextPath}/books/search/{bookid}">${bookdetails.book.format.name}</a>
        </c:forEach>
        </div>
        </span>
        <br>
        <c:forEach items= "${authorsByBook}" var="author">
        <a class=authorPage href="specificAuthor">
        <h3><span>by</span>  ${author.firstname} ${author.lastname}</h3>
        </a>
        </c:forEach>
        <br>
        <div class="stock">&check;  ${bookdetails.book.count} in stock</div>
        <br>
        <br>
        <br>
        <h3 class="secTitle">Description <hr></h3>
        <p class=description>${bookdetails.book.description}
        </p>
                <br>
                <h3 class="secTitle">Information<hr></h3>
        <ul class=specificInfos>
        <li>categories:<c:forEach items= "${categByBook}" var="category">
         <span>${category.name}  </span>
        </c:forEach></li>
        <br>
        <li>publisher:   <span class="info">${bookdetails.book.publisher}</span></li>
        <br>
        <li>publication date:   <span class="info">${bookdetails.book.publicationdate}</span></li>
        <br>
        <li>edition:   <span class="info">${bookdetails.book.edition}</span></li>
        <br>
        <li>language:   <span class="info">${bookdetails.book.language}</span></li>
        <br>
        <li>pages:   <span class="info">${bookdetails.book.pages}</span></li>
        <br>
        <li>booktype:   <span class="info">${bookdetails.book.format.name}</span></li>
        <br>
        <li>isbn10:  <span class="info">${bookdetails.book.isbn10}</span></li>
        <br>
        <li>isbn13:  <span class="info">${bookdetails.book.isbn13}</span></li>
                </ul>
                </div>
        
        <div class=cartBox>
        <div>Price: ${bookdetails.book.price}</div>
        <div>Delivery costs:</div>
        <br>
        <a href="bookstore/cart">Add to basket</a>
        </div>
        <div class=relatedBooks>
        <h3 class=blockTitle>Also by the same author</h3>
        <c:forEach items= "${booksdetailsFromSameAuthor}" var="book">
         <div>${bookdetails.book.frontcover}</div>
         <a class=bookpage href=${pageContext.request.contextPath}/books/search/{bookid}>${bookdetails.book.title}</a>
         <br> 
         <div>Add to cart<div/>
        </c:forEach>
        
        <footer>
        <hr style="height: 1px; border-width: 0; color: #2794ad; background-color: #2794ad;"/>  
        
        <div id="footer">
        
        <div style="text-align: center;" id="whoweare" class="footerBlock">
        <p>Who we are</p>
        </div>
                
                <div id="helpfulLinks" class="footerBlock">
        <span style="text-align: center;">Helpful links</span>
        <ul>
        <li><a href="/bookstore/login">Sign in / Register</a></li>
        <li><a href="#">My Account</a></li>
        <li><a href="#">Contact us</a></li>
        <li><a href="#">FAQs</a></li>
        <li><a href="#">Log out</a></li>
        </ul>
        </div>
        
        <div id="socialLinks" class="footerBlock">
        <ul         style="float: left; left: 17%;">
        <li><img src="f_logo_RGB-Blue_128.png" width="24" height="24" alt="Facebook logo"/><span style="margin-bottom:  150px">Facebook</span></li>
        <li><img src="2021 Twitter logo - blue-128.png" width="24" height="24" alt="Twitter logo"/>Twitter</li>
                <li><img src="pinterest-logo-128.png" alt="Pinterest logo" width="24" height="24"/>Pinterest</li>
        <li><img src="yt_logo_rgb_light-128.png" alt="YouTube logo"  height="16"/></li>
        </ul>
        </div>
        </div>
        </footer>
        </body>
        </html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
            <style> * {
    font-size: 16px;

}
body {
    margin:0% 8%;
    
}


.container>div {
    text-align: left;
    padding:25px 25px;
}

div.header {
   height: 210px;
}

div.img1 {
    width:28%;
    height:25%;
    
}
img.img1 {
    border:solid yellow;
}

div.text1 {
    width: 70%;
    position:relative;
    left: 270px;
    bottom: 340px;
}

div.img2 {
    width: 25.2%;
    height:22.5%;
    position:relative;
    bottom:180px;
}

div.text2 {
    width: 70%;
    position:relative;
    left: 300px;
    bottom: 610px;
    
};

.title {
    font-size: 23px;
}

p {
    line-height: 200%;
    font-size: 16px;
    font-family: Arial, Helvetica, sans-serif;
}


.books>div {
    float:left;
    padding: 1.5%;
    position:relative;
    bottom: 550px;
}
.title {
    font-size: 23px;
}

a{
    background-color: yellow;
}
</style>
        </head>
        <body>
            <div class="container">
        <div class="header"></div>
        <div class="img1">
            <img class=img1 src="${author.portrait}" alt="not found">
        </div>
        <div class="text1">
            <div class=title>${author.firstname}  ${author.lastname}</div>
            <p class="text1">${author.biography}</p>
        </div>
        <div class="img2">
            <img class="img2" src="https://www.hive.co.uk/Content/StoreFront/assets/HiveAssets/BOTM/losthours.png" alt="not found">
        </div>
        <div class="text2">
            <div class="title" style=text-align:center;>New From  ${author.firstname}  ${author.lastname}<hr></div>
            <div class="title">${sortedBookdetails.book.title}</div>
            <p class="desc">${sortedBookdetails.book.descripition}</p>
            <br>
            <br>
            <div class="price">${sortedBookdetails.book.price} $</div>
            <a href="fake">Add to cart</a>
        </div>
        <div class="books">
            <div class=titleList>More Books By ${author.firstname}  ${author.lastname}</div>
            <br>
            <br>
            <br>
            <br>
            <c:forEach items= "${sortedbookDetails}" var="sortedbookDetails">
            <div class="book">
                <img class="frontcover"src="${sortedbookDetails.frontcover}" alt="not found">
                <div class="title">${sortedbookDetails.book.title}</div>
                <a href="fake">Add to cart</a>
            </div>
            </c:forEach>
        <div class="footer"></div>
        </body>
    </html>
</f:view>

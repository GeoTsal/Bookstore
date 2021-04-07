

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
            <div class="title">The Lost Hours</div>
            <p class="desc">Don't miss the gripping new novel from the Sunday Times bestselling author, Susan Lewis.

                A perfect marriage... Golden couple Annie and David Crayce have it all. A loving marriage, three beautiful children and a thriving family business.
                Life couldn't be better. Until the unthinkable happens... A perfect crime? A piece of damning DNA evidence has arisen, placing David as the prime suspect of a murder committed twenty-years ago.
                Annie is sure her David is innocent. But if he isn't guilty, then either his father or brother must be. As the police investigate the cold case, so does Annie.
                Trawling through her old diaries, she begins desperately looking for answers.
                But it all comes down to a few lost hours she can't solve. And Annie begins to doubt the one person she thought she knew best... Her husband.
            </p>
            <br>
            <br>
            <div class="price">Price: 21,99$$</div>
            <a href="fake">Add to cart</a>
        </div>
        <div class="books">
            <div class=titleList>More Books By ${author.firstname}  ${author.lastname}</div>
            <br>
            <br>
            <br>
            <br>
            <div class="book1">
                <img src="https://hive.dmmserver.com/media/356/97800082/9780008286927.jpg" alt="not found">
                <div class="title">Forgive Me</div>
                <a href="fake">Add to cart</a>
            </div>
            <div class="book2">
                <img src="https://hive.dmmserver.com/media/356/97800082/9780008286835.jpg" alt="not found">
                <div class="title">My Lies</div>
                <a href="fake">Add to cart</a>
            </div>
            <div class="book3">
                <img src="https://hive.dmmserver.com/media/356/97800082/9780008286828.jpg" alt="not found">
                <div class="title">Home Truths</div>
                <a href="fake">Add to cart</a>
            </div>
            <div class="book4">
                <img src="https://hive.dmmserver.com/media/356/97817847/9781784755621.jpg" alt="not found">
                <div class="title">Home Secrets</div>
                <a href="fake">Add to cart</a>
            </div>
        </div>
        <div class="footer"></div>
        </body>
    </html>
</f:view>

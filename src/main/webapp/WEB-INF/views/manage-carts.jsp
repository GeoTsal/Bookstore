<%-- 
    Document   : home
    Created on : Feb 18, 2021, 8:46:36 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to Order Management Page</h1>
        <p>
            User: <sec:authentication property="principal.username"/>
            <br/>
            Role(s):<sec:authentication property="principal.authorities"/>
        </p>
        <hr/>

        <sec:authorize access="hasRole('ADMIN')">
            <a href="${pageContext.request.contextPath}/admin">Administrator Home</a>
        </sec:authorize>

        <sec:authorize access="hasRole('SERVICEAGENT')">
            <a href="${pageContext.request.contextPath}/service">Service Agent Home</a>
        </sec:authorize>

        <br/>

        <h2> Customer Orders </h2>
        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>Customer ID</th>
                <th>Customer First Name</th>
                <th>Customer Last Name</th>
                <th>Datetime</th>
                <th>Payment</th>
                <th>Quantity</th>
                <th>pricebeforetax</th>
                <th>shippingcost</th>
                <th>tax</th>
                <th>totalprice</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>   


            <c:forEach items="${listOfCarts}" var="cart"> 

                <tr>

                    <td>${cart.cartid}</td>
                    <td>${cart.customer.customerid}</td>
                    <td>${cart.customer.firstname}</td>
                    <td>${cart.customer.lastname}</td>
                    <td>${cart.datetime}</td>
                    <td>${cart.payment}</td>
                    <td>${cart.quantity}</td>
                    <td>${cart.pricebeforetax}</td>
                    <td>${cart.shippingcost}</td>
                    <td>${cart.tax}</td>
                    <td>${cart.totalprice}</td>

                    <td>      
                        <a href="${pageContext.request.contextPath}/admin/customers/update/${cart.cartid}">Update</a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/customers/delete?id=${cart.cartid}">Delete</a>
                    </td>


                </tr>

            </c:forEach>


        </table>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
            <input type="submit" value="Logout">
        </form:form>
    </body>


</html>

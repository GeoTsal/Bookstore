<%-- 
    Document   : customer-home
    Created on : 27-Mar-2021, 23:05:19
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is Customer Homepage</h1>
        <hr>
        
        <br>
        <br>
        
        <h2>Your Account Details</h2>
        <h2>You can edit them</h2>
    <form:form  action="${pageContext.request.contextPath}/logout" method="POST" modelAttribute = "customer">

           <label for="firstname">First Name</label>

            <form:input path="firstname" id="firstname"  value="${customer.firstname}"/>

            <br>

            <label for="lastname">Last Name</label>

            <form:input path="lastname" id="lastname"  value="${customer.lastname}"/>

            <br>

            <label for="email" >Your Email</label>

            <form:input type="email" path="email" id="email"  value="${customer.email}"/>

            <br>

            <label for="username">Username</label>

            <form:input path="username" id="username"  value="${customer.username}"/>
            <form:errors path="username"  />

            <br>

            <label for="password">Password</label>

            <form:input path="password" id="password"  value="${customer.password}"/>


            <br>

            <label for="country">Country</label>
            
            <form:select path = "country.countryid">

                <form:option value=""> --Select Country--</form:option>

                <c:forEach var = "country" items = "${countries}">
                    <form:option value="${country.countryid}"> ${country.name}</form:option>                 
                </c:forEach>

            </form:select>


            <br>


            <label for="street">Address</label>

            <form:input path="street" id="street" value="${customer.street}"/>
            <form:input path="streetnumber" id="streetnumber"  value="${customer.streetnumber}"/>
            <form:input path="postalcode" id="postalcode"  value="${customer.postalcode}"/>

            <br>

            <label for="dateofbirth">Date of Birth</label>

            <form:input type="date" path="dateofbirth" id="dateofbirth"  value="${customer.dateofbirth}"/>

            <br>

            <label for="paypalaccount">PayPal Account</label>
            <form:input path="paypalaccount" id="paypalaccount"  value="${customer.paypalaccount}"/>

            <br>
            <input type="submit" value="Logout">
     </form:form>
        
    </body>
</html>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Nikita Bogurov
  Date: 17.02.2021
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Department Info</title>
</head>
<body>
<h2>Employee Info</h2>
<br>
<form:form action="saveDepartment" modelAttribute="dep">
    <form:hidden path="id"/>
    <form:hidden path="departmentDetail.id"/>

    <h4>Main Info</h4>

    Name <form:input path="name"/>
    <br><br>
    Department <form:input path="department"/>
    <br><br>
    <h4>Other Info</h4>
    Phone number <form:input path="departmentDetail.phoneNumber"/>
    <br><br>
    Address <form:input path="departmentDetail.address"/>
    <br><br>

    <input type="submit" value="Save">
</form:form>
</body>
</html>

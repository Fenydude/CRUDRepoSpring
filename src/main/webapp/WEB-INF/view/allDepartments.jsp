<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Nikita Bogurov
  Date: 17.02.2021
  Time: 19:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List of Departments</title>
</head>
<body>
<h2>All Departments</h2>
<br>

<table>
    <tr>
        <th>Name</th>
        <th>Department</th>
        <th>Phone</th>
        <th>Address</th>
    </tr>
    <c:forEach var="dep" items="${departments}">
        <c:url var="updateButton" value="/updateDepartment/${dep.id}">
        </c:url>
        <c:url var="deleteButton" value="/deleteDepartment/${dep.id}">
        </c:url>
        <c:url var="employeeInfo" value="/listEmployeeFromDepartment/${dep.id}">
        </c:url>
        <tr>
            <td>${dep.name}</td>
            <td>${dep.department}</td>
            <td>${dep.departmentDetail.phoneNumber}</td>
            <td>${dep.departmentDetail.address}</td>
            <td><input type="button" value="Update"
                       onclick="window.location.href = '${updateButton}'">
                <input type="button" value="Delete"
                       onclick="window.location.href = '${deleteButton}'">
                <input type="button" value="Employee"
                        onclick="window.location.href = '${employeeInfo}'">
            </td>
        </tr>
    </c:forEach>
</table>

<br>
<input type="button" value="Add" onclick="window.location.href = 'addNewDepartment'">
</body>
</html>

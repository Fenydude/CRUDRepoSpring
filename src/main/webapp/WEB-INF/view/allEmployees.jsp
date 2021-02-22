<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<h1>Using first Environment Variables </h1>
<h2>All Employees</h2>
<br>

<table>
    <tr>
        <th>Name</th>
        <th>Surname</th>
        <th>Department</th>
        <th>Salary</th>
        <th>City</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Operations</th>
    </tr>
    <c:forEach var="emp" items="${allEmps}">
        <c:url var="updateButton" value="/employees/${depId}/updateInfo">
            <c:param name="empId" value="${emp.id}"/>
        </c:url>
        <c:url var="deleteButton" value="/employees/${depId}/deleteEmployee">
            <c:param name="empId" value="${emp.id}"/>
        </c:url>
        <tr>
            <td>${emp.name}</td>
            <td>${emp.surname}</td>
            <td>${emp.salary}</td>
            <td>${emp.employeeDetail.city}</td>
            <td>${emp.employeeDetail.phoneNumber}</td>
            <td>${emp.employeeDetail.email}</td>
            <td><input type="button" value="Update"
                       onclick="window.location.href = '${updateButton}'">
                <input type="button" value="Delete"
                       onclick="window.location.href = '${deleteButton}'"></td>
        </tr>
    </c:forEach>
</table>

<br>
<c:url var="addButton" value="/employees/${depId}/addNewEmployee">
</c:url>
<input type="button" value="Add" onclick="window.location.href = '${addButton}'">
</body>
</html>
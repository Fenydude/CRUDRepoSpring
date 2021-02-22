<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<body>
<h1>Using first Environment Variables </h1>
<h2>Employee Info</h2>
<br>
<form:form action="saveEmployee" modelAttribute="emp">
    <form:hidden path="id"/>

    <h4>Main Info</h4>

    Name <form:input path="name"/>
    <br><br>
    Surname <form:input path="surname"/>
    <br><br>
    Salary <form:input path="salary"/>
    <br><br>
    <h4>Other Info</h4>

    <form:form modelAttribute="empDetail">
        <form:hidden path="details_id"/>

        City <form:input path="city"/>
        <br><br>
        Phone number <form:input path="phoneNumber"/>
        <br><br>
        Email <form:input path="email"/>
        <br><br>

        <input type="submit" value="Save">

    </form:form>
</form:form>
</body>
</html>
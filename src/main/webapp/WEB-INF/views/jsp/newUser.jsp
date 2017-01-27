<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<form:errors path="surname"/>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form action="/registration" method="post" modelAttribute="user">

    <%--name--%>
    <%--<form:input path="name" />${name}</br>--%>

    <%--surname--%>
    <%--<form:input path="surname"/></br>--%>

    <%--mail--%>
    <%--<form:input path="email"/>${email}</br>--%>


    <%--phone--%>
    <%--<form:input path="phone"/></br>--%>

    <%--password--%>
    <%--<form:input path="password"/>${password}</br>--%>

    <%--confirm--%>
    <%--<form:input path="confirmPassword"/></br>--%>
    <%--<form:button>Sign up</form:button>--%>



    <form:errors path="name"/>
    <form:input path="name"/>
    <form:errors path="surname"/>
    <form:input path="surname"/>
    <form:errors path="email"/>
    <form:input path="email"/>
    <form:errors path="phone"/>
    <form:input path="phone"/>
    <form:errors path="password"/>
    <form:input path="password"/>
    <form:errors path="password"/>
    <form:input path="confirmPassword"/>
    <form:button>Sign up</form:button>
</form:form>
</body>
</html>

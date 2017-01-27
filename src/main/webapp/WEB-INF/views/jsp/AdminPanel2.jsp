
<%--<sec:authorize access="hasRole('ROLE_USER')">--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Adminka</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/admin.css">
</head>
<body>





<div id="us" style="width:40%"></div>
<c:forEach items="${allUsers}" var="map">
    <a href="/chat/getUsersmassages/${map.id}"><div class="users">${map.name}&nbsp;&nbsp;&nbsp;${map.email}</div></a>
</c:forEach>

<c:forEach items="${UsersChat}" var="chat">
${chat.massage}   ${chat.date}<br>
</c:forEach>


==========projects======================================================================================================
<br>
<c:forEach items="${usersBlank}" var="blank">
    ${blank.projectNamae}${blank.redyPercent}-------------
    <a href="/setAccomplishProject/
    ${blank.id}/${userId.id}">
        set this project finished</a><br>

</c:forEach>


${userId.id} userid ${userId.name}
<form action="/chat/sendMassageToUser/${userId.id}" method="GET">
    <input type="text" name="massage" id="massage" placeholder="massage">
    <input type="submit">
</form>

<form action="/addUsersBlank/${userId.id}" method="post">
    <input type="text" name="projectName" id="projectNmae">
    <input type="text" name="projectInfo" id="projectInfo">

    <input type="submit">
</form>



<br><br><br><br>



</body>
</html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<sec:authorize access="hasRole('ROLE_USER')">--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<title></title>
<head>

    <meta charset="utf-8">
</head>

<body>
iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
<a href="/addUser">addUser user</a>
<%--<img src="data:image/gif;base64,/>--%>
<c:if test="${param.logout != null}">
    <div class="alert alert-success" style="color: #2b542c; font-size: 45pt">
        <p>You have been logged out successfully.</p>
    </div>
</c:if>
<c:if test="${param.error != null}">
    <div class="alert alert-danger">
        <p>Invalid username and password.</p>
    </div>
</c:if>
<%--<a href="addUser">Book all</a>--%>
<sec:authorize access="isAnonymous()">
    <form:form action="/loginprocessing" method="POST">
        <input type="text" name="username" placeholder="Login" style="background-color: #46b8da">
        <input type="password" name="password" placeholder="Password">
        <button type="submit">Sign in</button>
    </form:form>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
    <img src="resources/img/2.jpg" style="width: 200px">
    Hello,<sec:authentication property="name"/>
    <a href="cabinet">cabinet </a>


    <a href="<c:url value="http://google.com" />"> GOOGLE f </a>
    <form:form action="/logout" method="post">
        <button type="submit">Logout</button>
    </form:form>
</sec:authorize>
${user.username}
${user.name}
${user.phone}
${user.id}<br>
${user.email}

<sec:authorize access="hasRole('ADMIN')"><a href="/author/new">Create new Authorrr
    rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr</a></sec:authorize>

<form name="im" id="im" enctype="multipart/form-data">
    <input type="file" value="file" name="image" id="image">
    <input type="submit" name="subm" value="submit" onclick="add()">
</form>
<script>
    function add() {
        var forma = document.forms.im;
        var file2 = new FormData();

        var file = forma.elements.image.files[0];

//        file2.append("image",ty);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/saveImage");
        xhr.send(file);


//        fetch("/saveImage",{
//            methood:"POST",
//            body:file
//        }).then(function (response) {
//            return response.text()
//        }).then(function (body) {
//
//        })
    }


</script>


<form name="mes" id="mes">
    <input type="text" value="text" name="testim" id="testim">
    <input type="submit" name="subm" value="submit" onclick="addMas()">
</form>
<script>
    function addMas() {
        var formd = document.forms.mes;
        var massageQ = formd.elements.testim.value;
        var xhrt = new XMLHttpRequest();
//        xhrt.responseType.text();
        xhrt.open("POST", "/addTestim");
        xhrt.send(massageQ);

    }


</script>

<br><br><br><br><br><br>


<div id="massagesDiv" style="width: 600px;clear: both ;min-height: 50px ;background-color: #2e6da4"></div>
<script>
    (function () {
        testimoni();
    })()
</script>


<script>
    //    header('Content-type: text/html; charset=windows-1251');


    function testimoni() {
        fetch('/refreshMassages')
                .then(function (response) {
                    return response.json();
                })
                .then(function (response) {

                    massagesDiv.innerHTML = "";
                    for (var q = 0; q < response.length; q++) {

                        var mes = document.createElement("div");
                        mes.id = "dooo";
                        mes.style.backgroundColor = "green";
                        mes.style.width = "200px";
                        mes.innerHTML = response[q].testimonial;
                        massagesDiv.appendChild(mes)

                    }
                })
                .catch(alert);


//        function aeed() {
//            var mes = document.createElement("div");
//            mes.id = "dooo";
//            mes.style.backgroundColor = "green";
//            mes.style.width = "200px";
//            mes.innerHTML = qwerty;
//            massagesDiv.appendChild(mes)
//        }


    }
    ;
    setInterval(testimoni, 20000);
    //setTimeout()
</script>

<input type="button" value="jsona" onclick="testimoni()">
<%--<input type="button " value="jsona" onclick="bbbbba()">--%>


<script>
    function jsona() {


        fetch('/getJasonMasseges')
                .then(function (response) {

                    return response.json();
                })
                .then(function (testimonials) {

                    alert(testimonials.id);

//              alert(user); // iliakan
                })
                .catch(alert);
    }


</script>

</body>
</html>


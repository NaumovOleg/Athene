<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Panel</title>
<%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<link rel="stylesheet" href="resources/css/bootstrap.min.css">--%>
<%--<link rel="stylesheet" href="resources/css/admin.css">--%>
</head>
<body>
<style>
    button,
    button:active,
    button:focus {
        outline: none;
    }

    :focus {
        outline: none;
    }

    body {
        margin: auto;
    }

    .container {
        display: block;
        margin: auto;
        width: 1100px;
        text-align: center;
    }

    .admin_logo {
        display: block;
        margin-top: 10px;
        text-align: center;
        color: #ff7878;
        padding: 20px;
        font-size: 30px;
        border: 1px solid #ccc;
    }

    .main {
        display: block;
        text-align: center;
        margin: auto;
    }

    .admin_left {
        display: inline-block;
        padding: 10px;
        max-width: 400px;
        float: left;
        clear: both;

    }

    .admin_users {
        max-height: 500px;
        font-size: 14px;
        overflow-y: scroll;
    }

    .admin_users a {
        display: block;
        text-decoration: none;
        color: #777777;
        padding: 3px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-bottom: 3px;
    }

    #massovaRocsilka {
        margin-top: 20px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    #massovaRocsilka span {
        display: block;
        margin-bottom: 10px;
    }

    #massovaRocsilka textarea {
        display: block;
        height: 70px;
        width: 250px;
        margin: auto;
        margin-bottom: 10px;
    }

    .massovaRocsilka_button {
        padding: 5px;
        background: #ff7878;
        color: white;
        border: none;
        width: 70px;
    }

    .admin_right {
        display: inline-block;
        padding: 10px;
        max-width: 700px;

    }

    .user_info {
        text-align: center;
    }

    .we_are_working_with {
        display: block;
        color: #ff7878;
        font-weight: 700;
        margin-bottom: 5px;
    }

    .we_are_working_with_name {
        display: block;
        padding: 3px;
        border: 1px solid #ccc;
    }

    /*TABS START*/
    #tabs {
        margin: auto;
        background: none;
        width: 100%;
        text-align: center;
        margin-top: 5px;
        border: none;
    }

    #tabs ul {
        display: inline-block;
        background: #ccc;
        border-radius: 5px;
        margin-bottom: 10px;
    }

    #tabs ul li {
        display: inline-block;
        padding: 10px;
        border-radius: 5px;
        text-decoration: none;

    }

    #tabs ul li a {
        text-decoration: none;
        color: white;
    }

    #tabs ul li a:checked {
        color: white;
    }

    .ui-state-active,
    .ui-widget-content
    .ui-state-active,
    .ui-widget-header
    .ui-state-active,
    a.ui-button:active,
    .ui-button:active,
    .ui-button.ui-state-active:hover {
        background: #ff7878;
        border-radius: 5px;
        border: 1px solid #ff7878;;
    }

    .ui-tabs .ui-tabs-nav {
        display: block;
        margin: auto;
        margin: 0;
        padding: 2px 2px 2px 2px;
    }

    .ui-state-default,
    .ui-widget-content .ui-state-default,
    .ui-widget-header .ui-state-default,
    .ui-button,
    html .ui-button.ui-state-disabled:hover,
    html .ui-button.ui-state-disabled:active {
        border: none;
        font-weight: normal;
        color: #454545;
    }

    /*TABS END*/
    /*CHAT START*/
    .admin_chat_box {
        height: 300px;
        width: 500px;
        padding: 5px;
        overflow-y: scroll;
        border: 1px solid #ccc;
    }

    .admin_chat_msgs {
        max-width: 98%;
        margin-bottom: 2px;
        padding: 3px;
        text-align: justify;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .admin_chat_msgs_top {
        font-size: 10px;
        margin-top: -2px;
        margin-bottom: 7px;

    }

    .admin_chat_msgs_top_date {
        color: green;
        float: right;
        clear: both;
    }

    .admin_chat_send_box {
        display: block;
        text-align: center;
        margin-top: 5px;
    }

    .admin_chat_send_box textarea {
        display: block;
        height: 70px;
        width: 500px;
        color: #ccc;
        margin: auto;
        margin-bottom: 5px;
        border-radius: 5px;

    }

    .admin_chat_send_box input {
        display: block;
        margin: auto;
        padding: 5px;
        background: #ff7878;
        color: white;
        border: none;
        width: 100px;
    }

    /*CHAT END*/

    /*PROJECT START*/
    .table_projects {
        max-width: 650px;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    .table_projects tr td {
        padding: 10px;
        border: 1px solid #ccc;
        max-width: 500px;
        font-size: 14px;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .admin_status_project {
        display: block;
        color: white;
        background: green;
        font-size: 10px;
        margin-top: -10px;
        margin-right: -10px;
        float: right;
        clear: both;
    }

    .admin_status_project:hover {
        color: #ff7878;
        background: white;
    }

    .admin_project_box {

    }

    .admin_project_name {
        display: block;
        margin: auto;
        padding: 10px;
        height: 20px;
        width: 100%;
        margin-bottom: 5px;
    }

    .admin_project_info {
        display: block;
        margin: auto;
        padding: 10px;
        height: 70px;
        width: 100%;
        margin-bottom: 5px;
    }

    .admin_project_box button {
        display: block;
        margin: auto;
        padding: 5px;
        background: #ff7878;
        color: white;
        border: none;
        width: 100px;
    }

    /*PROJECT END*/

    /*USER INFO START*/
    .info_about_user {
        width: 100%;
        border: 1px solid #ccc;
        margin-bottom: 10px;
    }

    .info_about_user tr td {
        padding: 10px;
        border: 1px solid #ccc;
    }

    /*USER INFO END*/

    /*ADMIN TEAM START*/
    .admin_team{
        margin-top: 20px;
        padding: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .admin_team input{
        display: block;
        width: 150px;
        margin-bottom: 5px;
    }

    .admin_team input{
        display: block;
        margin: auto;
        width: 150px;
        margin-bottom: 5px;
    }

    .admin_team_button{
        display: block;
        margin: auto;
        padding: 5px;
        background: #ff7878;
        color: white;
        border: none;
        width: 100px;
    }
    /*ADMIN END END*/
</style>
<div id="container" class="container">
    <div class="admin_logo">Admin Panel</div>
    <div class="main">
        <%--LEFT BLOCK START--%>
        <div class="admin_left">
            <div class="admin_users">
                <c:forEach items="${allUsers}" var="map">
                    <a href="/chat/getUsersmassages/${map.id}">
                            ${map.name}&nbsp;&nbsp;&nbsp;${map.email}
                    </a>
                </c:forEach>
            </div>


            <form id="massovaRocsilka">
                <span>Массовая Разсылка:</span>
                <textarea type="text" id="qwe" placeholder="massage for all"></textarea>
                <input class="massovaRocsilka_button" type="button" value="submit" onclick="adddMAssageToAll()">
            </form>

            <form class="admin_team">
                <span>Our team:</span>
                <input type="text" id="java" placeholder="java">
                <input type="text" id="js" placeholder="java script">
                <input type="text" id="des" placeholder="designers">
                <input type="text" id="php" placeholder="php">
                <button class="admin_team_button" type="button" value="sumit" onclick="setStaff()">submit</button>
            </form>

            <script>
                function setStaff() {
                    var staffee={
                        js:js.value,
                        java:java.value,
                        php:php.value,
                        designers:des.value
                    };
                    alert( JSON.stringify(staffee))
                  $.ajax({
                      type:"post",
                      url:'/setStaff',
            //          dataType:'text',
                      async:false,
                      contentType: "application/json; charset=utf-8",
                      data:JSON.stringify(staffee),
                      success:function (data,textStatus, jQxhr) {

                      },
                      error:function (jqXhr, textStatus, errorThrown) {

                      }
                  })
                }
            </script>
        </div>
        <%--END OF LEFT BLOCK--%>
        <%--RIGHT BLOCK--%>
        <div class="admin_right">
            <div class="user_info">
                <span class="we_are_working_with">We are working with:</span>
                <span class="we_are_working_with_name"><span style="color: #ccc">Id:</span> ${userId.id} <span
                        style="color: #ccc">Name:</span> ${userId.name} <span
                        style="color: #ccc">Email:</span> ${userId.email}</span>
            </div>
            <div id="tabs">

                <ul>
                    <li><a href="#tabs-1">Chat</a></li>
                    <li><a href="#tabs-2">Projects</a></li>
                    <li><a href="#tabs-3">info about User</a></li>
                </ul>


                <div id="tabs-1">
                    <div id="admin_chat_box" class="admin_chat_box">
                        <c:forEach items="${UsersChat}" var="chat">
                            <div class="admin_chat_msgs">
                                <div class="admin_chat_msgs_top">
                                    <span class="admin_chat_msgs_top_date">${chat.date}</span>
                                </div>
                                    ${chat.massage}
                            </div>
                        </c:forEach>
                    </div>

                    <form class="admin_chat_send_box" action="/chat/sendMassageToUser/${userId.id}" method="GET" enctype="multipart/form-data">
                        <textarea type="text" name="massage" id="massage" placeholder="massage"></textarea>
                        <input type="submit">
                    </form>
                </div>


                <div id="tabs-2">

                    <table class="table_projects">
                        <c:forEach items="${usersBlank}" var="blank">
                            <tr>
                                <td>${blank.projectNamae}</td>
                                <td>${blank.projectInfo}</td>
                                <td>
                                    <a class="admin_status_project" href="/setAccomplishProject/
    ${blank.id}/${userId.id}">Change Status</a>
                                        ${blank.redyPercent}
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <form id="admin_project_box" class="admin_project_box" action="/addUsersBlank/${userId.id}"
                          method="post" >
                        <input class="admin_project_name" type="text" name="projectName" id="projectNmae"
                               placeholder="Project Name">
                        <textarea class="admin_project_info" type="text" name="projectInfo" id="projectInfo"
                                  placeholder="Project Info"></textarea>
                        <button type="submit">Send</button>
                    </form>

                </div>

                <div id="tabs-3">
                    <table class="info_about_user">
                        <tr>
                            <td>Name:</td>
                            <td>${userId.name}</td>
                        </tr>
                        <tr>
                            <td>Surname:</td>
                            <td>${userId.surname}</td>
                        </tr>
                        <tr>
                            <td>E-Mail:</td>
                            <td>${userId.email}</td>
                        </tr>
                        <tr>
                            <td>Phone:</td>
                            <td>${userId.phone}</td>
                        </tr>

                    </table>
                </div>
            </div>

        </div>
        <%--END OF RIGHT BLOCK--%>


    </div>
</div>
<script>
    function adddMAssageToAll() {
        var xmle = new XMLHttpRequest();
        xmle.open('POST', '/sendMultiMassages');
        xmle.send(qwe.value);
    }

    /*SCROLL*/
    var block = document.getElementById("admin_chat_box");
    block.scrollTop = block.scrollHeight;
    /*SCROLL*/


    //    function addAdvertaising(){
    //        var mass=qwe.value;
    //        $.ajax({
    //            type:'post',
    //            url:'/sendMultiMassages',
    //            dataType:'text',
    //            contentType: "text/plain; charset=utf-8",
    //            data:mass,
    //            success: function (data, textStatus, jQxhr) {
    //                alert(data)
    //            },
    //            error: function (jqXhr, textStatus, errorThrown) {
    //            }
    //        })

</script>
<script>
    $(function () {
        $("#tabs").tabs();
    });
</script>
</body>
</html>
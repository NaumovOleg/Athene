<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<%--
  Created by IntelliJ IDEA.
  User: Олег
  Date: 14.12.2016
  Time: 22:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Landing</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/cabinet.css">
    <link href="resources/css/full-slider.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<script src="/resources/js/allScripts.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<%--FOR EDIT--%>
<%--FOR EDIT--%>
<%--FOR EDIT--%>
<%--FOR EDIT--%>
<%--FOR EDIT--%>


<%--ЦЕ ВІКНО ДЛЯ РЕДАГУВАННЯ--%>
<!--POP UP WINDOW EDIT_PROFILE-->
<div class="pop_form_edit_profile">
    <div id="modal_form_edit_profile"><!-- Сaмo oкнo -->
        <form class="">

            <div class="edit_profile_page">
                <div class="row edit_profile_detailes">
                    <div class="close_profile_button"><span id="edit_profile_window_close">X</span></div>
                    <div class="col-md-12 edit_profile_detailes_top">
                        <div class="row">
                            <div class="edit_profile_detailes_inside">
                                <!--<span>Name:</span>-->
                                <input id="editName" type="text" placeholder="Enter your name">
                                <div id="erName"></div>
                            </div>
                            <div class="edit_profile_detailes_inside">
                                <!--<span>E-Mail:</span>-->
                                <input id="editEmail" type="text" placeholder="Enter your E-mail">
                                <div id="erMail"></div>
                            </div>
                            <div class="edit_profile_detailes_inside">
                                <!--<span>Phone:</span>-->
                                <input id="editPhone" type="text" placeholder="Enter your phone">
                                <div id="erPhone"></div>
                            </div>
                            <div class="edit_profile_detailes_inside">
                                <!--<span>Password:</span>-->
                                <input id="editPassword" type="text" placeholder="Enter your new password">
                                <div id="erPassword"></div>
                            </div>
                        </div>
                    </div>
                    <!--BOTTOM PROGILE START-->
                    <div class="row edit_profile_detailes_bottom">
                        <div class="edit_button_first">
                            <input class="edit_button_profile_inside" type="button" value="Save Changes"
                                   onclick="editMe()">
                        </div>
                    </div>
                    <!--BOTTOM PROFILE END-->
                </div>
            </div>

        </form>
    </div>


    <div id="overlay_edit_profile"></div><!-- Пoдлoжкa -->
</div>
<!--END OF POP UP WINDOW EDIT_PROFILE-->
<%--ЦЕ КІНЕЦЬ ВІКНА ДЛЯ РЕДАГУВАННЯ--%>


<%--<select var="book" items="${user.phone}">--%>
<%--<div style="background-color: grey">--%>

<%--                <form id="editForm">
                    <input id="editName" type="text" placeholder="name">
                    <div id="erName"></div>

                    <input id="editPhone" type="text" placeholder="phone">
                    <div id="erPhone"></div>
                    <input id="editEmail" type="text" placeholder="email">
                    <div id="erMail"></div>
                    <input id="editPassword" type="text" placeholder="password">
                    <div id="erPassword"></div>

                    <input type="button" onclick="editMe()">
                </form>--%>
<script>
    var phn = true;
    var na = false;
    var eme = false;
    var pas = false;
    var namefield;
    var surnamefield;
    var phonefield;
    var emailfield;
    var passwordfield;
    var confirmPasswordfield;
    var canAdd = false;

    editPhone.onblur = function () {

        if (!isNaN(editPhone.value)) {

            editPhone.style.borderColor = "green";
            erPhone.innerHTML = '';
        }
        else if (isNaN(editPhone.value)) {
            editPhone.style.borderColor = "red";
            erPhone.innerHTML = 'not a number';
            phn = false;
        }
        else {
            editPhone.style.borderColor = "red";
            erPhone.innerHTML = '';
            phn = false;

        }
    }

    editName.onblur = function () {

        editName.style.borderColor = "green";
        erName.innerHTML = "";
        namefield = this.value;
        na = true;
    }
    var isKyr = function (str) {
        return /[а-я]/i.test(str);
    }
    editEmail.onblur = function () {
        this.css = this.className;
        var em = this.value;
        if (!this.value) {
            emailfield = null;
            editEmail.style.borderColor = "green";
            erMail.innerHTML = '';
            eme = true;
        }

        else if (this.value) {

            if (isKyr(this.value)) {
                emailfield = null;
                editEmail.style.borderColor = "red";
                erMail.innerHTML = 'please  email in latin letters';
                eme = false;
            }

            else {
                var r = /^\w+@\w+\.\w{2,4}$/i;
                if (!r.test(document.getElementById("editEmail").value)) {
                    emailfield = null;
                    editEmail.style.borderColor = "red";
                    erMail.innerHTML = 'please enter correct  email ';
                    eme = false;
                }

                else {
                    fetch("ckeckMail", {
                        method: 'post',
                        body: editEmail.value
                    })
                            .then(function (response) {
                                return response.text();
                            })
                            .then(function (data) {
                                if (data !== "empty") {
                                    emailfield = null;
                                    editEmail.style.borderColor = "red";
                                    erMail.innerHTML = 'this email is already registered';
                                    eme = false;
                                }
                                else {
                                    editEmail.style.borderColor = "green";
                                    erMail.innerHTML = '';
                                    emailfield = em;
                                    eme = true;
                                }
                            })
                            .catch(error);

                }


            }
        }
    }


    editPassword.onblur = function () {
        var passwordval = this.value;
        if (!this.value) {
            editPassword.style.borderColor = "green";
            erPassword.innerHTML = "";
            passwordfield = null;
            pas = true;
        }
        else if (isKyr(this.value)) {
            editPassword.style.borderColor = "red";
            erPassword.innerHTML = "please enter password in latin symbols";
            passwordfield = null;
            pas = false;
        }
        else if (this.value.length < 4 && this.value && !isKyr(this.value)) {
            editPassword.style.borderColor = "red";
            erPassword.innerHTML = "password is too short (min 4 symbols)";
            passwordfield = null;
            pas = false;
        }
        else {
            editPassword.style.borderColor = "green";
            erPassword.innerHTML = "";
            passwordfield = passwordval;
            pas = true;
        }
    }
</script>


<%--FOR EDIT END--%>
<%--FOR EDIT END--%>
<%--FOR EDIT END--%>
<%--FOR EDIT END--%>
<%--FOR EDIT END--%>

<%--CABINET START--%>

<div class="container-fluid cabinet_main_container">
    <div class="container cabinet_container">

        <div class="row cabinet_main">
            <div class="col-md-12 cabinet_top">
                <ul class="cabinet_top_menu">
                    <li>Today is: <span id="date_now"></span></li>
                    <li>Time: <span id="clock"></span></li>
                        <li>
                            <a id="go_edit_profile" href="#">
                            [Edit profile]
                        </a>
                        </li>
                </ul>
            </div>
            <div class="col-md-12 cabinet_inside">
                <div class="col-md-2 cabinet_inside_left">
                    <ul class="cabinet_inside_left_menu">
                        <li><a href="/Main">Main</a></li>
                        <li class="open_cabinet_profile_block"><a>My profile</a></li>
                        <li class="open_cabinet_chat_block"><a>Chat</a></li>
                    </ul>
                </div>

                <div class="col-md-10 cabinet_inside_right">
                    <!--PROFILE START-->
                    <div class="cabinet_profile_block">

                        <table class="cabinet_profile_block_menu">
                            <tr>
                                <td colspan="2">Profile Detailes:</td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td>${user.name}</td>
                            </tr>
                            <tr>
                                <td>Surname:</td>
                                <td>${user.surname}</td>
                            </tr>
                            <tr>
                                <td>E-Mail:</td>
                                <td>${user.email}</td>
                            </tr>
                            <tr>
                                <td>Phone:</td>
                                <td>${user.phone}</td>
                            </tr>
                            <tr>
                                <td>Registration date:</td>
                                <td>15.01.2017</td>
                            </tr>
                        </table>
                        <style>
                            .my_project_info{
                                display: none;
                            }
                        </style>
                        <table class="my_project_info">
                            <tr>
                                <td colspan="3">Status of project:</td>
                            </tr>
                            <c:forEach items="${usersBlank}" var="blank">
                                <style>
                                    .my_project_info{
                                        display: inline-table;
                                    }
                                </style>
                            <tr>
                                <td>${blank.projectNamae}</td>
                                <td>${blank.projectInfo}</td>
                                <td>${blank.redyPercent}</td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <!--PROFILE END-->
                    <!--CHAT START-->
                    <div class="cabinet_chat_block">
                        <div id="cabinet_msg_box" class="cabinet_msg_box">
                            <c:forEach items="${userMass}" var="Usermassage">
                                <div class="cabinet_outcome_msg">
                                    <div class="outcome_msg_top">
                            <span class="outcome_msg_author">
                                <c:if test="${Usermassage.direct=='tous'}">
                                    ${Usermassage.user.name}</c:if>
                        <c:if test="${Usermassage.direct=='fromUs'}">
                            <span style="color: #ff7878;">
                            Admin
                            </span>
                        </c:if>
                                </span>
                                        <span class="outcome_msg_date">
                                                ${Usermassage.date}
                                        </span>
                                    </div>
                                    <span>
                                            ${Usermassage.massage}
                                    </span>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="col-md-12 cabinet_text_chat">
                            <textarea type="text" id="mass" placeholder="addMassage" class="form-control"
                                      rows="3"></textarea>
                        </div>
                        <div class="col-md-12 chat_button_main">
                            <button value="addmass" onclick="addmass()" type="submit"
                                    class="btn btn-default chat_button" onclick="addmass()">Send Message
                            </button>
                        </div>
                    </div>
                    <!--CHAT END-->
                </div>
            </div>

            <div class="col-md-12 cabinet_bottom"></div>

        </div>
    </div>
</div>


<%--CHAT SCRIPT START--%>


<script>
    function addmass() {

        var xhr = new XMLHttpRequest()
        xhr.open("POST", "/chat/userSendMassage", false);
        xhr.send(mass.value);
        location.reload()


//                        $.ajax({
//                            url: '/chat/userSendMassage',
////                            dataType: 'text',
//                            type: 'post',
//                            data: mass.value,
//                            success: function (data, textStatus, jQxhr) {
//                                alert(data);
//                            },
//                            error: function (jqXhr, textStatus, errorThrown) {
//                                alert(jqXhr + "   erroree------------")
//                            }
//                        })

    }

</script>

<%--CHAT SCRIPT END--%>


<style>
    .cabinet_profile_block {
        display: none;
    }

    .cabinet_chat_block {

    }
</style>


<script>
    /*CLOCK*/
    function digitalWatch() {
        var date = new Date();
        var curr_date = date.getDate();
        var curr_month = date.getMonth();
        var curr_year = date.getFullYear();

        var hours = date.getHours();
        var minutes = date.getMinutes();
        var seconds = date.getSeconds();


        if (hours < 10) hours = "0" + hours;
        if (minutes < 10) minutes = "0" + minutes;
        if (seconds < 10) seconds = "0" + seconds;

        date_now.innerHTML = ('0' + curr_date).slice(-2) + "." + ('0' + (curr_month + 1)).slice(-2) + "." + curr_year;
        /*    date_now.innerHTML = curr_date + "." + curr_month + "." + curr_year;*/
        clock.innerHTML = hours + ":" + minutes + ":" + seconds;
    }
    setInterval(digitalWatch, 1000);

    /*CLOCK END*/
    /*SCROLL*/
    var block = document.getElementById("cabinet_msg_box");
    block.scrollTop = block.scrollHeight;
    /*SCROLL*/

    /*OPTIONS*/
    block_profile = $(".cabinet_profile_block");
    block_chat = $(".cabinet_chat_block");
    var profile = $(".open_cabinet_profile_block");
    var open_chat_block = $(".open_cabinet_chat_block");
    /*OPTIONS*/
    /*PROFILE PAGE*/
    profile.on('click', function () {
        if (block_profile.css('display') == 'none'){
            block_profile.fadeToggle();
        }
        block_chat.css("display", "none");
    });
    /*PROFILE PAGE*/
    /*CHAT PAGE*/
    open_chat_block.on('click', function () {
        if (block_chat.css('display') == 'none'){
            block_chat.fadeToggle();
        }
        block_profile.css("display", "none");
    });
    /*CHAT PAGE*/
</script>


<script src="js/bootstrap.js"></script>
<script src="resources/js/popupreg.js"></script>
<%--CABINET END--%>


<%--<c:forEach items="${user}" var="a">--%>
<%--${a.email}--%>
<%--</c:forEach>--%>
<%--</div>--%>
<%--<br>--%>
<%--</select>--%>

</body>
</html>

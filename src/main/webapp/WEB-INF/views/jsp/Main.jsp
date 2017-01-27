<!DOCTYPE html>
<html lang="en">
<head>


    <%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
    <%--<sec:authorize access="hasRole('ROLE_USER')">--%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%--<meta charset="utf-8">--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Landing</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/font-awesome.min.css">
    <link href="resources/css/full-slider.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://use.fontawesome.com/465a714587.js"></script>
    <%--<script src=" https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js "></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>


<div class="container-fluid logo_container parallax-window" data-parallax="scroll"
     data-image-src="resources/img/logo.jpg">
    <div class="container">
        <header>
            <div class="col-md-12 logo_background">
                <div class="logo_menu">
                    <div id="main_menu_logo" class="menu_romb">
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4 contacts_logo border_b border_r hidden-sm hidden-xs">
                                <!--CONTACTS-->
                                <div class="row-fluid contacts_logo_menu">
                                    <div class="row">
                                        <div class="col-md-6"></div>
                                        <div class="col-md-2 contacts_logo_block">
                                            <i class="fa fa-skype contacts_icon" aria-hidden="true"></i>
                                        </div>
                                        <div class="col-md-4"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-2 contacts_logo_block">
                                            <i class="fa fa-vk contacts_icon" aria-hidden="true"></i>
                                        </div>
                                        <div class="col-md-2"></div>


                                        <%--MSG ICON ROMB START--%>
                                        <%--IF NO MAIL ROMB--%>
                                        <style>
                                            .mail_romb_main {
                                                display: none;
                                            }
                                        </style>
                                        <%--IF NO MAIL ROMB END--%>

                                        <c:if test="${massages!=null}">
                                            <style>
                                                .mail_romb_main {
                                                    display: block;
                                                }
                                            </style>
                                            <a href="/cabinet" style="color: white;">
                                                <div class="col-md-2 contacts_logo_block mail_romb_main">
                                                    <div class="mail_romb">
                                                        <i class="fa fa-envelope-o contacts_icon"
                                                           aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </a>
                                        </c:if>
                                        <%--MSG ICON ROMB END--%>


                                        <div class="col-md-2"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2"></div>

                                        <div class="col-md-2 contacts_logo_block"><i
                                                class="fa fa-facebook contacts_icon"
                                                aria-hidden="true"></i></div>

                                        <sec:authorize access="isAuthenticated()">
                                            <a <%--id="go_profile"--%> href="/cabinet">
                                                <div class="col-md-2 last_contacts_logo_block">
                                                    <i class="fa fa-user contacts_icon" aria-hidden="true"></i>
                                                </div>
                                            </a>
                                            <div class="col-md-2"></div>


                                            <%--<form:form action="/logout" method="post">--%>
                                            <style>
                                                .log_out_button {
                                                    /*position: absolute;*/
                                                    background: none;
                                                    border: none;
                                                    margin: 0;
                                                    padding: 0;
                                                }
                                            </style>
                                            <button class="log_out_button" type="submit"
                                                    onclick="document.location='/logout'">
                                                <div class="col-md-2 contacts_logo_block">
                                                    <i class="fa fa-power-off contacts_icon" aria-hidden="true"></i>
                                                </div>
                                            </button>
                                            <%--</form:form>--%>
                                        </sec:authorize>
                                        <div class="col-md-2"></div>
                                    </div>
                                </div>
                                <!--CONTACTS END-->
                            </div>

                            <!--MOBILE START-->
                            <div class="hidden-lg hidden-md">


                                <%--IF NOT REG START--%>
                                <sec:authorize access="isAnonymous()">
                                    <div class="col-xs-12 mobile_block_top">

                                        <span>Hello, please log in</span>

                                        <div class="">
                                            <a href="#" id="go_login">
                                                <i class="fa fa-registered contacts_icon_mob" aria-hidden="true"></i>
                                            </a>
                                        </div>

                                    </div>
                                </sec:authorize>
                                <%--IF NOT REG END--%>


                                <%--IF USER LOG IN START--%>
                                <sec:authorize access="isAuthenticated()">
                                    <div class="col-xs-12 mobile_block_top">

                                        <div class="user_hello_block">
                                            <span>Hello,
                                                <span class="user_hello">${user.name}!</span>
                                             </span>
                                        </div>
                                            <%--MSGS--%>
                                        <c:if test="${massages!=null}">
                                            <style>
                                                .user_hello_block {
                                                    display: none;
                                                }
                                            </style>
                                            <div class="user_new_msg_block_mob">
                                                <a href="/cabinet">You have
                                                    <span class="new_msgs_user_mob">${massages}</span>
                                                    new massages
                                                </a>
                                            </div>
                                        </c:if>
                                            <%--MSGS--%>


                                        <div class="profile_button_mob_main">
                                            <a onclick="document.location='/cabinet'" id="go_profile">
                                                <i class="fa fa-user contacts_icon_mob" aria-hidden="true"></i>
                                            </a>
                                        </div>


                                            <%--IF MESSAGES ICON BLOCK--%>
                                        <c:if test="${massages!=null}">
                                            <div class="msg_button_mob">
                                                <a href="/cabinet">
                                                    <i class="fa fa-envelope-o contacts_icon_mob"
                                                       aria-hidden="true"></i>
                                                    <sup class="number_of_msgs_mob">${massages}</sup>
                                                </a>
                                            </div>
                                        </c:if>
                                            <%--END IF MESSAGES ICON BLOCK--%>


                                        <div class="logout_button_mob_main">
                                                <%--<form:form action="/logout" method="post">--%>

                                                <%--This is for mobiles--%>

                                            <button class="log_out_button_mob" type="submit"
                                                    onclick="document.location='/logout'">
                                                <i class="fa fa-power-off contacts_icon_mob" aria-hidden="true"></i>
                                            </button>
                                                <%--</form:form>--%>


                                        </div>

                                    </div>
                                </sec:authorize>
                                <%--IF USER LOG IN END--%>


                                <%--IF INCORRECT LOGIN START--%>
                                <c:if test="${param.error != null}">
                                    <!--START-->
                                    <div class="col-xs-12 mobile_block_top">
                                        <div class="incorrect_info_mob">
                                            <p>Invalid username and password.</p>
                                        </div>
                                    </div>
                                    <!--END-->
                                </c:if>
                                <%--IF NOT CORRECT LOGIN END--%>


                            </div>
                            <!--MOBILE END-->
                            <div class="col-md-4"></div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">
                                <!--LOGIN FORM-->
                                <div class="login_logo_form hidden-sm hidden-xs">
                                    <sec:authorize access="isAnonymous()">
                                        <div class="button_reg_logo1">

                                            <a href="#" id="go">

                                                <input type="button" value="Registration">


                                            </a>

                                        </div>
                                    </sec:authorize>


                                    <%--================================================================================================================================                                   --%>


                                    <sec:authorize access="isAnonymous()">

                                        <form class="logo_form" action="/loginprocessing" method="POST">
                                            <div class="login_logo">
                                                <input id="input_change_login" type="email" class="login"
                                                       name="username" placeholder="Login">

                                            </div>
                                            <div class="password_logo">

                                                <input id="input_change_pass" type="password" class="password"
                                                       name="password" type="password"
                                                       placeholder="Password">
                                            </div>
                                            <div class="button_login_logo">
                                                <input type="submit" value="LOG IN">
                                            </div>

                                        </form>
                                    </sec:authorize>

                                </div>
                                <!--LOGIN FORM END-->

                            </div>
                            <div class="col-md-2 logo_block border_lr border_b">
                                <a class="jakor" href="#screen_3">
                                    <div class="logo_block_content">
                                        <i class="fa fa-envelope-o third_romb_logo small_first_block"
                                           aria-hidden="true"></i> <!--THIRD ROMB-->
                                        <span class="third_logo_description">Testimonals</span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-2 logo_block border_tb border_r">
                                <a class="jakor" href="#screen_4">
                                    <div class="logo_block_content">
                                        <i class="fa fa-television first_romb_logo" aria-hidden="true"></i>
                                        <span class="first_logo_description">Services</span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-2 logo_block_user border_all hidden-sm hidden-xs">

                                <div id="error_reg_romb" class="logo_block_content">
                                    <img src="resources/img/romb_image3.jpg">
                                </div>
                                <%--IF USER LOG IN START--%>
                                <sec:authorize access="isAuthenticated()">
                                    <style>
                                        #error_reg_romb {
                                            display: none;
                                        }

                                        .user_info {
                                            position: relative;
                                            height: 253px;
                                            width: 260px;
                                            color: #ff7878;
                                            padding-top: 95px;
                                        }

                                        .user_info span {
                                            position: static;
                                            text-align: center;
                                            font-size: 30px;
                                            line-height: 20px;

                                        }

                                        #log_in_hello {
                                            color: white;
                                        }

                                        .user_info_name {
                                            color: #ff7878;
                                        }

                                        @media only screen and (max-width: 1200px) {
                                            .logo_block_user {
                                                height: 150px;

                                            }

                                            .user_info {
                                                top: 0px;
                                                left: -15px;
                                                padding-top: 85px;
                                            }

                                            .user_info span {
                                                position: static;
                                                text-align: center;
                                                font-size: 25px;
                                                line-height: 15px;

                                            }
                                        }
                                    </style>
                                    <div class="logo_block_content hidden-sm hidden-xs">
                                        <div class="user_info">
                                            <span>
                                            <p id="log_in_hello">Hello,</p>
                                                <p class="user_info_name">${user.name}</p>
                                             </span>
                                        </div>


                                            <%--ОСЬ ТУТ РЕДАГУЙ МЕСЕНДЖИ--%>
                                            <%--ОСЬ ТУТ РЕДАГУЙ МЕСЕНДЖИ--%>
                                            <%--IF MSGS MAIN BLOCK--%>
                                        <c:if test="${massages!=null}">
                                            <style>
                                                .user_info {
                                                    display: none;
                                                }
                                            </style>
                                            <a href="/cabinet" style="color: white;">
                                                <div class="user_msg_info">
                                            <span>
                                            <p>You have </p>
                                                <p class="user_msg_info_detailes">${massages} new messages.</p>
                                             </span>
                                                </div>
                                            </a>
                                        </c:if>
                                            <%--END IF MSG MAIN BLOCK--%>
                                            <%--ОСЬ ТУТ РЕДАГУЙ МЕСЕНДЖИ--%>


                                    </div>
                                </sec:authorize>
                                <%--IF USER LOG IN END--%>
                                <%--IF NOT CORRECT LOGIN START--%>
                                <c:if test="${param.error != null}">
                                    <style>
                                        #error_reg_romb {
                                            display: none;
                                        }
                                    </style>
                                    <div class="logo_block_content hidden-sm hidden-xs">
                                        <div class="incorrect_info">
                                            <p>Invalid username and password.</p>
                                        </div>
                                    </div>
                                </c:if>
                                <%--IF NOT CORRECT LOGIN END--%>

                            </div>
                            <div class="col-md-4"></div>
                            <div class="col-md-2 logo_block border_lr border_b hidden-sm hidden-xs">
                                <div class="logo_block_content">
                                    <img src="resources/img/romb_image1.jpg">
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-2 logo_block border_all hidden-sm hidden-xs">
                                <div class="col-md-2 logo_block_content">
                                    <img class="img_logo" src="resources/img/logoType2.jpg">
                                </div>
                            </div>
                            <div class="col-md-2"></div>
                            <div class="col-md-2 logo_block border_all">


                                <a class="jakor rules_open_button" href="#rules_block">
                                    <div class="logo_block_content">
                                        <i class="fa fa-file-text rules_romb_logo" aria-hidden="true"></i>
                                        <!--ROMB RULES-->
                                        <span class="rules_logo_description">Rules</span>
                                    </div>
                                </a>

                                <%-- <div class="logo_block_content">
                                                                    <img src="resources/img/romb_image2.jpg">
                                                                </div>--%>

                            </div>
                            <div class="col-md-2 logo_block border_tb border_r">
                                <a class="jakor" href="#screen_11">
                                    <div class="logo_block_content">
                                        <i class="fa fa-address-card fifth_romb_logo" aria-hidden="true"></i>
                                        <!--FIFTH ROMB-->
                                        <span class="fifth_logo_description">Contact us</span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-4"></div>
                        </div>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-2">
                                <span class="brandaloka"><span style="color:#ff7878">Ath</span>ene<span
                                        style="color:#ff7878">.</span></span>
                            </div>
                            <div class=" col-md-2 logo_block border_lr border_b">
                                <a class="jakor" href="#screen_2">
                                    <div class="logo_block_content">
                                        <i class="fa fa-users fourth_romb_logo" aria-hidden="true"></i>
                                        <!--FORTH ROMB-->
                                        <span class="fourth_logo_description">About us</span>
                                    </div>
                                </a>
                            </div>
                            <div class="col-md-2 logo_block border_b hidden-sm hidden-xs"></div>
                            <div class="col-md-4"></div>
                            <div class="hidden-lg hidden-md">
                                <!--CONTACTS END-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
    </div>
    <!--CONTACTS-->
    <div class="hidden-lg hidden-md">
        <div class="col-xs-12 mobile_block mobile_block_bottom">
            <div class="">
                <i class="fa fa-vk contacts_icon_mob" aria-hidden="true"></i>
            </div>
            <div class="">
                <i class="fa fa-instagram contacts_icon_mob" aria-hidden="true"></i>
            </div>
            <div class="">
                <i class="fa fa-facebook contacts_icon_mob" aria-hidden="true"></i>
            </div>
            <div class="">
                <i class="fa fa-youtube contacts_icon_mob" aria-hidden="true"></i>
            </div>
        </div>
    </div>
    <!--CONTACTS END-->


    <%--ОСЬ І ПОЧАТОК ФОРМИ--%>
    <!--POP UP WINDOW LOGIN-->
    <div class="pop_form_login_main">
        <div id="modal_form_login"><!-- Сaмo oкнo -->
            <span id="modal_close_login">X</span>
            <%--      <form class="pop_form_mob">--%>


            <%--ЦЕ ВІКНО ДЛЯ ЛОГІНУВАННЯ З МАЛЕНЬКИХ ЕКРАНІВ--%>
            <form class="logo_form pop_form_mob" action="/loginprocessing" method="POST">

                <input class="login_mob" type="email" name="username" placeholder="Login">

                <input class="password_mob" name="password" type="password"
                       placeholder="Password">
                <input class="button_login_logo_mob" type="submit" value="LOG IN"> <%--ЦЕ КНОПКА ДЛЯ ЛОГІНУВАННЯ--%>
                <br>
                <a href="#" id="go">
                        <span id="modal_close_login3">
                        Not Registered yet?
                        </span>
                </a>
            </form>
            <%--       </form>--%>
        </div>


        <div id="overlay_login"></div><!-- Пoдлoжкa -->
    </div>
    <!--END OF POP UP WINDOW LOGIN-->
    <%--ОСЬ КІНЕЦЬ ЦЯ ФОРМА--%>


    <!--POP UP WINDOW PROFILE-->
    <%--<div class="pop_form_profile">--%>
    <%--<div id="modal_form_profile"><!-- Сaмo oкнo -->--%>
    <%--&lt;%&ndash;          <span id="modal_close_profile">X</span>&ndash;%&gt;--%>
    <%--<form class="">--%>
    <%--<div class="profile_page">--%>
    <%--<div class="row profile_detailes">--%>
    <%--<div class="close_profile_button"><span id="profile_window_close">X</span></div>--%>
    <%--<div class="col-md-12 profile_detailes_top">--%>
    <%--<div class="row">--%>
    <%--<div class="profile_detailes_inside">--%>
    <%--<span>Nickname: Andy</span>--%>
    <%--</div>--%>
    <%--<div class="profile_detailes_inside">--%>
    <%--<span>Name: Andrew</span>--%>
    <%--</div>--%>
    <%--<div class="profile_detailes_inside">--%>
    <%--<span>E-Mail: cool@google.com</span>--%>
    <%--</div>--%>
    <%--<div class="profile_detailes_inside">--%>
    <%--<span>Phone: +380877845457</span>--%>
    <%--</div>--%>
    <%--<div class="profile_detailes_inside">--%>
    <%--<span id="modal_close_profile3">--%>
    <%--<a href="/cabinet">[Full profile]</a>--%>
    <%--<a id="go_edit_profile" href="#">[Edit profile]</a>--%>
    <%--</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<!--BOTTOM PROGILE START-->--%>
    <%--<div class="row profile_detailes_bottom">--%>
    <%--<div class="button_first">--%>
    <%--<span id="modal_close_profile2">--%>
    <%--<a class="button_style" href="#screen_11">--%>
    <%--<input class="button_profile_inside" type="button" value="Contact us">--%>
    <%--</a>--%>
    <%--</span>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<!--BOTTOM PROFILE END-->--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</form>--%>
    <%--</div>--%>


    <%--<div id="overlay_profile"></div><!-- Пoдлoжкa -->--%>
    <%--</div>--%>
    <!--END OF POP UP WINDOW PROFILE-->


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
                                    <input type="" placeholder="Enter your name">
                                </div>
                                <div class="edit_profile_detailes_inside">
                                    <!--<span>E-Mail:</span>-->
                                    <input type="e-mail" placeholder="Enter your E-mail">
                                </div>
                                <div class="edit_profile_detailes_inside">
                                    <!--<span>Phone:</span>-->
                                    <input type="text" placeholder="Enter your phone">
                                </div>
                                <div class="edit_profile_detailes_inside">
                                    <!--<span>Password:</span>-->
                                    <input type="password" placeholder="Enter your new password">
                                </div>
                                <div class="edit_profile_detailes_inside">
                                    <!--<span>Password:</span>-->
                                    <input type="password" placeholder="Confirm your password">
                                </div>
                            </div>
                        </div>
                        <!--BOTTOM PROGILE START-->
                        <div class="row edit_profile_detailes_bottom">
                            <div class="edit_button_first">
                                <input class="edit_button_profile_inside" type="button" value="Save Changes">
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
    <%--ЦЕ ВІКНО ДЛЯ РЕДАГУВАННЯ--%>


    <!--POP UP WINDOW ERRORLOGIN-->

    <%--    <div class="pop_form_login_main_error">
            <div id="modal_form_error"><!-- Сaмo oкнo -->
                <span id="modal_close_error">X</span>
                <form>

    <sec:authorize access="isAuthenticated()">
        <style>
            .incorrect_info_mob{
                display:none;
            }
        </style>
                    <div class="incorrect_info_mob">
                        <p>You are sign in!</p>
                    </div>
    </sec:authorize>
                            <div class="incorrect_info_mob">
                                <p>Invalid username and password.</p>

                        </div>



                </form>
            </div>


            <div id="overlay_error"></div><!-- Пoдлoжкa -->
        </div>--%>

    <!--END OF POP UP WINDOW ERROR_LOGIN-->
    <!--POP UP WINDOW REGISTRATION-->
    <div id="modal_form"><!-- Сaмo oкнo -->
        <span id="modal_close">X</span>
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
        </script>
        <form name="addjjj" id="regform" class="pop_form">
            <div class="pop_logo">
                <span>Registration Block</span>
            </div>
            <input name="name" id="names" type="text" placeholder="name">
            <div id="errorname"></div>

            <input name="surname" id="surname" type="text" placeholder="surname"><br/>
            <input name="email" id="email" type="text" placeholder="email">
            <div id="errormail"></div>

            <input name="phone" id="phone" type="text" placeholder="phone">
            <div id="errorphone"></div>

            <input name="password" id="password" type="password" placeholder="password">
            <div id="errorpassword"></div>

            <input name="confirmPassword" id="confirmPassword" type="password" placeholder="confirm password">
            <div id="errorpasswordConfirm"></div>

            <div class="pop_button">
                <input type="button" id="checkValuesButton" onclick="checkFields()" value="Register ME">
            </div>

            <%--<input type="submit" id="sendButton" onclick="valid()" value="Register Me"--%>
            <%--style="visibility: hidden;float: right">--%>
        </form>


        <script>

            phone.onblur = function () {
                if (!isNaN(this.value)) {
                    phone.style.borderColor = "green";
                    errorphone.innerHTML = '';
                    phn = true;

                }
                else if (isNaN(this.value)) {
                    phone.style.borderColor = "red";
                    errorphone.innerHTML = 'not a number';
                    phn = false;
                }
                else {
                    phone.style.borderColor = "red";
                    errorphone.innerHTML = '';
                    phn = false;

                }
            }
            names.onblur = function () {
                if (!this.value) {
                    namefield = null;
                    names.style.borderColor = "red";
                    errorname.innerHTML = 'please enter your name.';
                    na = false;
                }

                else {
                    names.style.borderColor = "green";
                    errorname.innerHTML = "";
                    namefield = this.value;
                    na = true;
//                    if (isKyr(this.value)) {
//
//                    }
                }
            }
            email.onblur = function () {
                this.css = this.className;
                var em = this.value;
                if (!this.value) {
                    emailfield = null;
                    email.style.borderColor = "red";
                    errormail.innerHTML = 'please enter your email.';
                    eme = false;
                }

                else if (this.value) {

                    if (isKyr(this.value)) {
                        emailfield = null;
                        email.style.borderColor = "red";
                        errormail.innerHTML = 'please  email in latin letters';
                        eme = false;
                    }

                    else {
                        var r = /^\w+@\w+\.\w{2,4}$/i;
                        if (!r.test(document.getElementById("email").value)) {
                            emailfield = null;
                            email.style.borderColor = "red";
                            errormail.innerHTML = 'please enter correct  email ';
                            eme = false;
                        }

                        else {

                            $.ajax({
                                type: 'post',
                                url: '/ckeckMail',
                                dataType: 'text',
                                contentType: "text/plain; charset=utf-8",
                                data: document.getElementById("email").value,
                                success: function (data, textStatus, jQxhr) {

                                    if (data !== "empty") {
                                        emailfield = null;
                                        email.style.borderColor = "red";
                                        errormail.innerHTML = 'this email is already registered';
                                        eme = false;
                                    }
                                    else {
                                        email.style.borderColor = "green";
                                        errormail.innerHTML = '';
                                        emailfield = em;
                                        eme = true;
                                    }
                                },
                                error: function (jqXhr, textStatus, errorThrown) {

                                }
                            })


//                            fetch("/ckeckMail", {
//                                method: 'post',
//                                body: this.value
//                            })
//                                    .then(function (response) {
//                                        return response.text();
//                                    })
//                                    .then(function (data) {
//                                        alert(data)
//                                        if (data !== "empty") {
//                                            emailfield = null;
//                                            email.style.borderColor = "red";
//                                            errormail.innerHTML = 'this email is already registered';
//                                            eme = false;
//                                        }
//                                        else {
//                                            email.style.borderColor = "green";
//                                            errormail.innerHTML = '';
//                                            emailfield = em;
//                                            eme = true;
//                                        }
//                                    })
//                                    .catch(error);

                        }


                    }
                }
            }
            var isKyr = function (str) {
                return /[а-я]/i.test(str);
            }
            password.onblur = function () {
                var passwordval = this.value;
                if (!this.value) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "please enter password";
                    passwordfield = null;
                    pas = false;
                }
                else if (isKyr(this.value)) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "please enter password in latin symbols";
                    passwordfield = null;
                    pas = false;
                }
                else if (this.value.length < 4 && this.value && !isKyr(this.value)) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "password is too short (min 4 symbols)";
                    passwordfield = null;
                    pas = false;
                }
                else {
                    password.style.borderColor = "green";
                    errorpassword.innerHTML = "";
                    passwordfield = passwordval;
                    pas = true;
                }
            }
            confirmPassword.onblur = function () {
                var passwordConfirm = this.value;
                if (!passwordConfirm
                        & passwordfield) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "please enter password  from confirm";
                    confirmPasswordfield = null;
                    pas = false;
                }
                else if (this.value != passwordfield) {
                    confirmPassword.style.borderColor = "red";

                    errorpasswordConfirm.innerHTML = "password does not match";
                    confirmPasswordfield = null;
                    pas = false;
                }
                else {
                    confirmPassword.style.borderColor = "green";
                    errorpasswordConfirm.innerHTML = "password match";
                    confirmPasswordfield = passwordConfirm;
                    pas = true;
                }
            }

            function checkFields() {

                var re = /^\w+@\w+\.\w{2,4}$/i;
                if (re.test(document.getElementById("email").value)
                        & !isKyr(document.getElementById("email").value
                                & document.getElementById("email").value)
                ) {
                    emailfield = document.getElementById("email").value;
                    email.style.borderColor = "green";
                    errormail.innerHTML = ' ';
                    eme = true;

                }
                if (document.getElementById("confirmPassword").value != document.getElementById("password").value) {
                    pas = false
                }
                if (!document.getElementById("phone").value) {
                    phn = true;
                }
                if (!document.getElementById("email").value) {
                    email.style.borderColor = "red";
                    errormail.innerHTML = 'please enter your email.';
                }
                if (isKyr(document.getElementById("email").value)) {
                    emailfield = null;
                    email.style.borderColor = "red";
                    errormail.innerHTML = 'please  email latin symbols';
                    eme = false;
                }
                var r = /^\w+@\w+\.\w{2,4}$/i;

                if (!r.test(document.getElementById("email").value)) {

                    emailfield = null;
                    email.style.borderColor = "red";
                    errormail.innerHTML = 'please enter correct  email ';
                    eme = false;
                }
                if (r.test(document.getElementById("email").value)) {
//                    var mala = document.getElementById("email").value;
//                    alert(mala)

                    $.ajax({
                        url: "/ckeckMail",
                        dataType: 'text',
                        type: "post",
                        async: false,
                        data: document.getElementById("email").value,
                        contentType: "text/html; charset=utf-8",
                        success: function (data, textStatus, jQxhr) {


                            if (data !== 'empty') {
                                emailfield = null;
                                email.style.borderColor = "red";
                                errormail.innerHTML = 'this email is already registered';
                                eme = false;
                            }
                            else if (data === "empty") {
                                email.style.borderColor = "green";
                                errormail.innerHTML = '';
                                emailfield = document.getElementById("email").value;
                                eme = true;
                            }
                        },
                        error: function (jqXhr, textStatus, errorThrown) {
                        }
                    })

                }


                if (!document.getElementById("names").value) {
                    names.style.borderColor = "red"
                    errorname.innerHTML = 'please enter your name.';
                }

                if (!document.getElementById("password").value) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "please enter correct password";
                }
//
                if (isKyr(document.getElementById("password").value)) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "please enter  password in latin symbols";
                }
                if (document.getElementById("password").value & document.getElementById("password").value.length < 4) {
                    password.style.borderColor = "red";
                    errorpassword.innerHTML = "password is too short (min 4 symbols)";
                }
                if (document.getElementById("password").value.length >= 4 & !document.getElementById("confirmPassword").value) {
                    confirmPassword.style.borderColor = "red";
                    errorpasswordConfirm.innerHTML = "please enter password  from confirm";
                }
                if (document.getElementById("password").value.length >= 4 &&
                        document.getElementById("confirmPassword").value != undefined && document.getElementById("confirmPassword").value !== document.getElementById("password").value) {
                    confirmPassword.style.borderColor = "red";


                    errorpasswordConfirm.innerHTML = "password does not match";
                }
                if (document.getElementById("password").value.length >= 4 &&
                        document.getElementById("confirmPassword").value == document.getElementById("password").value) {
                    confirmPassword.style.borderColor = "green";
                    errorpasswordConfirm.innerHTML = "";
                    password.style.borderColor = "green";
                    errorpassword.innerHTML = "";
                    pas = true;
                }

                if (eme == true & na == true & pas == true & phn == true) {

                    valid();
                    function valid() {

                        if (namefield != null & emailfield != null & passwordfield != null) {
                            surnamefield = document.getElementById("surname").value;
                            phonefield = document.getElementById("phone").value;
                            var use = {
                                "name": namefield,
                                "surname": surnamefield,
                                "phone": phonefield,
                                "email": emailfield,
                                "password": passwordfield
                            }
                            var compleatedUser = JSON.stringify(use);
                            var xhc = new XMLHttpRequest();
                            xhc.open("POST", "/registerUsertobase");
                            xhc.send(compleatedUser);
                            var pan = document.createElement("div");
                            pan.id = 'new_user';
                            pan.innerHTML = "You have subscribed. Please check your email"
                            modal_form.style.background = "white";
                            regform.innerHTML = "";
                            regform.appendChild(pan);

                        }
                    }
                }
            }
        </script>
    </div>


    <div id="overlay"></div><!-- Пoдлoжкa -->
    <!--END OF POP UP WINDOW REGISTRATION-->
</div>
<!--END OF HEADER-->


<!--UNDER LOGO BLOCK-->
<div id="screen_2" class="container-fluid under_logo_container">
    <div class="container">
        <div class="row">


            <div class="col-md-12 center_block under_logo_name">


                <span>About <span style="color:#ff7878">Us</span></span>
            </div>
        </div>
        <div class="row third_block_main">
            <div class="col-md-12 under_logo_description">
    <span>
   We are young growing  IT company whose work is devoted to Web Development.
        Our products are web-sites, from Landing-page to Internet-Shop.You have your
        own company and you need web site which represents it? Or you have it  but
        it demands maintenance?. We can offer you a wide range of IT services. Design especially
        for you , or , if you want , design based on your own ideas, and ,of cource , developing... <br>
        Why we? -
        Good quality , conviction in accomplishing on time and low prices. We try to make developing
        process more simplified for you.
We can make your ideas  come true...
Our motto is : Modern idea - satisfied  client

<script>
  var staffee = {};
  getStaff();

  function getStaff() {


      $.ajax({
                  url: '/getStaff',
                  type: 'GET',
                  dataType: 'json',
                  contentType: "application/json; charset=utf-8",
//                  data: JSON.stringify(staffee),
                  success: function (data, textStatus, jQxhr) {

                      staffDesigners.innerHTML = data.designers;
                      staffJS.innerHTML = data.js;
                      staffJava.innerHTML = data.java;
                      staffPhp.innerHTML = data.php;

                  },
                  error: function (o, t, th) {

                  }

              }
      )
  }




</script>
    </span>
            </div>
        </div>
        <div class="row under_logo_main">
            <div class="col-md-3">
                <div class="under_logo_block3">
                    <div class="romb under_logo_block3_inside second_block_romb1">
                        <span class="inside_romb" id="staffDesigners"></span>
                        <span class="inside_romb_description">Designers staff </span>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="under_logo_block3">
                    <div class="romb under_logo_block3_inside second_block_romb2">
                        <span class="inside_romb" id="staffJava"></span>
                        <span class="inside_romb_description">Java staff</span>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="under_logo_block3">
                    <div class="romb under_logo_block3_inside second_block_romb3">
                        <span class="inside_romb" id="staffJS"></span>
                        <span class="inside_romb_description">JavaScript staff</span>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="under_logo_block3">
                    <div class="romb under_logo_block3_inside second_block_romb4">
                        <span class="inside_romb" id="staffPhp"></span>
                        <span class="inside_romb_description">PHP staff</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--END UNDER LOGO BLOCK-->
<!--THIRD BLOCK-->
<div id="screen_3" class="container-fluid third_block_container">
    <div class="container third_block">
        <div class="row">
            <div class="col-md-12 center_block under_logo_name"><span>Testim<span
                    style="color:#ff7878">onials</span> </span></div>
        </div>
        <div class="row third_block_main">
            <div class="col-md-12 under_logo_description">
    <span>
Here are some feedbacks left by  our clients.Notice!-you must be registered to leave a feedback about us.
        We will glad to read your testimonial!!!
    </span>
            </div>
        </div>


        <div class="row third_block_main">
            <div class="col-md-12">
                <!--СТАРТ КАРУСЕЛЬ-->
                <div class="">
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background:none">
                        <span class="icon-prev" style="background-color:#ff7878 ;border-radius: 50%"></span>
                    </a>
                </div>
                <div class="third_block_right">

                    <!--CAROUSEL START-->
                    <div id="myCarousel" class="carousel slide carousel_inside" style="min-height: 200px">
                        <!-- Indicators -->

                        <!-- Wrapper for Slides -->
                        <div class="carousel-inner" id="testimCarusel">
                            <div class="item active" a style='font-size: 30px;text-align: center'>


                                    <span class="testimonials_date">
                                    Sep 27, 2016 9:57:14 PM</span><br>

                                <span style='font-size: 28px;text-align: center'>Jane:</span><br>
                                <span style='font-size: 16px;text-align: center;'>
                                   Wery honest team!!!
                                   </span>
                                <!-- Set the first background image using inline CSS below. -->
                            </div>
                            <!-- Controls -->
                        </div>
                    </div>
                </div>
                <div class="">
                    <a class="right carousel-control col-md-2" href="#myCarousel" data-slide="next"
                       style="background:none">
                        <span class="icon-next" style="background-color:#ff7878 ;border-radius: 50%"></span>
                    </a>
                </div>


            </div>

            <!--CAROUSEL END-->
        </div>


        <sec:authorize access="isAuthenticated()">
            <div class="row">
                    <%--                <!--WRITE TESTIMONALS BUTTON-->
                                    <div class="row">
                                        <div class="col-md-5"></div>
                                        <div class="col-md-2 third_button_main carousel_open_msg_main">
                                            <button id="carousel_open" type="submit" onclick=""
                                                    class="carousel_open_msg btn btn-default third_button">write testimonals
                                            </button>
                                        </div>
                                        <div class="col-md-5"></div>
                                    </div>
                                    <!--WRITE TESTIMONALS BUTTON-->--%>


                <div name="mes" id="mes" class="carousel_textarea">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 eleven_form eleven_form_inside">
                        <div class="carousel_textarea_close">X</div>
                        <textarea type="text" value="text" name="testim" id="testim" class="form-control" rows="5"
                                  button_border></textarea>
                    </div>
                    <div class="col-md-3"></div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-5"></div>
                            <div class="col-md-2 third_button_main">
                                <button type="submit" name="subm" value="add Feedback" onclick="addMas()"
                                        class="btn btn-default third_button">Submit
                                </button>
                            </div>
                            <div class="col-md-5"></div>
                        </div>
                    </div>
                </div>

                <!--WRITE TESTIMONALS BUTTON-->
                <div class="row">
                    <div class="col-md-5"></div>
                    <div class="col-md-2 third_button_main carousel_open_msg_main">
                        <button id="carousel_open" type="submit" onclick=""
                                class="carousel_open_msg btn btn-default third_button">write testimonals
                        </button>
                    </div>
                    <div class="col-md-5"></div>
                </div>
                <!--WRITE TESTIMONALS BUTTON-->
                <!--КАРУСЕЛЬ END-->

            </div>

            <script>
                var btn = $(".carousel_open_msg");
                var close_btn = $(".carousel_textarea_close");
                var block = $(".carousel_textarea");

                btn.on('click', function () {
                    block.css("display", "block");
                    btn.css("display", "none");
                });
                close_btn.on('click', function () {
                    block.css("display", "none");
                    btn.css("display", "block");
                });


                function addMas() {
                    var formd = document.forms.mes;
                    var massageQ = testim.value;
//                                        formd.elements.testim.value;
                    var xhrt = new XMLHttpRequest();
//        xhrt.responseType.text();
                    xhrt.open("POST", "/addTestim");
                    xhrt.send(massageQ);
                    testim.value = "";
                    location.reload()
                    var t = testimoni();
                    t()
                }</script>
        </sec:authorize>
    </div>
</div>
</div>
<script>
    //    header('Content-type: text/html; charset=windows-1251');


    function testimoni() {
        $.ajax({
            type: 'get',
            url: '/refreshMassages',

            contentType: "application/json; charset=utf-8",

            success: function (response, textStatus, jQxhr) {
                for (var q = 0; q < response.length; q++) {

                    var mes = document.createElement('div');
                    var capt = document.createElement('capta');

                    mes.className = 'item';
                    mes.style.cssText = "text-align:center";

                    mes.innerHTML = "<a style='font-size: 12px;text-align: center;float:left;color: #4cae4c;margin-top: 3px;clear: both'>" + response[q].date + "</a><br>" +
                            "<a style='font-size: 28px;text-align: center;clear: both;color:#777777'><br>" +
                            response[q].name + ":" + "</a>" + "<br><br>" + "<a style='margin-top: 15px; line-height: 20px; font-size: 16px;color:black'>" + response[q].testimonial + "</a>";

                    testimCarusel.appendChild(mes);
//                        testimCarusel.appendChild(capt);
                }
            },
            error: function (jqXhr, textStatus, errorThrown) {

            }
        })


//        fetch('/refreshMassages')
//                .then(function (response) {
//                    return response.json();
//                })
//                .then(function (response) {
//
//
//                    for (var q = 0; q < response.length; q++) {
//
//                        var mes = document.createElement('div');
//                        var capt = document.createElement('capta');
//
//                        mes.className = 'item';
//                        mes.style.cssText = "text-align:center";
//
//                        mes.innerHTML = "<a style='font-size: 12px;text-align: center;float:left;color: #4cae4c;margin-top: 3px;clear: both'>" + response[q].date + "</a><br>" +
//                                "<a style='font-size: 28px;text-align: center;clear: both;color:black'><br>" +
//                                response[q].name + ":" + "</a>" + "<br><br>" + "<a style='font-size: 12px;color:black'>" + response[q].testimonial + "</a>";
//
//                        testimCarusel.appendChild(mes);
////                        testimCarusel.appendChild(capt);
//
//
//                    }
//                })
//                .catch(alert);


    }

    //    setInterval(testimoni, 20);
    setTimeout(testimoni, 20);


</script>

<!--END OF THIRD BLOCK-->
<!--FOURTH BLOCK-->
<div id="screen_4" class="container-fluid">
    <div class="container fourth_block_container">
        <div class="row">
            <div class="col-md-12 center_block under_logo_name"><span>Servi<span style="color:#ff7878">ces</span></span><span></span>
            </div>
        </div>
        <div class="row fourth_block_main">
            <div class="col-md-12 under_logo_description">
    <span>Here you can see a simple algorithm of our work and choose what exactly  you need.
    </span>
            </div>
        </div>

        <!--ROMB BLOCKS-->
        <div class="row three_romb_blocks">
            <div class="col-md-4 col-xs-12 three_romb_block"> <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-3 three_romb_block_icon"> <!--ICON BLOCK-->
                        <div class="romb three_romb_block_icon_inside">
                            <i class="fa fa-paint-brush" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="col-md-9 three_romb_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 three_romb_inside_name"><span>Web graphic design</span></div>
                            <div class="col-md-12 three_romb_inside_description"><span>
The first step to your website is interface design.Our  team supply services of  graphic design websites.
        We can create interface especially for you or we can use any of your own ideas .
    </span></div>
                        </div>
                    </div>
                </div>
            </div> <!--END BLOCK 1-->

            <div class="col-md-4 col-xs-12 three_romb_block"> <!--BLOCK 2-->
                <div class="row">
                    <div class="col-md-3 three_romb_block_icon"> <!--ICON BLOCK-->
                        <div class="romb three_romb_block_icon_inside">
                            <i class="fa fa-code" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="col-md-9 three_romb_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 three_romb_inside_name"><span>Writing code</span></div>
                            <div class="col-md-12 three_romb_inside_description">
    <span>
     This is the second step. Well.The Grafic design has been  aproved.It is time to start writing code.As usual ,this is the longest
        part . Our services are devoted to creating web-sites like,
        sites-presentations , Landing-pages, internet-shops...any other kind of websites you need!
    </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div> <!--END BLOCK 2-->
            <div class="col-md-4 col-xs-12 three_romb_block"> <!--BLOCK 3-->
                <div class="row">
                    <div class="col-md-3 three_romb_block_icon"> <!--ICON BLOCK-->
                        <div class="romb three_romb_block_icon_inside">
                            <i class="fa fa-database" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="col-md-9 three_romb_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 three_romb_inside_name"><span>Databases</span></div>
                            <div class="col-md-12 three_romb_inside_description">
    <span>
   More complicated projects demand using of databases.The Third step - is engeneering database to your site if it needs.
    </span></div>
                        </div>
                    </div>
                </div>
            </div> <!--END BLOCK 3-->


        </div>
        <div class="row three_romb_blocks">

            <div class="col-md-4 col-xs-12 three_romb_block"> <!--BLOCK 4-->
                <div class="row">
                    <div class="col-md-3 three_romb_block_icon"> <!--ICON BLOCK-->
                        <div class="romb three_romb_block_icon_inside">
                            <i class="fa fa-check-square-o" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="col-md-9 three_romb_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 three_romb_inside_name"><span>Testing</span></div>
                            <div class="col-md-12 three_romb_inside_description">
    <span>
  At this step we need to test web-site.This stage is  dedicated to fixing bags
        and searching mistakes through the code  ,testing
        quality of project work...
    </span></div>
                        </div>
                    </div>
                </div>
            </div> <!--END BLOCK 4-->

            <div class="col-md-4 col-xs-12 three_romb_block"> <!--BLOCK 5-->
                <div class="row">
                    <div class="col-md-3 three_romb_block_icon"> <!--ICON BLOCK-->
                        <div class="romb three_romb_block_icon_inside">
                            <i class="fa fa-eye" aria-hidden="true"></i>
                        </div>
                    </div>
                    <div class="col-md-9 three_romb_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 three_romb_inside_name"><span>Website maintenence</span></div>
                            <div class="col-md-12 three_romb_inside_description">
    <span>
Any sites needs a support from time to time.For instance:you have site-presenatation of your company and you want to change something at your pages.
   Say us what you need and we will do it.
    </span></div>
                        </div>
                    </div>
                </div>
            </div>
            <!--END BLOCK 5-->

            <%--<div class="col-md-4 col-xs-12 three_romb_block"> <!--BLOCK 6-->--%>
            <%--<div class="row">--%>
            <%--<div class="col-md-3 three_romb_block_icon"> <!--ICON BLOCK-->--%>
            <%--<div class="romb three_romb_block_icon_inside">--%>
            <%--<i class="fa fa-code" aria-hidden="true"></i>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="col-md-9 three_romb_inside"> <!--DESCRIPTION BLOCK-->--%>
            <%--<div class="row">--%>
            <%--<div class="col-md-12 three_romb_inside_name"><span>Moderator rights</span></div>--%>
            <%--<div class="col-md-12 three_romb_inside_description">--%>
            <%--<span>--%>
            <%--Moderator has right to issue penalty for: unethical behavior, excessive gestures wich distracting or interfering other players in game and other actions wich connected with infringement. Moderator has right to decide wich panishment can be given to a player for that or another action.--%>
            <%--</span></div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div> <!--END BLOCK 6-->--%>
        </div>
        <!--END ROMB BLOCKS-->
    </div>
</div>
<!--END OF FOURTH BLOCK-->

<!--FIFTH BLOCK START-->
<%--<div id="screen_5" class="container-fluid fifth_block_container" style="display: none;">--%>
<%--<div class="container fifth_block_main">--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 center_block fifth_block_name"><span>More about Rol<span--%>
<%--style="color:#ff7878">es</span></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row">--%>
<%--<div class="col-lg-0"></div>--%>
<%--<div class="col-lg-4 col-md-4 fifth_block_left">--%>
<%--<img src="resources/img/carleone.png">--%>
<%--</div>--%>
<%--<div class="col-lg-8 col-md-8 fifth_block_right">--%>
<%--<div class="col-md-12 fifth_block_right_inside"> <!--START OF FIRST BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-2 fifth_romb_block_icon"> <!--ICON BLOCK-->--%>
<%--<div class="romb fifth_romb_block_icon_inside">--%>
<%--<i class="fa fa-eye" aria-hidden="true"></i>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-9 fifth_romb_inside"> <!--DESCRIPTION BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 fifth_romb_inside_name"><span>Citizens</span></div>--%>
<%--<div class="col-md-12 fifth_romb_inside_description"><span>--%>
<%--Regular Citizens have no special powers and, as mentioned before, their strength lies in their numbers.--%>
<%--</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div> <!--END OF FIRST BLOCK-->--%>

<%--<div class="col-md-12 fifth_block_right_inside"> <!--START OF SECOND BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-2 fifth_romb_block_icon"> <!--ICON BLOCK-->--%>
<%--<div class="romb fifth_romb_block_icon_inside">--%>
<%--<i class="fa fa-eye" aria-hidden="true"></i>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-10 fifth_romb_inside"> <!--DESCRIPTION BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 fifth_romb_inside_name"><span>The Don (boss of the Mafia)</span>--%>
<%--</div>--%>
<%--<div class="col-md-12 fifth_romb_inside_description"><span>--%>
<%--As leader of the Mafia team, the Don orders the death of the victims for the first three nights; they do this by showing the numbers of the intended victims to their fellow team mates during Zero Night (we call it “zero”, because nobody dies during that night at the beginning of the game). Each night, after Mafia shoot, the Don is given an opportunity to identify the Sheriff (more on this important role later). In doing so, the Don silently indicates his suspicion by showing to the moderator the number of the player whom they would like to investigate- and receives the answer accordingly. Even if the Don was successful in finding the Sheriff, they cannot cannot kill him at once; the Don has only received KNOWLEDGE about the most dangerous player within the red team. To successfully communicate this information to their fellow Mafia teammates in a covert manner (so that they can prioritize the killing of the Sheriff) is a whole new board game!--%>
<%--</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div> <!--END OF SECOND BLOCK-->--%>

<%--<div class="col-md-12 fifth_block_right_inside"> <!--START OF THIRD BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-2 fifth_romb_block_icon"> <!--ICON BLOCK-->--%>
<%--<div class="romb fifth_romb_block_icon_inside">--%>
<%--<i class="fa fa-eye" aria-hidden="true"></i>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-10 fifth_romb_inside"> <!--DESCRIPTION BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 fifth_romb_inside_name"><span>Regular Mafia member</span></div>--%>
<%--<div class="col-md-12 fifth_romb_inside_description"><span>--%>
<%--As discussed, the Don is the main decision maker for all collective mafia actions. The moderator accepts the orders from the Don only. One should also draw attention to the fact that Mafia members cannot open their eyes during the night – and thereby secretly communicate – except during night zero. On all other nights, Mafia members must shoot with closed eyes.--%>
<%--</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div> <!--END OF THIRD BLOCK-->--%>
<%--<div class="col-md-12 fifth_block_right_inside"> <!--START OF FOURTH BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-2 fifth_romb_block_icon"> <!--ICON BLOCK-->--%>
<%--<div class="romb fifth_romb_block_icon_inside">--%>
<%--<i class="fa fa-eye" aria-hidden="true"></i>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="col-md-10 fifth_romb_inside"> <!--DESCRIPTION BLOCK-->--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 fifth_romb_inside_name"><span>The Sheriff</span></div>--%>
<%--<div class="col-md-12 fifth_romb_inside_description"><span>--%>
<%--Each night the Sheriff is given an opportunity to investigate the identity of another player. The Sheriff silently indicates to the moderator whom they would like to investigate, usually by pointing at the player they suspect. The moderator indicates whether or not that player is a Mafioso by nodding or shaking their head.--%>
<%--</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div> <!--END OF FOURTH BLOCK-->--%>


<%--<div class="col-md-3 fifth_button"><span>Learn More</span></div>--%>
<%--</div>--%>
<%--<div class="col-lg-0"></div>--%>

<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<!--END OF FIFTH BLOCK-->
<!--SIX BLOCK START-->
<%--<div id="screen_6" class="container-fluid" style="display: none;">--%>
<%--<div class="container six_block_container">--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 center_block six_block_name"><span>Our <span style="color:#ff7878">team</span></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row six_block_main_inside">--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 six_romb_inside">--%>
<%--<div class="six_block">--%>
<%--<div class="romb six_block_inside">--%>
<%--<div class="six_block_content">--%>
<%--<img src="resources/img/fataso_xa.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="">boriska</a>--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 six_romb_inside">--%>
<%--<div class="six_block">--%>
<%--<div class="romb six_block_inside">--%>
<%--<div class="six_block_content">--%>
<%--<img src="http://cdn.akamai.steamstatic.com/steamcommunity/public/images/avatars/6b/6bc1202744b043dac899e412503d2b69ffce4cd0_full.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="">mast</a>--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 six_romb_inside">--%>
<%--<div class="six_block">--%>
<%--<div class="romb six_block_inside">--%>
<%--<div class="six_block_content">--%>
<%--<img src="http://cdn.akamai.steamstatic.com/steamcommunity/public/images/avatars/67/679ee6158dee954e4c02a610559a85c69b3e1097_full.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="">Boriska.322</a>--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 six_romb_inside">--%>
<%--<div class="six_block">--%>
<%--<div class="romb six_block_inside">--%>
<%--<div class="six_block_content">--%>
<%--<img src="http://cdn.akamai.steamstatic.com/steamcommunity/public/images/avatars/9a/9a78ea85317157f584c349f6a60b7a962f760db9_full.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="">Rockie</a>--%>
<%--</div>--%>
<%--</div>--%>


<%--</div>--%>
<%--</div>--%>
<!--SIX BLOCK END-->
<!--SEVEN BLOCK START-->
<div id="screen_7" class="container-fluid seven_block_main_container">
    <div class="container seven_block_container">
        <div class="row">
            <div class="col-md-12 center_block seven_block_name"><span>Our <span style="color:#ff7878">portfolio</span></span>
            </div>
        </div>
        <div class="row seven_tree_blocks">











            <figure class="snip1369 green">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/pr-sample15.jpg" alt="pr-sample15" />
                <div class="image"><img src="http://s019.radikal.ru/i621/1701/33/bc0d3d240de6.jpg" alt="pr-sample15" /></div>
                <figcaption>
                    <h3>Athene</h3>
                    <p>I suppose if we couldn't laugh at things that don't make sense, we couldn't react to a lot of life.</p>
                </figcaption><span class="read-more">

    Read More <i class="ion-android-arrow-forward"></i></span>
                <a href="#"></a>
            </figure>
            <figure class="snip1369 green">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/pr-sample15.jpg" alt="pr-sample15" />
                <div class="image"><img src="http://s019.radikal.ru/i621/1701/33/bc0d3d240de6.jpg" alt="pr-sample15" /></div>
                <figcaption>
                    <h3>Lynx</h3>
                    <p>I suppose if we couldn't laugh at things that don't make sense, we couldn't react to a lot of life.</p>
                </figcaption><span class="read-more">

    Read More <i class="ion-android-arrow-forward"></i></span>
                <a href="#"></a>
            </figure>
            <figure class="snip1369 green">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/pr-sample15.jpg" alt="pr-sample15" />
                <div class="image"><img src="http://s019.radikal.ru/i621/1701/33/bc0d3d240de6.jpg" alt="pr-sample15" /></div>
                <figcaption>
                    <h3>Mafia Project</h3>
                    <p>I suppose if we couldn't laugh at things that don't make sense, we couldn't react to a lot of life.</p>
                </figcaption><span class="read-more">

    Read More <i class="ion-android-arrow-forward"></i></span>
                <a href="#"></a>
            </figure>

            <script>
                /* Demo purposes only */
                $(".hover").mouseleave(
                        function () {
                            $(this).removeClass("hover");
                        }
                );
            </script>














        </div>
        <div class="row seven_button_block">
            <div class="col-md-5"></div>
            <div class="col-md-2 seven_button"><span>More posts</span></div>
            <div class="col-md-5"></div>
        </div>
    </div>
</div>
<!--SEVEN BLOCK END-->
<!--EIGHT BLOCK START-->
<%--<div id="screen_8" class="container-fluid eight_block_main_container" style="display: none;">--%>
<%--<div class="container eight_block_container">--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 center_block eight_block_name">--%>
<%--<span>Our <span style="color:#ff7878">skills</span></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row eight_block_circles">--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 eight_block_circle">--%>
<%--<div class="circle" id="circle-1">--%>
<%--<div class="circles-wrp" style="position: relative; display: inline-block;">--%>
<%--<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80">--%>
<%--<path fill="transparent" stroke="#eee" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 1 1 39.949302232260386 3.500035209108127 Z"></path>--%>
<%--<path fill="transparent" stroke="#ff7878" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 0 1 59.07174573163989 71.12103010421852 "></path>--%>
<%--</svg>--%>
<%--<div class="circles-text"--%>
<%--style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 28px; height: 80px; line-height: 80px;">--%>
<%--<span class="circles-integer">77</span>--%>
<%--<span class="circles-decimals">%</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="#">Citizens wins</a>--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 eight_block_circle">--%>
<%--<div class="circle" id="circle-2">--%>
<%--<div class="circles-wrp" style="position: relative; display: inline-block;">--%>
<%--<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80">--%>
<%--<path fill="transparent" stroke="#eee" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 1 1 39.949302232260386 3.500035209108127 Z"></path>--%>
<%--<path fill="transparent" stroke="#ff7878" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 0 1 59.07174573163989 71.12103010421852 "></path>--%>
<%--</svg>--%>
<%--<div class="circles-text"--%>
<%--style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 28px; height: 80px; line-height: 80px;">--%>
<%--<span class="circles-integer">77</span>--%>
<%--<span class="circles-decimals">%</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="#">Mafia wins</a>--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 eight_block_circle">--%>
<%--<div class="circle" id="circle-3">--%>
<%--<div class="circles-wrp" style="position: relative; display: inline-block;">--%>
<%--<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80">--%>
<%--<path fill="transparent" stroke="#eee" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 1 1 39.949302232260386 3.500035209108127 Z"></path>--%>
<%--<path fill="transparent" stroke="#ff7878" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 0 1 59.07174573163989 71.12103010421852 "></path>--%>
<%--</svg>--%>
<%--<div class="circles-text"--%>
<%--style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 28px; height: 80px; line-height: 80px;">--%>
<%--<span class="circles-integer">77</span>--%>
<%--<span class="circles-decimals">%</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="#">killed scheriff at first night</a>--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 eight_block_circle">--%>
<%--<div class="circle" id="circle-4">--%>
<%--<div class="circles-wrp" style="position: relative; display: inline-block;">--%>
<%--<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80">--%>
<%--<path fill="transparent" stroke="#eee" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 1 1 39.949302232260386 3.500035209108127 Z"></path>--%>
<%--<path fill="transparent" stroke="#ff7878" stroke-width="7"--%>
<%--d="M 39.992565928065126 3.500000757060633 A 36.5 36.5 0 0 1 59.07174573163989 71.12103010421852 "></path>--%>
<%--</svg>--%>
<%--<div class="circles-text"--%>
<%--style="position: absolute; top: 0px; left: 0px; text-align: center; width: 100%; font-size: 28px; height: 80px; line-height: 80px;">--%>
<%--<span class="circles-integer">77</span>--%>
<%--<span class="circles-decimals">%</span>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<a href="#">of players got fouls in 1 game</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<!--END OF EIGHT BLOCK-->
<!--START NINE BLOCK-->
<%--<div id="screen_9" class="container-fluid nine_block_main_container">--%>
<%--<div class="container nine_block_container">--%>
<%--<div class="row">--%>
<%--<div class="col-md-12 center_block eight_block_name">--%>
<%--<span>Our <span style="color:#ff7878">photos</span></span>--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row nine_blocks_main">--%>
<%--<div class="row nine_blocks">--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--<div class="row nine_blocks">--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--<div class="col-md-3 col-sm-6 col-xs-12 nine_block">--%>
<%--<img src="resources/img/post1.jpg">--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<!--END OF NINE BLOCK-->
<!--START TEN BLOCK-->


<sec:authorize access="isAnonymous()">
    <div id="screen_10" class="container-fluid ten_block_main_container parallax-window" <%--data-parallax="scroll"
         data-image-src="resources/img/sub.jpg"--%>>
        <div class="container ten_block_container">
            <div class="row">
                <div class="col-md-12 center_block ten_block_name">
                    <span>Subscribe <span style="color:#ff7878">our </span>newsletter</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 ten_block_description">
    <span>
    Subscribe to our newsletter and stay updated on the latest news and special offers!</span></div>
            </div>

            <div class="row ten_input_block_main">
                <div class="ten_input_block">
                    <div class="form-group">
                        <span id="subscribeError"></span>
                        <input type="email" class="form-control" id="exampleInputEmail1"
                               placeholder="enter your email address">
                    </div>
                    <button onclick="addSubscribedEmail()" id="butttonSubscribe" type="submit"
                            class="btn btn-default ten_input_button">Subscribe now!
                    </button>
                </div>
            </div>
            <script>
                function addSubscribedEmail() {

                    var subscribedEmail = exampleInputEmail1.value;
//                    alert(subscribedEmail);
                    var r = /^\w+@\w+\.\w{2,4}$/i;
                    if (!exampleInputEmail1.value) {
                        subscribeError.innerHTML = "please enter email"
                        subscribeError.style.padding = "1px 3px 2px 3px";
                    }
                    else if (!r.test(subscribedEmail)) {
                        subscribeError.innerHTML = "please enter correct email";
                        subscribeError.style.padding = "1px 3px 2px 3px";
                    } else {

                        $.ajax({
                            type: 'post',
                            url: '/ckeckMailAll',
                            dataType: 'text',
                            contentType: "text/plain; charset=utf-8",
                            data: exampleInputEmail1.value,
                            success: function (data, textStatus, jQxhr) {

                                if (data !== "empty") {
                                    subscribeError.innerHTML = "this email is already registered"
                                    subscribeError.style.padding = "1px 3px 2px 3px";
                                }
                                else {

                                    var xhreq = new XMLHttpRequest()
                                    xhreq.open("POST", "addSubscribedEmail");
                                    xhreq.send(exampleInputEmail1.value);
                                    exampleInputEmail1.innerHTML = "";
                                    subscribeError.innerHTML = " Congratulations you have subscribed"
                                    subscribeError.style.padding = "1px 3px 2px 3px";
                                    exampleInputEmail1.style.visibility = "hidden";
                                    butttonSubscribe.style.visibility = "hidden";
                                    exampleInputEmail1.innerHTML = "";

                                }
                            },
                            error: function (jqXhr, textStatus, errorThrown) {

                            }
                        })


//
//                        fetch("ckeckMailAll", {
//                            method: 'post',
//                            body: exampleInputEmail1.value
//                        })
//                                .then(function (response) {
//                                    return response.text();
//                                })
//                                .then(function (data) {
//                                    if (data !== "empty") {
//                                        subscribeError.innerHTML = "this email is already registered"
//                                        subscribeError.style.padding = "1px 3px 2px 3px";
//                                    }
//                                    else {
//
//                                        var xhreq = new XMLHttpRequest()
//                                        xhreq.open("POST", "addSubscribedEmail");
//                                        xhreq.send(exampleInputEmail1.value);
//                                        exampleInputEmail1.innerHTML = "";
//                                        subscribeError.innerHTML = " Congratulations you have subscribed"
//                                        subscribeError.style.padding = "1px 3px 2px 3px";
//                                        exampleInputEmail1.style.visibility = "hidden";
//                                        butttonSubscribe.style.visibility = "hidden";
//                                        exampleInputEmail1.innerHTML = "";
//
//                                    }
//                                })
//                                .catch(error);
                    }


//                    alert(subscribedEmail);
                }
            </script>


        </div>
    </div>
</sec:authorize>


<!--END OF TEN BLOCK-->


<!--RULES BLOCK-->
<div id="rules_block" class="container-fluid rules_block_container">
    <div class="container rules_block_container">
        <div class="row">
            <div class="rules_close_button"><span>X</span></div>
        </div>
        <div class="row">
            <div class="col-md-12 rules_name"><span>Rul<span style="color:#ff7878">es</span></span><span></span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 rules_description">
               <span>Here are some suggestions for you while surfing our site
               </span>
            </div>
        </div>

        <!--ROMB BLOCKS-->
        <div class="row rules_romb_blocks">
            <div class="col-md-12 col-xs-12 rules_romb_block">       <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-1 col-xs-2 rules_block_icon"> <!--ICON BLOCK-->
                        <div class="romb rules_block_icon_inside">
                            <span>1</span>
                        </div>
                    </div>
                    <div class="col-md-11 col-xs-10 rules_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 rules_inside_name"><span>Registration</span></div>
                            <div class="col-md-12 rules_inside_description"><span>
                         To get additional features , you should be registered. Notice!  your email will be writed to our
                                database and we will  send you our news time to time.
                          </span></div>
                        </div>
                    </div>
                </div>
            </div>                       <!--END BLOCK 1-->


            <div class="col-md-12 col-xs-12 rules_romb_block">       <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-1 col-xs-2 rules_block_icon"> <!--ICON BLOCK-->
                        <div class="romb rules_block_icon_inside">
                            <span>2</span>
                        </div>
                    </div>
                    <div class="col-md-11 col-xs-10 rules_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 rules_inside_name"><span>Registration</span></div>
                            <div class="col-md-12 rules_inside_description"><span>
                          Registration button you can find at the top of our Stsrt-Page. Look througth site more carefully
                          </span></div>
                        </div>
                    </div>
                </div>
            </div>                       <!--END BLOCK 1-->
            <div class="col-md-12 col-xs-12 rules_romb_block">       <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-1 col-xs-2 rules_block_icon"> <!--ICON BLOCK-->
                        <div class="romb rules_block_icon_inside">
                            <span>3</span>
                        </div>
                    </div>
                    <div class="col-md-11 col-xs-10 rules_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 rules_inside_name"><span>Contacting us</span></div>
                            <div class="col-md-12 rules_inside_description"><span>
                         Look through our site and find block wih name "Contact us".  if you are not registred ,enter
                                your emeil and message - This step sends us eamil with your massage.
                          </span></div>
                        </div>
                    </div>
                </div>
            </div>                       <!--END BLOCK 1-->
            <div class="col-md-12 col-xs-12 rules_romb_block">       <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-1 col-xs-2 rules_block_icon"> <!--ICON BLOCK-->
                        <div class="romb rules_block_icon_inside">
                            <span>4</span>
                        </div>
                    </div>
                    <div class="col-md-11 col-xs-10 rules_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 rules_inside_name"><span>Subscribing</span></div>
                            <div class="col-md-12 rules_inside_description"><span>
                         If you want to be informed in our news - find block with name 'Subscribe to our newsletter'
                                and enter your email
                          </span></div>
                        </div>
                    </div>
                </div>
            </div>                       <!--END BLOCK 1-->
            <div class="col-md-12 col-xs-12 rules_romb_block">       <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-1 col-xs-2 rules_block_icon"> <!--ICON BLOCK-->
                        <div class="romb rules_block_icon_inside">
                            <span>5</span>
                        </div>
                    </div>
                    <div class="col-md-11 col-xs-10 rules_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 rules_inside_name"><span>Your own cabinet</span></div>
                            <div class="col-md-12 rules_inside_description"><span>
                        If you are registered , you have access to your cabinet where you can change your credentials,see information of your project
                                and can use direct chat with our team. Button to your cabinet you can find at main page and only when you are signed in...
                          </span></div>
                        </div>
                    </div>
                </div>
            </div>                       <!--END BLOCK 1-->
            <div class="col-md-12 col-xs-12 rules_romb_block">       <!--BLOCK 1-->
                <div class="row">
                    <div class="col-md-1 col-xs-2 rules_block_icon"> <!--ICON BLOCK-->
                        <div class="romb rules_block_icon_inside">
                            <span>6</span>
                        </div>
                    </div>
                    <div class="col-md-11 col-xs-10 rules_inside"> <!--DESCRIPTION BLOCK-->
                        <div class="row">
                            <div class="col-md-12 rules_inside_name"><span>Chat</span></div>
                            <div class="col-md-12 rules_inside_description"><span>
                        Your private cabinet contains chat .You  can directly negotiate with our administrator if you have some
                                questions or suggestions.  You are welcome
                          </span></div>
                        </div>
                    </div>
                </div>
            </div>                       <!--END BLOCK 1-->

        </div>
        <!--END ROMB BLOCKS-->
    </div>
</div>
<!--END OF RULES BLOCK-->


<!--ELEVEN BLOCK START-->
<div class="jakor" id="screen_11" class="container-fluid eleven_block_main_container">
    <div class="container eleven_block_container">
        <div class="row">
            <div class="col-md-12 center_block under_logo_name"><span>Contact
                    <span style="color:#ff7878">us</span></span></div>
        </div>
        <div class="row third_block_main">
            <div class="col-md-12 under_logo_description">
    <span>
    If you have some questions ,please send us email
    </span>
            </div>
        </div>
        <div class="row eleven_form_main">
            <div id="contacts" class="form-horizontal">
                <div class="col-md-1"></div>
                <sec:authorize access="isAnonymous()"> <%--IF NOT LOGIN START--%>
                    <div class="col-md-5 eleven_form">
                        <div class="form-group eleven_form_inside">
                            <input type="Name" id="inputLogin3" class="form-control" placeholder="Name">
                        </div>
                        <div class="form-group eleven_form_inside">
                            <input type="Email" id="inputEmail3" class="form-control" placeholder="Email">
                            <span id="correm"></span>
                        </div>

                    </div>
                    <div class="col-md-5 eleven_form eleven_form_inside">
                        <textarea id="textareaClass" class="form-control" rows="5" button_border></textarea>
                    </div>
                    <div id="corrtext"></div>
                </sec:authorize> <%--IF NOT LOGIN END--%>

                <sec:authorize access="isAuthenticated()"> <%--IF LOG IN START--%>
                    <div class="col-md-10 eleven_form eleven_form_inside">
                        <textarea id="textareaClass" class="form-control" rows="5" button_border></textarea>
                    </div>
                </sec:authorize> <%--IF LOG IN END--%>

                <div class="col-md-1"></div>
                <div class="form-group">
                    <div class="col-md-12 eleven_button_main">
                        <button type="submit" class="btn btn-default eleven_button" onclick="contactUs()">Submit
                        </button>
                    </div>
                </div>
            </div>

        </div>
        <sec:authorize access="isAnonymous()">
            <script>
                function contactUs() {
                    <%--alert(${user.name});--%>
//                    var form = document.forms.contacts;
                    var namees = inputLogin3.value;
                    var maileed = inputEmail3.value;
                    var texteed = textareaClass.value;
                    var r = /^\w+@\w+\.\w{2,4}$/i;
                    if (!inputEmail3.value) {
                        correm.innerHTML = "please enter email"
                    }
                    else if (!r.test(maileed)) {
                        correm.innerHTML = "please enter correct email";
                    }
                    else {

//                            alert(texteed.value);

                        var contact = {

                            name: namees,
                            email: maileed,
                            text: texteed
                        }
//                            alert(JSON.stringify(contact));
                        $.ajax({
                            url: '/contactUS',
                            dataType: 'text',
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(contact),
                            success: function (data, textStatus, jQxhr) {
                                inputLogin3.value = "";
                                inputEmail3.value = "";
                                textareaClass.value = "";
                            },
                            error: function (jqXhr, textStatus, errorThrown) {
//                                    alert(jqXhr + "   " + textStatus + "   " + errorThrown)
                            }
                        });

                        inputLogin3.value = "";
                        inputEmail3.value = "";
                        textareaClass.value = "";

                    }
                }

            </script>
        </sec:authorize>
        <sec:authorize access="isAuthenticated()">
            <script>

                function contactUs() {
                    <%--alert(${user.name});--%>
//                    var form = document.forms.contacts;
                    if (!textareaClass.value) {
                        corrtext.innerHTML = "please enter your message"
                    }
                    else {
                        var texteed = textareaClass.value;


                        var contact = {

                            name: '',
                            email: '',
                            text: texteed
                        }
//                            alert(JSON.stringify(contact));
                        $.ajax({
                            url: '/contactUS',
                            dataType: 'text',
                            type: 'post',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(contact),
                            success: function (data, textStatus, jQxhr) {
//                                    inputLogin3.value = "";
//                                    inputEmail3.value = "";
                                textareaClass.value = "";
                            },
                            error: function (jqXhr, textStatus, errorThrown) {
//                                    alert(jqXhr + "   " + textStatus + "   " + errorThrown)
                            }
                        });

//                            inputLogin3.value = "";
//                            inputEmail3.value = "";
                        textareaClass.value = "";


                    }
                }

            </script>

        </sec:authorize>

        <br>
        <%--</div>--%>
        <div class="row" style="clear:both">
            <div class="col-md-5"></div>
            <div class="col-md-2 icons_footer">
                <i class="fa fa-facebook" aria-hidden="true"></i>
                <i class="fa fa-vk" aria-hidden="true"></i>
                <i class="fa fa-twitter" aria-hidden="true"></i>
            </div>
            <div class="col-md-5"></div>
            <div class="col-md-12 icons_footer">
                <span>Our contacts:</span><br/>
                <span class="footer_contacts">Phone: +380932520125 | </span>
                <span class="footer_contacts">E-Mail: athene@google.com</span>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 text_copyright">Copyright 2016 © Athene, All right reserved</div>
            <div class="col-md-3"></div>
        </div>
    </div>
</div>
<!--ELEVEN BLOCK END-->
<!--FOOTER START-->


<!--FOOTER END-->

<script type="text/javascript" src="resources/js/jakor.js"></script>
<script src="resources/js/parallax.js"></script>
<script src="resources/js/popupreg.js"></script>
<script src="resources/js/login_form.js"></script>
<script src="resources/js/circles.js"></script>
<script src="resources/js/jquery.js"></script>
<script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
</script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="resources/js/bootstrap.js"></script>


<%--RULES DETAILES START--%>
<style>
    .rules_block_container {
        display: none;
    }
</style>

<script>
    /*INPUT*/
    $("input[type='text']").bind('focus', function () {
        $(this).css('background-color', 'white');
    });
    /*INPUT*/
    /*OPTIONS*/
    block_rules = $(".rules_block_container");

    var open_rules = $(".rules_open_button");
    var close_rules = $(".rules_close_button");

    /*OPTIONS*/
    /*MAIN PAGE*/
    open_rules.on('click', function () {
        if (block_rules.css('display') == 'none') {
            block_rules.fadeToggle();
        }
    });
    close_rules.on('click', function () {
        block_rules.fadeToggle();
    });
    /*MAIN PAGE*/
</script>

<%--RULES DETAILES END--%>
<%--<script type="text/javascript" src="/resources/js/browser.js"></script>--%>
<script>
    //    alert(BrowserDetect.browser)
    //if(BrowserDetect.browser=='Mozilla' && BrowserDetect.browser=='Internet Explorer'){
    //    alert('Internet explorer does not support some features of this site .Please enter another browser')
    //}
</script>
</body>
</html>

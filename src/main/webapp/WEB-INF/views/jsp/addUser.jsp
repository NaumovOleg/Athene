<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
<style> .error {
    border-color: red;
} </style>
<form name="addjjj" id="regform" style="width: 800px;border: aqua 2px solid">
    <input name="name" id="names" type="text" placeholder="name">
    <div id="errorname">|</div>
    <br><br>
    <input name="surname" id="surname" type="text" placeholder="surname"><br><br>
    <input name="email" id="email" type="text" placeholder="email">
    <div id="errormail">|</div>
    <br>
    <input name="phone" id="phone" type="text" placeholder="phone">
    <div id="errorphone">|</div>
    <br><br>
    <input name="password" id="password" type="password" placeholder="password">
    <div id="errorpassword">|</div>
    <br><br>
    <input name="confirmPassword" id="confirmPassword" type="password" placeholder="confirm password">
    <div id="errorpasswordConfirm">|</div>
    <br> <br> <br> <br> <br>
    <input type="button" id="checkValuesButton" onclick="checkFields()" value="Проверить">
    <input type="submit" id="sendButton" onclick="valid()" value="Проверить" style="visibility: hidden;float: right">
</form>
<br><br><br><br><br>
<input type="button" onclick="go()" value="Main">

<script>
    function go() {
        document.location.href = "Main"
    }
    phone.onblur = function () {
        if (!isNaN(this.value)) {
            phone.style.borderColor = "green";
            errorphone.innerHTML = '|';
            phn = true;

        }
        else if (isNaN(this.value)) {
            phone.style.borderColor = "red";
            errorphone.innerHTML = 'not a number';
            phn = false;
        }
        else {
            phone.style.borderColor = "red";
            errorphone.innerHTML = '|';
            phn = false;

        }
    }
    names.onblur = function () {
        if (!this.value) {
            namefield = null;
            this.className = "error";
            errorname.innerHTML = 'please enter your name.';
            na = false;
        }

        else {
            names.style.backgroundColor = "green";
            errorname.innerHTML = "|";
            namefield = this.value;
            na = true;
            if (isKyr(this.value)) {
                alert("kyrillic");
            }
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
                fetch("ckeckMail", {
                    method: 'post',
                    body: this.value
                })
                        .then(function (response) {
                            return response.text();
                        })
                        .then(function (data) {
                            if (data !== "empty") {
                                emailfield = null;
                                email.style.borderColor = "red";
                                errormail.innerHTML = 'this email is already registered';
                                eme = false;
                            }
                            else {
                                email.style.borderColor = "green";
                                errormail.innerHTML = '|';
                                emailfield = em;
                                eme = true;
                            }
                        })
                        .catch(error);
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
            errorpassword.innerHTML = "|";
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
        if (document.getElementById("password").value.length >= 4 &
                document.getElementById("confirmPassword").value != undefined & document.getElementById("confirmPassword").value !== document.getElementById("password").value) {
            confirmPassword.style.borderColor = "red";
            errorpasswordConfirm.innerHTML = "password does not match";
        }
        if (document.getElementById("password").value.length >= 4 &
                document.getElementById("confirmPassword").value == document.getElementById("password").value) {
            confirmPassword.style.borderColor = "green";
            errorpasswordConfirm.innerHTML = "|";
            password.style.borderColor = "green";
            errorpassword.innerHTML = "|";
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
                    pan.innerHTML = "You have subscribed.Please check your email"
                    regform.innerHTML = "";
                    regform.appendChild(pan);

                }
            }
        }
    }
</script>


<form action="/eeeee" method="POST" name="jjj" id="iiii">
    <input name="name" id="name" type="text" placeholder="name">


    <br><br>
    <input name="mail" id="mail" type="text" placeholder="confirm password">


    <input type="submit" value="gggggg">
    <input type="button" value="ggggddddddddddddgg" onclick="searchText()">
</form>


<script>
    function searchText() {
        var form = document.forms.iiii;
        var formdata = new FormData(form);
//        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
//        formdata.append('name','iiiiii');
//        xhr.setRequestHeader('Content-Type', 'multipart/form-data');
        formdata.append('name', form.elements.name.value);
        formdata.append('mail', form.elements.mail.value);
        var xhc = new XMLHttpRequest();
        xhc.open("POST", "/eeeee");
        xhc.send(formdata);
//        $.ajax({
//            type: "POST",
//            url: "/gDirecotry/ajax/searchUserProfiles.htm",
//            async: true,
//            data:sendData,
//            success :function(result)
//            {
//            }})

    }


    function SendGet() {
        $a({
            type: 'get',//тип запроса: get,post либо head

            url: 'jq',//url адрес файла обработчика

//            data: {'q': '1'},//параметры запроса
            data: 'ooooooo',
            response: 'text',//тип возвращаемого ответа text либо xml

            success: function (data) {//возвращаемый результат от сервера

                $$('result', $$('result').innerHTML + '<br />' + data);

            }

        });

    }


</script>
<%--<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>--%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"/>
<script src="http://code.jquery.com/jquery-1.10.2.min.js" type="text/javascript" ></script>


<%--<script src="resources/js/jquery-3.1.1.min.js"/>--%>
<script type="text/javascript">
    $(document).ready(function() {
        $("#test").click(function(){
            $.get("/ajaxtest",function(data,status){
                alert(data[0].email);
            });
        });
    });


    $(document).ready(function() {
        $("#buts").click(function(){
            var em={'id':2,'email':'oooooooo'};
            $.post("/jq",JSON.stringify(em),function(data,status){

            });
        });
    });

    //    Content-Type: application/json


    function ggg() {
        var ema={id:'2',email:'iiiiiii'};
        var jsn=JSON.stringify(ema);

        $.post ({
            url: '/jq',
            type: "POST",
            data: jsn,
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function(){
                alert("good")//
            }
        });}















    function processForm(  ){
        alert("lllllllllll");
        var ema={id:'2',email:'qqqqqqqqqqqqqqqqqqqqq'};
        var jsn=JSON.stringify(ema);
        $.ajax({
            url: '/jq',
            dataType: 'json',
            type: 'post',
            contentType: "application/json; charset=utf-8",
            data: jsn,
            success: function( data, textStatus, jQxhr ){
                alert(data.email);
            },
            error: function( jqXhr, textStatus, errorThrown ){
                alert(jqXhr+"   "+ textStatus+"   "+errorThrown)
            }
        });

        e.preventDefault();
    }










</script>
<button id="buts">Load2</button>
<button id="test">Load</button>
<form id="efo">
    <input type="file" id="fil" value=";;;;;;;;;;;"><br>
    <input type="text"  id="nm" value="wwwwwww"><br>
    <input type="button" value="submit" onclick="prqq()"><br>
</form>
<script>
    function prqq(  ){
        alert("lllllllllll");
        var formse=document.forms.efo;
        var filed=formse.elements.fil.files[0];
        var named=formse.elements.nm.value;


        var TestClass={name:named,
            file:filed}
        alert("lllllllllll");
        $.ajax({
            url: '/test',
            dataType: 'text',
            type: 'post',
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(TestClass),
            success: function( data, textStatus, jQxhr ){
                alert(data);
            },
            error: function( jqXhr, textStatus, errorThrown ){
                alert(jqXhr+"   "+ textStatus+"   "+errorThrown)
            }
        });

        e.preventDefault();
    }
</script>
<button id="test2" onclick="processForm()">Loadggggg</button>




<form id="contacts">
    <%--<div class="col-md-1"></div>--%>
    <%--<div class="col-md-5 eleven_form">--%>
    <%--<div class="form-group eleven_form_inside">--%>
    <input type="Name" id="inputLogin3" placeholder="Name">
    <%--</div>--%>
    <%--<div class="form-group eleven_form_inside">--%>
    <input type="Email"  id="inputEmail3" placeholder="Email">
    <%--</div>--%>
    <br>
    <a id="correm"></a>
    <%--<div class="form-group eleven_form_inside">--%>
    <%--<input type="Topic" class="form-control" placeholder="Topic">--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="col-md-5 eleven_form eleven_form_inside">--%>
    <input  id="textareaClass" rows="8" placeholder="text"/>
    <%--</div>--%>
    <%--<div class="col-md-1"></div>--%>
    <%--<div class="form-group">--%>
    <%--<div class="col-md-12 eleven_button_main">--%>
    <button type="submit" onclick="contactUs()">Subiiiiiiiiiiimit</button>
    <%--</div>--%>
    <%--</div>--%>
</form>


<script>
    function contactUs(){
        var form = document.forms.contacts;
        var namees = form.elements.inputLogin3.value;
        var maileed = form.elements.inputEmail3.value;
        var texteed = form.elements.textareaClass.value;
        var r = /^\w+@\w+\.\w{2,4}$/i;
        if (!inputEmail3.value) {
            correm.innerHTML = "please enter email"
        }
        else if (!r.test(maileed)) {
            correm.innerHTML = "please enter correct email";}
        else
        {
            var form = document.forms.contacts;
            var namees = form.elements.inputLogin3.value;
            var maileed = form.elements.inputEmail3.value;
            var texteed = form.elements.textareaClass.value;
            alert(textareaClass.value)

            var contact = {

                name: namees,
                mail: maileed,
                text: texteed
            }
            alert(JSON.stringify(contact))
            $.ajax({
                url: '/contactUs',
                dataType: 'json',
                type: 'post',
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(contact),
                success: function (data, textStatus, jQxhr) {
                    alert(data.email);
                },
                error: function (jqXhr, textStatus, errorThrown) {
                    alert(jqXhr + "   " + textStatus + "   " + errorThrown)
                }
            });

            e.preventDefault();
        }
    }


</script>


<br>
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

    }</script>


<br><br><br><br><br><br><br><br>
</body>
</html>

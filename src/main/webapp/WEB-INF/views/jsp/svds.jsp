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
        else if(isKyr(this.value)){
            password.style.borderColor = "red";
            errorpassword.innerHTML = "please enter password in latin symbols";
            passwordfield = null;
            pas = false;
        }
        else if (this.value.length < 4 && this.value&&!isKyr(this.value)) {
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
            errorpassword.innerHTML = "please enter correct password";}
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
            (function valid() {
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
//            document.location.href = "www.google.com"
                }})();
        }
    }
</script>
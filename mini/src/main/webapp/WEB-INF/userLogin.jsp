<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Login.css">
	<title>로그인 페이지</title>
</head>

<body>
    <div id="app">
            <div class="container">
                <div class="loginLogo"><img src="/image/logo_Marrimo.png" class="logo"></div>
                <fieldset class="loginBox">
                    <legend class="loginTitle">Login</legend>
                    <div class="loginTextBox">
                        <div class="loginInfo loginTextId">
                            <img src="/image/Group.png" class="loginImg"><input type="text" class="loginText" placeholder="아이디">
                        </div>
                        <div class="loginInfo loginTextPwd">
                            <img src="/image/Lock.png" class="loginImg"><input type="password" class="loginText" placeholder="비밀번호">
                        </div>
                    </div>
                    <div class="loginBtnBox">
                        <button class="loginBtn btn1">로그인</button>
                    </div>
                </fieldset>
                <div class="loginCategoryList">
                    <a href="">아이디 찾기</a><a href="">비밀번호 찾기</a><a href="">회원가입</a>
                </div>
            </div>
        </div>    
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {

    }   
    , methods: {

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
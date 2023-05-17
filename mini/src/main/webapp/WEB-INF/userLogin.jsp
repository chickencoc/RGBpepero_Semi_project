<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Login.css">
	<title>로그인 페이지</title>
</head>

<body>
    <div id="app">
            <div class="container">
                <fieldset class="loginBox">
                    <legend class="loginTitle">Login</legend>
                    <div class="loginTextBox">
                        <div class="loginInfo loginTextId">
                            <img src="/image/icon/Group.png" class="loginImg"><input type="text" class="loginText" placeholder="아이디" v-model="id">
                        </div>
                        <div class="loginInfo loginTextPwd">
                            <img src="/image/icon/Lock.png" class="loginImg"><input type="password" class="loginText" placeholder="비밀번호" v-model="pwd" @keyup.enter="fnLogin()">
                        </div>
                    </div>
                    <div class="loginBtnBox">
                        <button class="loginBtn btn1" @click="fnLogin()" @keyup.enter="fnLogin()">로그인</button>
                    </div>
                </fieldset>
                <div class="loginCategoryList">
                    <a href="#" @click="fnFindId">아이디 찾기</a><a href="#" @click="fnFindPwd">비밀번호 찾기</a><a href="#" @click="fnSignUp">회원가입</a>
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
    	id : '',
    	pwd : '',
    	user : {}
	
    }   
    , methods: {
    	fnLogin(){
        	var self = this;
        	var nparmap = {userId : self.id, pwd : self.pwd};
        	$.ajax({
    			url : "/userLogin.dox",
    			dataType : "json",
    			type : "POST",
    			data : nparmap,
    			success : function(data) {
    				alert(data.message);
    				if(data.result == "success"){
    					location.href="/main.do"
    					}
    				}
    			});
        	}
    	,fnFindId(){
    		var self = this;
    		location.href="/userFindId.do"
    	}
    	,fnFindPwd(){
    		var self = this;
    		location.href="/userFindPwd.do"
    	}
    	,fnSignUp(){
    		var self = this;
    		location.href="/userSignup.do"
    	}
    }   
    , created: function () {
    	var self = this;

	}
});
</script>
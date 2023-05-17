<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="js/jquery.js"></script>
	<script src="js/vue.js"></script>
	<link rel="stylesheet" href="css/Base_rgbPepero.css">
	<title></title>
</head>

<body>
	<div id="appHeader">
	    <div id="header">
	        <div class="loginbox" v-if="sessionId == ''">
	            <ul>
	                <li><a href="#" @click="toLogin()">로그인</a></li>
	                <li><a href="#" @click="toSignup()">회원가입</a></li>
	                <li><a href="#" @click="toBoard()">고객센터</a></li>
	            </ul>
	        </div>
	        <div class="loginbox" v-else>
	            <ul>
	                <li><span style="font-weight: 400;">{{sessionName}}</span>님 축하합니다</li>
	                <li><a href="#" @click="toMyinfo()">마이페이지</a></li>
	                <li><a href="#" @click="toLogout()">로그아웃</a></li>
	                <li><a href="#" @click="toBoard()">고객센터</a></li>
	            </ul>
	        </div>
	        <div class="logobox">
	            <div id="logo"><img  @click="toMain()" src="/image/icon/logo_Marrimo.png"></div>
	        </div>
	    </div>
    </div>
</body>
</html>
<script type="text/javascript">
var appHeader = new Vue({ 
    el: '#appHeader',
    data: {
		sessionId : "${sessionId}",
		sessionName : "${sessionName}",
		sessionStatus : "${sessionStatus}"

    }   
    , methods: {
    	toLogin : function() {
        	location.href="userLogin.do";
    	},
    	toLogout : function() {
        	location.href="logout.do";
    	},
    	toSignup : function() {
        	location.href="userSignup.do";
    	},
    	toMyinfo : function() {
        	location.href="information.do";
    	},
    	toBoard : function() {
        	location.href="boardMain.do";
    	},
    	toMain : function() {
        	location.href="main.do";
    	}
    	

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
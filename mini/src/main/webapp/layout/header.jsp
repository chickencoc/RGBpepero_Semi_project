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
	<style>
		.loginbox > a:hover {cursor: pointer;} 
	</style>
</head>

<body>
	<div id="appHeader">
	    <div id="header">
	        <div class="loginbox" v-if="sessionId == ''">
	            <ul>
	                <li><a herf="#" @click="toLogin()">로그인</a></li>
	                <li><a href="#">회원가입</a></li>
	                <li><a href="#">고객센터</a></li>
	            </ul>
	        </div>
	        <div class="loginbox" v-else>
	            <ul>
	                <li><a href="#"><span style="font-weight: 400;">{{sessionName}}</span>님 축하합니다</a></li>
	                <li><a href="#">마이페이지</a></li>
	                <li><a href="#">로그아웃</a></li>
	                <li><a href="#">고객센터</a></li>
	            </ul>
	        </div>
	        <div class="logobox">
	            <div id="logo" @click="toMain()"><img src="/image/logo_Marrimo.png"></div>
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
        	location.href="login.do";
    	},
    	toLogout : function() {
        	location.href="login.do";
    	},
    	toMain : function() {
        	location.href="main.do";
    	},
    	

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
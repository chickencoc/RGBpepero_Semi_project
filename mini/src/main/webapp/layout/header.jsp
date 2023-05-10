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
	<title>footer</title>
</head>

<body>
	<div id="appHeader">
	    <div id="header">
	        <div class="loginbox" v-if="session == ''">
	            <ul>
	                <li><a href="#">로그인</a></li>
	                <li><a href="#">회원가입</a></li>
	                <li><a href="#">고객센터</a></li>
	            </ul>
	        </div>
	        <div class="loginbox" v-else>
	            <ul>
	                <li><a href="#"><span style="font-weight: 400;">{{name}}</span>님 축하합니다</a></li>
	                <li><a href="#">마이페이지</a></li>
	                <li><a href="#">로그아웃</a></li>
	                <li><a href="#">고객센터</a></li>
	            </ul>
	        </div>
	        <div class="logobox">
	            <div id="logo"><img src="/image/logo_Marrimo.png"></div>
	        </div>
	    </div>
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#appHeader',
    data: {
		session : '',
		name : '빨간빼빼로'

    }   
    , methods: {

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
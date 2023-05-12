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
	    	<div class="loginbox"></div>
	        <div class="logobox">
	            <div id="logo"><img  @click="toMain()" src="/image/logo_Marrimo.png"></div>
	        </div>
	    </div>
    </div>
</body>
</html>
<script type="text/javascript">
var appHeader = new Vue({ 
    el: '#appHeader',
    data: {
		session : '',
		name : '빨간빼빼로'

    }   
    , methods: {
    	
    	toMain : function() {
        	location.href="main.do";
    	}

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
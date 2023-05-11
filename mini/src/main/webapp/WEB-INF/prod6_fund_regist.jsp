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
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/prod6_fund_regist.css">
	<title>여행 펀딩 레지스트리 등록</title> 
</head>
<body>
    <div class="fund_regist_container">        
	    <div class="fund_regist_header">
	        <div><img src="/semiproject1/image/fi-sr-cross.png" @click="" id="fund_regist_header_icon"></div>
	        <h5>펀딩 레지스트리 등록</h5>
	    </div>
	    <div class="fund_regist_mainBox">
	    <div class="fund_regist_main">
	        <img id="fund_regist_main_img" src="/semiproject1/image/square-lab-HFx7_MbB3d0-unsplash.jpg">
	        <div class="fund_regist_main_info">
	            <div>여행지</div>
	            <div id="fund_regist_main_info_name">{name}</div>
	            <div>
	                <div id="fund_regist_main_info_price">펀딩가격설정</div>
	                <input type="text" size="15" id="fund_regist_main_info_price"> 원
	            </div>
	        </div>
	    </div>
	    <div class="fund_regist_main_memo">
	        <div id="fund_regist_main_memo_title">전달하고픈 말</div>
	        <input type="text">  
	    </div>
	    <button id="fund_regist_main_button">등록하기</button>
	    </div>
	    <div class="fund_regist_footer">
	        <img src="/semiproject1/image/logo_Marrimo.png" id="fund_regist_footer_logo">
	        <span>도움이 필요하신가요?</span>
	        <a href="#">고객센터</a>
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
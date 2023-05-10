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
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	<title>회원용 레지스트리 옵션 팝업</title>
</head>
<body>
    <div id="app">
		<div class="container">
            <div class="reg_options_popup">
                <div><img src="/semiproject1/image/fi-sr-cross.png" id="reg_option_popup_close" @click=""></div>
                <div class="reg_options_popup_image">
                </div>
                <div class="reg_options_popup_info">
                    <div id="reg_options_popup_name">상품 이름</div>
                    <div id="reg_options_popup_price">상품 가격</div>
                    <div>수량<input type="text" size="1" value="1" id="reg_options_popup_stock_number"></div>
                </div>
                <ul class="reg_options_popup_checkbox">
                    <li id="reg_options_popup_checkbox">상품 표시 옵션</li>
                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" > "정말 필요한 물건" 표시</li>                 
                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" > "그룹선물(펀딩)"로 변경하기</li>
                </ul>
                <div class="reg_options_popup_memo">
                    <div><img src="/semiproject1/image/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보를 기재해주세요</div>
                    <input type="text" id="reg_options_popup_memo_txt">
                </div>
                <button class="reg_options_popup_btn">저장하기</button>
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
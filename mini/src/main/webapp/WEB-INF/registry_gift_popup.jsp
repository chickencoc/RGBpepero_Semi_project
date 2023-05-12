<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/headerLogo.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	<title>비회원 레지스트리 선물하기 팝업</title>
</head>

<body>
    <div id="app">		
            <div class="reg_options_popup" style="height: 550px;">
                <div><img src="/image/fi-sr-cross.png" id="reg_gift_popup_close" @click=""></div>
                <div class="reg_options_popup_image">
                </div>
                <div class="reg_options_popup_info">
                    <div id="reg_options_popup_name">상품 이름</div>
                    <div id="reg_options_popup_price">상품 가격</div>
                    <div>수량<input type="text" size="1" value="1" id="reg_options_popup_stock_number"></div>
                </div>
                <div class="reg_options_popup_memo">
                    <div><img src="/image/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물 하실 때 참고하세요</div>
                    <input type="text" id="reg_options_popup_memo_txt">
                </div>
                <button class="reg_gift_popup_btn">선물하기</button>
            </div>
            <div class="reg_options_popup" style="height: 550px;">               
                <div class="reg_options_popup_image">
                </div>
                <div class="reg_options_popup_info">
                    <div id="reg_options_popup_name">상품 이름</div>
                    <div id="reg_options_popup_price">상품 가격</div>
                    <div class="percentage" v-if="" style="position: relative; right: 15px; top: 20px;">
                        <progress id="progress" value="30" max="100"></progress>
                        <span>{30}%</span>                        
                    </div>
                </div>
                <div class="reg_options_popup_memo">
                    <div><img src="/image/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물 하실 때 참고하세요</div>
                    <input type="text" id="reg_options_popup_memo_txt">
                </div>
                <button class="reg_gift_popup_btn" @click="fnBuyGift">선물하기</button>
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
    	fnBuyGift : function(){
    		location.href = "" //비회원정보입력페이지로 이동.
    	}
    }   
    , created: function () {
    	var self = this;

	}
});
</script>
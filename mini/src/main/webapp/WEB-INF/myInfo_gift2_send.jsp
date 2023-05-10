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
	<link rel="stylesheet" href="/css/myInfo_gift2_send.css">
	<title>답례품 구매 페이지</title>
</head>

<body>
    <div id="app">
			<div class="loginbox">
            <ul>
                <li><a href="#">{{name}}님 축하합니다</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">로그아웃</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </div>
        <div class="logobox">
            <div id="logo"><img src="/image/logo_Marrimo.png"></div>
        </div>
    <!-- header END -->
    <!-- wrap START -->
    <div id="wrapper">
        <div class="container"> <!-- 전체 묶음 -->       
            <div class="list">
                <a href="">회원정보</a>
                <a href="">나의 레지스트리</a>
                <a href="">받은 선물 목록</a>
                <a href="">보낸답례품</a>
                <a href="">캘린더</a>
            </div>
            <div class="returnGift">답례품</div>
            <div class="productList"> 
                    <div class="orderList_img">
                        <img class="productMain" src="/img/defuser.jpg" alt="디퓨저 메인">
                        <div class="productThumbnail">
                            <img class="product1" src="/img/defuser1.jpg" alt="디퓨저 메인">
                            <img class="product2" src="/img/defuser2.jpg" alt="디퓨저 메인">
                            <img class="product3" src="/img/defuser3.jpg" alt="디퓨저 메인">
                        </div>
                    </div>              
                    <div class="orderList_detail">
                        <div class="orderList1">상품이름 : </div>
                        <div class="orderList1">상품가격 : </div>
                        <div class="orderList1">주문수량 :
                            <select name="order" id="order">
                                <option value="number">수량</option> 
                            </select>
                        </div>
                    </div>  
                <div class="personList">
                    <div class="person">받는 사람</div>
                    <div class="person1"></div>
                </div>
                    <div class="productList1">
                        <hr class="line">                      
                        <div class="text">제품 상세 설명</div>
                        <hr class="line1">
                    </div>
                    <button class="btn">선물하기</button>   
            </div>
        </div>
    </div>
    <!-- wrap END -->
    <!-- footer END -->
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
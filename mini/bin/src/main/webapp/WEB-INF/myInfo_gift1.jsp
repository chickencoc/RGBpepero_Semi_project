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
	<link rel="stylesheet" href="/css/myInfo_gift1.css">
	<title>카드페이지</title>
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
        <div class="container">
            
            <div class="cardBox">
                <img class="mainCard" src="/img/card1.jpg" alt="카드 메인 이미지">
            </div>
            <div class="card_cat">
                <select name="" class="scroll">
                    <option value="popularity">인기순</option>
                    <option value="price">가격순</option>
                    <option value="newest">최신순</option>
                </select>
            </div>
            <div class="cardImg_list"> <!-- 사진 전체 묶음 -->
                    <div class="cardThumbnail">
                        <img class="card" src="/img/card2.jpg" alt="">
                            <div class="cardList1">
                                <div>상품명</div>
                                <div>16,000원</div>
                            </div>
                    </div>
                    <div class="cardThumbnail">
                        <img class="card" src="/img/card3.jpg" alt="">
                            <div class="cardList1">
                                <div>상품명</div>
                                <div>16,000원</div>
                            </div>    
                    </div>
                    <div class="cardThumbnail">
                        <img class="card" src="/img/card4.jpg" alt="">
                            <div class="cardList1">
                                <div>상품명</div>
                                <div>16,000원</div>
                            </div>    
                    </div>  
                    <div class="cardThumbnail">
                        <img class="card" src="/img/card5.jpg" alt="">
                            <div class="cardList1">
                                <div>상품명</div>
                                <div>16,000원</div>
                            </div>
                    </div>
                    <div class="cardThumbnail">
                        <img class="card" src="/img/card6.jpg" alt="">
                            <div class="cardList1">
                                <div>상품명</div>
                                <div>16,000원</div>
                            </div>
                    </div>
                    <div class="cardThumbnail">
                        <img class="card" src="/img/card7.jpg" alt="">
                            <div class="cardList1">
                                <div>상품명</div>
                                <div>16,000원</div>
                            </div>
                    </div>
            </div>
                <div class="page">
                    <div>
                        <1>페이지 이동
                    </div>
                    <div class="arrow">
                        <img class="arrow1" src="/img/arrow1.PNG" alt="">
                        <span class="number">1</span>
                        <img class="arrow2" src="/img/arrow2.PNG" alt="">
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
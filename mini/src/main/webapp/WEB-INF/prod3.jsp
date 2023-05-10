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
	 <link rel="stylesheet" href="/css/prod1.css">
	<title>상품페이지 : 주방</title>
</head>

<body>
    <div id="app">
    <div id="wrapper">
        <div class="container">
            <div class="prodCategoryList">
                <a href="">침실</a>
                <a href="">거실</a>
                <a href="">드레스룸</a>
                <a href=""><b>주방</b></a>
                <a href="">가전제품</a>
                <a href="">욕실</a> 
                <a href="">식장</a> 
                <a href="">여행</a>
            </div>
            <div class="prod1Banner">
                <img src="/image/prod3Banner.png" id="bannerImg">
                <div class="bannerText">
                    <p>맛있는 냄새와 즐거운 음식</p>
                    <p>주방 제품입니다.</p>
                </div>
            </div>
            <div class="searchBox">
                
                <input type="text" placeholder="상품명을 입력해주세요" class="searchBar serach">
                <button class="prodBtn searchM">검색</button><button class="prodBtn cancelBtn searchR">초기화</button>
            </div>
            <div class="prodSelectBox">
                <select id="prodArray">
                    <option value="">::정렬::</option>
                    <option value="price">가격순</option>
                    <option value="pop">인기순</option>
                    <option value="new">최신순</option>
                </select>
            </div>
            <div class="prodListBox">
                <div class="prodList">
                    <a href="">
                        <div class="prodBox">
                            <img src="/image/prod3.jpg" class="prod1Img">
                            <div class="prodName">{{p_name}}</div>
                            <div class="prodPrice">{{p_price}}원</div>
                            <div class="prodLike">좋아요 : <img src="/image/Like.png" class="prodLikeImg"></div>
                        </div>
                    </a>
                    <div class="prodBox">
                        <img src="/image/prod3.jpg" class="prod1Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod3.jpg" class="prod1Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod3.jpg" class="prod1Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod3.jpg" class="prod1Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod3.jpg" class="prod1Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                </div>
            </div> 
            <div class="pageList">
                <input type="number" class="pageListNum" min="1"> <a href="">페이지로 이동</a>
            </div>
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
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
	<link rel="stylesheet" href="/css/prod0.css">
	<title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
<div id="wrapper">
        <div class="container">
            <div class="prodCategoryList">
                <a href=""><b>침실</b></a>
                <a href="">거실</a>
                <a href="">드레스룸</a>
                <a href="">주방</a>
                <a href="">가전제품</a>
                <a href="">욕실</a> 
                <a href="">식장</a> 
                <a href="">여행</a>
            </div>
            <div class="prod0Banner">
                <img src="/image/prod0Banner.jpg" id="bannerImg">
                <div class="bannerText">
                    <p>하루 중 가장 많은 시간을 보내는 곳</p>
                    <p>편안하고 아늑한 잠자리를 위하여</p>
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
                            <img src="/image/prod0.jpg" class="prod0Img">
                            <div class="prodName">{{p_name}}</div>
                            <div class="prodPrice">{{p_price}}원</div>
                            <div class="prodLike">좋아요 : <img src="/image/Like.png" class="prodLikeImg"></div>
                        </div>
                    </a>
                    <div class="prodBox">
                        <img src="/image/prod0.jpg" class="prod0Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod0.jpg" class="prod0Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod0.jpg" class="prod0Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod0.jpg" class="prod0Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                    <div class="prodBox">
                        <img src="/image/prod0.jpg" class="prod0Img">
                        <div class="prodName">{{p_name}}</div>
                        <div class="prodPrice">{{p_price}}원</div>
                        <div class="prodLike">좋아요 :  <img src="/image/Like.png" class="prodLikeImg"></div>
                    </div>
                </div>
            </div> 
            <div class="pageList">
                <input type="number" class="pageListNum" min="1"> <a href="">페이지로 이동</a>
                
            </div>
            <template>
                <paginate
                  :page-count="pageCount"
                  :page-range="3"
                  :margin-pages="2"
                  :click-handler="fnSearch"
                  :prev-text="'<'"
                  :next-text="'>'"
                  :container-class="'pagination'"
                  :page-class="'page-item'">
                </paginate>
              </template>
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
        selectPage: 1,
        pageCount: 1,
        cnt : 0
    }   
    , methods: {
       fnSearch : function(){

        }
    }   
    , created: function () {
        var self = this;
    }
});
</script>
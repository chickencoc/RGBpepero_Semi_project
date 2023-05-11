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
	<title>받은 선물 목록</title>
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
            <div class="box">
                <!-- 리스트 스타일 1-->
                <div class="listStyle1" v-if="currentView === 'list1'"> <!-- 리스트스타일1 전체 -->
                    <div class="profileImg_List">
                        <div class="profileImg"><img src="/img/profile.png" alt="profile"> <!-- 프로필 이미지 -->
                            <div class="id">ID : test123</div>
                        </div>
                    </div>
                        <div class="list">
                            <a href="">회원정보</a>
                            <a href="">나의 레지스트리</a>
                            <a href=""><strong>받은 선물 목록</strong></a>
                            <a href="">보낸답례품</a>
                            <a href="">캘린더</a>
                        </div>
                    </div>
                        <div class="searchImg1">
                            <input class="searchList" type="text" value="검색">
                                    <button class="btn">검색</button>
                                    <button class="btn1">초기화</button>
                                <select name="" class="scroll">
                                    <option value="price">가격순</option>
                                    <option value="newest">최신순</option>
                                </select>
                                <span class="list2">
                                <a href="" id="category1"><img class="list1" @click="changeView" src="/img/list1.PNG" alt=""></a>
                                    <a href="" id="category2"><img class="list1" @click="changeView1" src="/img/list2.PNG" alt=""></a>
                                </span>
                            </input>
                        </div>
                    <div class="productList_Img"> <!-- 사진 전체 묶음 -->
                            <div class="gift">
                                <img class="product" src="/img/cup.jpg" alt=""> <!-- 받은 상품 이미지-->
                                    <div class="giftList">    
                                        <div>제품명:XXX</div>
                                        <div>선물해준 사람:A</div>
                                        <div>받은 날짜:XXXX-XX-XX</div>
                                        <div>펀딩:10,000원</div>
                                    </div>
                            </div>
                            <div class="gift">
                                <img class="product" src="/img/cup1.jpg" alt=""> <!-- 받은 상품 이미지-->
                                    <div class="giftList">     
                                        <div>제품명:XXX</div>
                                        <div>선물해준 사람:b</div>
                                        <div>받은 날짜:XXXX-XX-XX</div>
                                        <div>펀딩:10,000원</div>
                                    </div>
                            </div>
                            <div class="gift">
                                <img class="product" src="/img/knife.jpg" alt=""> <!-- 받은 상품 이미지-->
                                    <div class="giftList"> 
                                        <div>제품명:XXX</div>
                                        <div>선물해준 사람:c</div>
                                        <div>받은 날짜:XXXX-XX-XX</div>
                                        <div>펀딩:10,000원</div>
                                    </div>
                            </div>
                            <div class="gift">
                                <img class="product" src="/img/kichin set.jpg" alt=""> <!-- 받은 상품 이미지-->
                                    <div class="giftList">
                                        <div>제품명:XXX</div>
                                        <div>선물해준 사람:d</div>
                                        <div>받은 날짜:XXXX-XX-XX</div>
                                        <div>펀딩:10,000원</div>
                                    </div>    
                            </div>
                            <div class="gift">
                                <img class="product" src="/img/dish drying rack.jpg" alt=""> <!-- 받은 상품 이미지-->
                                    <div class="giftList"> 
                                        <div>제품명:XXX</div>
                                        <div>선물해준 사람:e</div>
                                        <div>받은 날짜:XXXX-XX-XX</div>
                                        <div>펀딩:10,000원</div>
                                    </div>
                            </div>
                            <div class="gift">
                                <img class="product" src="/img/spoon.jpg" alt=""> <!-- 받은 상품 이미지-->
                                    <div class="giftList"> 
                                        <div>제품명:XXX</div>
                                        <div>선물해준 사람:f</div>
                                        <div>받은 날짜:XXXX-XX-XX</div>
                                        <div>펀딩:10,000원</div>
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
                            <div class="btn4">
                                <button class="btn2">답례품 보내기</button>
                                <button class="btn3">카드 작성하기</button>
                            </div>    
                        </div>
                </div>  <!-- 리스트스타일1 전체 -->

                    <!-- 리스트 스타일 2-->
                <div class="listStyle2" v-else-if="currentView === 'list2'">   <!-- 리스트 스타일2 전체 -->       
                    <div class="profileImg_List1"><img src="/img/profile.png" alt="profile"> <!-- 프로필 이미지 -->
                        <div class="id1">ID : test123</div>
                    </div>
                    <div class="list">
                        <a href="">회원정보</a>
                        <a href="">나의 레지스트리</a>
                        <a href=""><strong>받은 선물 목록</strong></a>
                        <a href="">보낸답례품</a>
                        <a href="">캘린더</a>
                    </div>
                        <div class="searchImg1">
                            <input class="searchList" type="text" value="">
                                    <button class="btn">검색</button>
                                    <button class="btn1">초기화</button>
                                <select name="" id="scroll1">
                                    <option value="price">가격순</option>
                                    <option value="newest">최신순</option>
                                </select>
                                <span class="list2">
                                    <a href="" id="category1"><img class="list1" @click="changeView" src="/img/list1.PNG" alt=""></a>
                                    <a href="" id="category2"><img class="list1" @click="changeView1" src="/img/list2.PNG" alt=""></a>
                                </span>
                                <div class="text1">
                                    <span class="check"><input type="checkbox"> 모두 선택</span>
                                    <span class="check1">(<img class="fundingImg" src="/img/funding.PNG" alt=""> 펀딩)</span>
                                    <span class="check2">수량</span>
                                    <span class="check3">받은 날짜</span>
                                    <span class="check4">금액</span>
                                </div>
                            </input>
                        </div>
                        <div class="productList_Img1"> <!-- 사진 전체 묶음 -->
                            <div class="gift1">
                                <hr class="line">
                                    <input class="checkbox" type="checkbox">
                                        <img class="product1" src="/img/cup.jpg" alt=""> <!-- 받은 상품 이미지-->
                                            <div class="giftList1">  
                                                <span class="gname">받은 선물 이름</span>
                                                <span class="gname1">보낸사람 명</span>
                                            <span class="text2">
                                                <span><img class="fundingImg1" src="/img/funding.PNG" alt=""></span>
                                                <span class="check5">1개</span>
                                                <span class="check6">2023.06.20</span>
                                                <span class="check7">58,000원</span>
                                            </span>    
                                                <div class="content">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                                            </div>
                                <hr class="line1">    
                            </div>

                            <div class="gift1">
                                    <input class="checkbox" type="checkbox">
                                        <img class="product1" src="/img/cup1.jpg" alt=""> <!-- 받은 상품 이미지-->
                                            <div class="giftList1">   
                                                <span class="gname">받은 선물 이름</span>
                                                <span class="gname1">보낸사람 명</span>
                                            <span class="text2">    
                                                <span><img class="fundingImg1" src="/img/funding.PNG" alt=""></span>
                                                <span class="check5">1개</span>
                                                <span class="check6">2023.06.20</span>
                                                <span class="check7">58,000원</span>
                                            </span>    
                                                <div class="content">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                                            </div>
                                <hr class="line1">
                            </div>
                            <div class="gift1">
                                    <input class="checkbox" type="checkbox">
                                        <img class="product1" src="/img/knife.jpg" alt=""> <!-- 받은 상품 이미지-->
                                            <div class="giftList1">    
                                                <span class="gname">받은 선물 이름</span>
                                                <span class="gname1">보낸사람 명</span>
                                            <span class="text2">    
                                                <span><img class="fundingImg1" src="/img/funding.PNG" alt=""></span>
                                                <span class="check5">1개</span>
                                                <span class="check6">2023.06.20</span>
                                                <span class="check7">58,000원</span>
                                            </span>    
                                                <div class="content">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                                            </div>
                                <hr class="line1">    
                            </div>

                            <div class="gift1">
                                <input class="checkbox" type="checkbox">
                                        <img class="product1" src="/img/kichin set.jpg" alt=""> <!-- 받은 상품 이미지-->
                                            <div class="giftList1">    
                                                <span class="gname">받은 선물 이름</span>
                                                <span class="gname1">보낸사람 명</span>
                                            <span class="text2">
                                                <span><img class="fundingImg1" src="/img/funding.PNG" alt=""></span>    
                                                <span class="check5">1개</span>
                                                <span class="check6">2023.06.20</span>
                                                <span class="check7">58,000원</span>
                                            </span>    
                                                <div class="content">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                                            </div>
                                <hr class="line1">            
                            </div>
                            <div class="gift1">
                                <input class="checkbox" type="checkbox">
                                        <img class="product1" src="/img/dish drying rack.jpg" alt=""> <!-- 받은 상품 이미지-->
                                            <div class="giftList1">    
                                                <span class="gname">받은 선물 이름</span>
                                                <span class="gname1">보낸사람 명</span>
                                            <span class="text2">    
                                                <span><img class="fundingImg1" src="/img/funding.PNG" alt=""></span>
                                                <span class="check5">1개</span>
                                                <span class="check6">2023.06.20</span>
                                                <span class="check7">58,000원</span>
                                            </span>    
                                                <div class="content">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                                            </div>
                                <hr class="line1">
                            </div>
                            <div class="gift1">
                                <input class="checkbox" type="checkbox">
                                        <img class="product1" src="/img/spoon.jpg" alt=""> <!-- 받은 상품 이미지-->
                                            <div class="giftList1">    
                                                <span class="gname">받은 선물 이름</span>
                                                <span class="gname1">보낸사람 명</span>
                                            <span class="text2">    
                                                <span><img class="fundingImg1" src="/img/funding.PNG" alt=""></span>
                                                <span class="check5">1개</span>
                                                <span class="check6">2023.06.20</span>
                                                <span class="check7">58,000원</span>
                                            </span>    
                                                <div class="content">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                                            </div>
                                <hr class="line1">
                            </div>
                    </div>
                        <div class="page1">
                            <div>
                                <1>페이지 이동
                            </div>
                            <div class="arrow">
                                <img class="arrow1" src="/img/arrow1.PNG" alt="">
                                <span class="number">1</span>
                                <img class="arrow2" src="/img/arrow2.PNG" alt="">
                            </div>
                            <div class="btn4">
                                <button class="btn2">답례품 보내기</button>
                                <button class="btn3">카드 작성하기</button>
                            </div>    
                        </div>
                </div> <!-- 리스트 스타일2 전체 -->
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
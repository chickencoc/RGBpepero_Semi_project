<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/mainPage.css">
	<title>첫번째 페이지</title>
</head>

<body>
    <div class="banner">
        <div class="textbox">
            <h6 class="bannertxt_main">For all the <span id="spanTxt">celebrations</span> along the way</h6>
            <span class="bannerLine"></span>
            <h4 class="bannertxt_sub">당신의 행복한 결혼을 이곳에서 시작하세요</h4>
            <div class="banner_btnbox">
                <button class="custom_btn banner_btn" onclick="toLogin()">Let`s Go</button>
            </div>
            <img class="imgDown" src="/image/icon/caret-down.png" alt="go down">
        </div>
    </div>
    <div id="mainWrapper">
        <div class="detailbox">
            <div class="pageDetail">
                <div class="menu_cat_items" id="product" name="product">
                    <div class="pageDetail_imgbox">
                        <img src="/image/categoryK/registry.jpg">
                    </div>
                    <div class="pageDetail_textbox">
                        <div class="pageDetail_text">
                            <h4>당신의 레지스트리를 행복으로 채우세요</h4>
                            <a class="pageDetail_link" href="product.do">PRODUCT >></a>
                        </div>
                    </div>
                </div>
                <div class="menu_cat_items" id="trip" name="trip">
                    <div class="pageDetail_imgbox">
                        <img src="/image/tripO/trip.jpg">
                    </div>
                    <div class="pageDetail_textbox">
                        <div class="pageDetail_text">
                            <h4>사랑하는 사람과 함께하는 여행</h4>
                            <a class="pageDetail_link" href="triprecommend.do">TRIP >></a>
                        </div>
                    </div>
                </div>
                <div class="menu_cat_items" id="card" name="card">
                    <div class="pageDetail_imgbox">
                        <img src="/image/categoryR/card.jpg">
                    </div>
                    <div class="pageDetail_textbox">
                        <div class="pageDetail_text">
                            <h4>감사한 마음을 정성어린 카드로 전달하세요</h4>
                            <a class="pageDetail_link" href="mygiftpage.do">CARD >></a>
                        </div>
                    </div>
                </div>
                <div class="menu_cat_items" id="venue" name="venue">
                    <div class="pageDetail_imgbox">
                        <img src="/image/userimgB/venue2.jpg">
                    </div>
                    <div class="pageDetail_textbox">
                        <div class="pageDetail_text">
                            <h4>이쁜만큼 기분도 두배</h4>
                            <a class="pageDetail_link" href="weddingrecommend.do">VENUE >></a>
                        </div>
                    </div>
                </div>
                <div class="menu_cat_items" id="represent" name="represent">
                    <div class="pageDetail_imgbox">
                        <img src="/image/categoryR/return2.jpg">
                    </div>
                    <div class="pageDetail_textbox">
                        <div class="pageDetail_text">
                            <h4>고마운 상대에게 특별한 마음을 전하세요</h4>
                            <a class="pageDetail_link">RETURN PRESENT >></a>
                        </div>
                    </div>
                </div>
                <div class="menu_cat_items" id="calender" name="calender">
                    <div class="pageDetail_imgbox">
                        <img src="/image/categoryV/calender.jpg">
                    </div>
                    <div class="pageDetail_textbox">
                        <div class="pageDetail_text">
                            <h4>당신의 친구와 일정을 공유하세요</h4>
                            <a class="pageDetail_link" href="calender.do">CALENDER >></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pageListBox">
                <div class="pageList">
                    <ul class="pageList_ul">
                        <li><a href="#product">Product</a></li>
                        <li><a href="#trip">Trip</a></li>
                        <li><a href="#card">Card</a></li>
                        <li><a href="#venue">Venue</a></li>
                        <li><a href="#represent">Return Present</a></li>
                        <li><a href="#calender">Calender</a></li>
                    </ul>
                    <ul class="pageList_qna">
                        <li><h5>도움이 필요 하신가요??</h5></li>
                        <li><a class="pageDetail_link" href="inquery.do">문의하기</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
	// 영역의 0.7만큼 보이면 opacity 1로 변경
	let observer = new IntersectionObserver((e) => {
	    e.forEach((items) => {
	        if(items.isIntersecting) {
	            items.target.style.opacity = 1;
	            items.isIntersecting && observer.unobserve(items.target);
	        }
	    });
	}, {
	    threshold : 0.6
	});
	let pageDetail = document.querySelectorAll('div.menu_cat_items');
	pageDetail.forEach((items) => {
	    observer.observe(items);
	});
	
	// imgDown 움직임 표현
	let imgDown = document.getElementsByClassName('imgDown')[0];
	setInterval (function() {
	    imgDown.classList.toggle('imgDownMove');
	}, 2000);
	
	// let spanTxt = document.getElementById('spanTxt');
	// const spanTxtlist = ['celebrations', 'to-dos', 'big decisions', 'happy tears', 'days']
	
	const toLogin = () => {
    	location.href="userLogin.do";
	};
	
</script>
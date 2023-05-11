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
	<link rel="stylesheet" href="/css/myInfo_gift2_list.css">
	<title>답례품 목록 페이지</title>
</head>

<body>
    <div id="app">
	<div id="wrapper">
        <div class="return_gift_list_menu">
            <a href="">회원정보</a>
            <a href="">나의 레지스트리</a>
            <a href="">받은 선물 목록</a>
            <a href="">보낸답례품</a>
            <a href="">캘린더</a>
        </div>
        <div class="return_gift_content">       
        <main class="return_gift_main">              
            <div class="return_gift_container">
                <div id="return_gift_menu_txt">답례품</div>                      
                <div class="return_gift_banner">
                    <span class="return_gift_banner_txt">#답례품</span>
                </div>
                <div class="return_gift_search">
                    <input type="text" id="return_gift_input_txt">
                    <button id="return_gift_searchBtn">검색</button>
                    <button id="return_gift_resetBtn">초기화</button>
                </div>
                <div class="return_gift_select">
                    <select class="return_gift_select_bar">
                        <option class="return_gift_select_option">기본순</option>
                        <option class="return_gift_select_option">낮은가격순</option>
                        <option class="return_gift_select_option">높은가격순</option>
                    </select>
                </div>
                
                    <div class="return_gift_listbox">
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/davey-gravy-qZRdiO1WIic-unsplash.jpg"></a>
                            </div>
                            <div class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[신라호텔] 고급 마카롱 5구 세트</p>
                                <p class="return_gift_list_item_price">20,000 원</p>
                                <p class="return_gift_list_item_explain">신라호텔 명장이 직접 만든 고급 마카롱!</p>
                            </div>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/everdrop-gmbh-_0-wAt9dkFA-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[EVER DROP] 수건 2종 세트</p>
                                <p class="return_gift_list_item_price">10,000 원</p>
                                <p class="return_gift_list_item_explain">이탈리아 명장이 한땀 한땀 만든 수건!</p>
                            </ul>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/bruno-martins-Pfrne_5S_-8-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[BRUNOMARTINS] 최고급 레드 와인 1병</p>
                                <p class="return_gift_list_item_price">48,000 원</p>
                                <p class="return_gift_list_item_explain">체코에서 딴 포도로 만든 최고오오급 와인</p>
                            </ul>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/pmv-chamara-CiiVHf5K00o-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[CHAMARA] 스킨케어세트</p>
                                <p class="return_gift_list_item_price">30,000 원</p>
                                <p class="return_gift_list_item_explain">유해한 성분은 모두 빼고 순한 성분으로 구성! 민감성 피부도 사용가능한 기초 스킨케어 세트</p>
                            </ul>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/everdrop-gmbh-fMpiuMxwacE-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[EVER DROP] 천연 세제 3종 세트</p>
                                <p class="return_gift_list_item_price">20,000 원</p>
                                <p class="return_gift_list_item_explain">민감한 우리 아이 피부에도 걱정 없는 세제</p>
                            </ul>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/luma-candles-K1Xi_R_mfpk-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[LUMA] 라벤더/장미/우드 향초 1세트</p>
                                <p class="return_gift_list_item_price">10,000 원</p>
                                <p class="return_gift_list_item_explain">유해성분 걱정 없는 향초!</p>
                            </ul>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/jonathan-borba-Rsfz17HyiAg-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">[JONATHAN] 미니 티백 10종 세트</p>
                                <p class="return_gift_list_item_price">15,000 원</p>
                                <p class="return_gift_list_item_explain">호불호 없는 티백 10종!</p>
                            </ul>
                        </div>
                        <div class="return_gift_list_item">
                            <div>
                                <a href="#"><img class="return_gift_list_item_image" src="/semiproject1/image/insung-yoon-baLUAKBNsG4-unsplash.jpg"></a>
                            </div>
                            <ul class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">표현하지 않으면 모릅니다</p>
                                <p class="return_gift_list_item_price">지금 선물로 마음을 표현하세요!</p>
                                <p class="return_gift_list_item_explain">저희가 준비한 답례품 리스트는 최고의 품질!</p>
                            </ul>
                        </div>
                    </div>
                    <div class="return_gift_pagechange">
                        <a><img src="/semiproject1/image/fi-sr-angle-left.png" id="return_gift_pagechange_icon"></a>
                        <span>{{1}}</span>
                        <a><img src="/semiproject1/image/fi-sr-angle-right.png" id="return_gift_pagechange_icon"></a>
                        <div>{{}}페이지로 이동</div>
                    </div>                  
            </div>                
        </main>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/myInfo_reg.css">
	<jsp:include page="/layout/headerLogo.jsp"></jsp:include>
	<title>비회원용 페이지</title>
</head>

<body>
    <div id="app">
		<div class="regi_content">
        <main class="regi_main">
            <div class="regi_container">              
                <span id="regi_user">신랑 & 신부의 레지스트리</span>            
            </div>           
            <div class="regi_container">                
                <div class="regi_back_image">
                	<img src="/image/couple_background.jpg" id="regi_back_image">                               
                </div>    
                <a id="regi_profile"></a>                       
            </div>
            <div class="regi_container">
                <div class="regi_select">
                    <select style="width: 80px;">
                        <option>등록순</option>
                        <option>가격순</option>                   
                    </select>
                </div>               
                
                <div class="myinfo_registry">                                       
                    <div class="regi_items">
                        <!--갖고싶은물건-->
                        <div id="regi_wanted_badge"> <!--배지-->
                        <img src="/image/loundry.jpg" class="regi_items_image">
                        </div> 
                        <!-- <div id="wanted" v-else="">
                            <img src="/image/loundry.jpg" class="items-image">
                        </div> -->                 
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options_taken">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_giveBtn" @click="fnGiveGift()">선물하기</button>
                            
                        </div>
                    </div>
                    <!--일반-->
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options_taken">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_giveBtn" @click="fnGiveGift()">선물하기</button>
                            
                        </div>
                    </div>
                    <!--펀딩퍼센트-->
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_percentage" v-if="">
                            <progress id="regi_progress" value="30" max="100"></progress>
                            <span>{value}%</span>                        
                        </div>
                        <div class="regi_items_options_taken">    
                            <span id="regi_stock_text" >수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>                     
                            <button id="regi_giveBtn" @click="fnGiveGift()">선물하기</button>
                            
                        </div>
                    </div>
                    <!--선물완료인 경우-->
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options_taken">
                            <button id="regi_taken_gift" disabled>선물완료</button>
                        </div>
                    </div>
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options_taken">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_giveBtn" @click="fnGiveGift()">선물하기</button>
                            
                        </div>
                    </div>
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options_taken">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_giveBtn" @click="fnGiveGift()">선물하기</button>
                            
                        </div>
                    </div>
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
		fnGiveGift: function() {
			let popUrl = "/registryGift.do";
    		let popOption = "width = 500px, height=600px, top=300px, left=300px, scrollbars=no";
    		
    		window.open(popUrl, "옵션 설정", [popOption]);
		}
    }   
    , created: function () {
    	var self = this;

	}
});
</script>
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
	<link rel="stylesheet" href="/css/myInfo_reg.css">
	<title>회원 레지스트리</title>
</head>
<body>
    <div id="app">  		
	    <div id="wrapper">	    	
        <div class="regi_content">
        <main class="regi_main">
            <div class="regi_container">               
                <span id="regi_user">신랑 & 신부의 레지스트리</span>
                <div class="regi_your_url">
                    <h6 style="text-align: center;">당신의 레지스트리 주소</h6>
                    <span id="regi_url">
                        www.zola.com/registry/twocats
                        <a href="#" @click=""><img src="/image/fi-ss-upload.png" id="regi_icon"></a>
                        <span style="font-size: 9px;">주소복사</span>
                    </span>
                </div>
            </div>           
            <div class="regi_container">                
                <div class="regi_back_image_box">
                    <button id="regi_back_image_button" @click="fnBackImageAlter()">배경사진 수정</button>
                    <img src="/image/couple_background.jpg" id="regi_back_image">                                      
                </div>    
                <a href="#" @click="fnProfileAlter()" id="regi_profile"></a>                       
            </div>
            <div class="regi_container">
                <div class="regi_select">
                    <select style="width: 80px;">
                        <option>등록순</option>
                        <option>가격순</option>                   
                    </select>
                </div>
                
                <div class="regi_add_gifts">
                    <a href="#"><img src="/image/fi-sr-plus.png" id="regi_icon"></a>
                    <div>선물 추가하기</div>
                </div>
                <div class="myinfo_registry">                                       
                    <div class="regi_items">
                        <div id="regi_wanted_badge"> <!--배지-->
                        <img src="/image/loundry.jpg" class="regi_items_image">
                        </div> 
                        <!-- <div id="regi_wanted_badge" v-else="">
                            <img src="/image/loundry.jpg" class="items-image">
                        </div> -->                 
                        <p class="regi_regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_optionBtn" @click="fnOptionBtn()">옵션설정</button>
                            <a href="#" id="regi_delete" @click="fnDeleteItem()">삭제하기</a>
                        </div>
                    </div>
                    <!--일반-->
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_optionBtn" @click="fnOptionBtn()">옵션설정</button>
                            <a href="#" id="regi_delete" @click="fnDeleteItem()">삭제하기</a>
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
                        <div class="regi_items_options">    
                            <span id="regi_stock_text" >수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>                     
                            <button id="regi_optionBtn" @click="fnOptionBtn()">옵션설정</button>
                            <a href="#" id="regi_delete" @click="fnDeleteItem()">삭제하기</a>
                        </div>
                    </div>
                    <!--받은선물인 경우-->
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options">
                            <button id="regi_orderInfoBtn" @click="fnOrderInfo()">주문상세보기</button>
                            <button id="regi_reviewBtn" @click="fnReview()">리뷰작성</button>
                        </div>
                    </div>
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_optionBtn" @click="fnOptionBtn()">옵션설정</button>
                            <a href="#" id="regi_delete" @click="fnDeleteItem()">삭제하기</a>
                        </div>
                    </div>
                    <div class="regi_items">
                        <img src="/image/loundry.jpg" class="regi_items_image">                   
                        <p class="regi_pro_name">그랑데 세탁기</p>
                        <p class="regi_pro_price">1,000,000 원</p>
                        <div class="regi_items_options">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" value="1" size="1" readonly>
                            <button id="regi_optionBtn" @click="fnOptionBtn">옵션설정</button>
                            <a href="#" id="regi_delete" @click="fnDeleteItem">삭제하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
		image: ''
	
    }   
    , methods: {
    	fnBackImageAlter : function(){
    		let popUrl = "/registryImg.do";
    		let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
    		
    		window.open(popUrl, "옵션 설정", [popOption]);
	   	    
    	}
    	
    ,	fnProfileAlter : function(){
	    	let popUrl = "/registryImg.do";
			let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
			
			window.open(popUrl, "옵션 설정", [popOption]);
    	}
    ,	fnOptionBtn: function(){   		
    		let popUrl = "/registryOption.do";
    		let popOption = "width = 500px, height=600px, top=300px, left=300px, scrollbars=no";
    		
    		window.open(popUrl, "옵션 설정", [popOption]);  		
    	}
    ,	fnDeleteItem: function(){
    		confirm("삭제하시겠습니까?");
    		
    	}
    ,	fnOrderInfo: function(){
    		
    	}
    ,	fnReview: function(){
    		
    	}
    }   
    , created: function () {
    	

	}
});
</script>
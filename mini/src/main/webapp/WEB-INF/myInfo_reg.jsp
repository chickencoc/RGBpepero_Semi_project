<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="js/jquery.js"></script>
    <script src="js/vue.js"></script>
    <jsp:include page="/layout/header.jsp"></jsp:include>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/myInfo_reg.css">
	<title>회원 레지스트리</title>
</head>
<body>
    <div id="app">  		
	    <div id="wrapper">	
            <div class="user_category_list">
                <a href="#">회원정보</a> <a href="#"><strong>&nbsp;나의 레지스트리</strong></a> 
                <a href="#">&nbsp;받은 선물 목록</a> <a href="#">&nbsp;보낸답례품</a> <a href="#">&nbsp;캘린더</a>
            </div>    	
        <div class="regi_content">
        <main class="regi_main">
            <div class="regi_container">               
                <span id="regi_user">{{sessionName}}의 레지스트리</span>
                <div class="regi_your_url">
                    <h6 style="text-align: center;">당신의 레지스트리 주소</h6>
                    <span id="regi_url">
                    <input id="regi_url_copy" :value="myUrl">    
                        <a href="#" @click="fnUrlCopy()"><img src="/image/fi-ss-upload.png" id="regi_icon"></a>
                        <span style="font-size: 9px;">주소복사</span>
                    </span>
                </div>
            </div>           
            <div class="regi_container">                
                <div class="regi_back_image_box">
                    <button id="regi_back_image_button" @click="fnBackImageAlter()">배경사진 수정</button>
                    <img :src="imgUrl1" id="regi_back_image" alt="이미지">                                      
                </div>    
                <a href="#" @click="fnProfileAlter()"><img :src="imgUrl2" id="regi_profile"></a>                       
            </div>
            <div class="regi_container">
                <div class="regi_select">
                    <select style="width: 80px;">
                        <option>등록순</option>
                        <option>가격순</option>                   
                    </select>
                </div>
                
                <div class="regi_add_gifts">
                    <a href="/mygiftpage.do" @click="fnProductPage"><img src="/image/fi-sr-plus.png" id="regi_icon"></a>
                    <div>선물 추가하기</div>
                </div>
                <div class="myinfo_registry" >

                <div v-for="(item, index) in registry">                              
                    <div class="regi_items" v-if="item.orderNo == null">
                        <!--매우원함-->
                        <div id="regi_wanted_badge" v-if="item.rOption == 'A'"> 
                            <img :src="item.imgSrc" class="regi_items_image" v-if="item.tripNo == null">
                            <img :src="item.imgSrc" class="regi_items_image" v-if="item.productNo == null">
                        </div>                 
                            <p class="regi_pro_name">{{item.pName}}</p>
                            <p class="regi_pro_price">{{item.pPrice}} 원</p>
                        <!--펀딩퍼센트-->
                        <div class="regi_percentage" v-if="item.fundYn == 'Y'">
                            <progress id="regi_progress" value="30" max="100"></progress>
                            <span>{progressValue}%</span>                        
                        </div>
                        <div class="regi_items_options">
                            <span id="regi_stock_text">수량</span>
                            <input type="text" id="regi_stock_number" :value="item.rCnt" size="1" readonly>
                            <button id="regi_optionBtn" @click="fnOptionBtn(item)">옵션설정</button>
                            <a href="#" id="regi_delete" @click="fnDeleteItem(item)">삭제하기</a>
                        </div>
                    </div>                
                    <!--받은선물인 경우-->
                    <div class="regi_items" v-if="item.orderNo != null">
                        <img :src="item.imgSrc" class="regi_items_image" v-if="item.tripNo == null">
                        <img :src="item.imgSrc" class="regi_items_image" v-if="item.productNo == null">                  
                        <p class="regi_pro_name">{{item.pName}}</p>
                        <p class="regi_pro_price">{{item.pPrice}} 원</p>
                        <div class="regi_items_options">
                            <button id="regi_orderInfoBtn" @click="fnOrderInfo(item)">주문상세보기</button>
                            <button id="regi_reviewBtn" @click="fnReview(item)">리뷰작성</button>
                        </div>
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
        sessionId: "${sessionId}"
    ,	userId: "${sessionId}"
    ,   sessionName : "${sessionName}"    
    ,   registry: []
	,	image: []
	, 	imgUrl1: ''
    ,   imgUrl2: ''
    ,   myUrl: 'http://localhost:8080/guestRegistry.do?id=${sessionId}'
    
    }   
    , methods: {
    	
    	fnselectUser: function(){
    		var self = this;
            var nparmap = {userId: self.userId}; //select 요소를 kind 변수에담음. xml이랑 연결됨.
            $.ajax({
                url:"/myRegistry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {    
                    console.log(data);                                   
	                self.registry = data.registry;
	                console.log(self.registry);
                }
     		}); 
    	}	
    ,	fnselectImage : function(){
                var self = this;
                var nparmap = {userId: self.userId};

                $.ajax({
                    url: "/registryImg.dox",
                    dataType: "json",
                    type: "POST",
                    data: nparmap,
                    success: function(data) {
                        self.image = data.image;  // Assuming 'images' is an array of image objects
                        for(var i = 0; i < self.image.length; i++) {
                            if(self.image[i].imgUsetype == 1) {
                                self.imgUrl1 = self.image[i].imgSrc;   
                                console.log(data);                    
                            }
                            else if(self.image[i].imgUsetype == 2){
                                self.imgUrl2 = self.image[i].imgSrc;  
                                console.log(data);                      
                            }
                            // Add more conditions for other image types if necessary
                        }
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        console.error(textStatus);
                    }
                });
            }
    ,   fnUrlCopy : function() {
            var self = this;
            let copyurl = document.getElementById('regi_url_copy');
                    console.log(copyurl);
                    copyurl.select();
                    document.execCommand("copy");
    }
    ,	fnBackImageAlter : function(){
            let popUrl = "/registryBackImg.do";
            let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
    		
    		let popup = window.open(popUrl, "배경이미지설정", [popOption]);
    		popup.onbeforeunload = function() {
                location.reload();
            };
    	}
    	
    ,	fnProfileAlter : function(){
            let popUrl = "/registryProfileImg.do";
            let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
			
			let popup = window.open(popUrl, "프로필이미지설정", [popOption]);
            popup.onbeforeunload = function() {
                location.reload();
            };
    	}
    ,	fnOptionBtn: function(item){  
            localStorage.setItem('userItemList', JSON.stringify(item)); 
            console.log(item);		
    		let popUrl = "/registryOption.do";
    		let popOption = "width = 600px, height=700px, top=300px, left=300px, scrollbars=no";
    		
    		let popup = window.open(popUrl, "옵션 설정", [popOption]);  
           		
    	}
    ,	fnDeleteItem: function(){
    		confirm("삭제하시겠습니까?");
    		
    	}
    ,	fnOrderInfo: function(){
            window.loction.href="/myInfoGift9.do";
    	}
    ,	fnReview: function(){
            window.loction.href= "/review.do";
    	}
    ,	fnProductPage: function(){
    		window.location.href = "/product.do";
    }
    }   
    , created : function () {
    	var self = this;
        self.fnselectUser();
        self.fnselectImage();      
	}
});
</script>
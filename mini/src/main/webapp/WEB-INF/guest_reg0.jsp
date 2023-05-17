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
	<title>비회원용 페이지</title>
</head>

<body>
    <div id="app">
		<div class="regi_content">
        <main class="regi_main">
            <div class="regi_container">              
                <span id="regi_user">누구의 레지스트리</span>           
            </div>           
            <div class="regi_container">                
                <div class="regi_back_image">
                	<img :src="imgUrl1" id="regi_back_image" alt="이미지">                               
                </div>    
                    <img :src="imgUrl2" id="regi_profile">                      
            </div>
            <div class="regi_container">
                <div class="regi_select">
                    <select style="width: 80px;">
                        <option>등록순</option>
                        <option>가격순</option>                   
                    </select>
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
                                <span>{}%</span>                        
                            </div>
                            <div class="regi_items_options_taken">
                                <span id="regi_stock_text">수량</span>
                                <input type="text" id="regi_stock_number" :value="item.pStock" size="1" readonly>
                                <button id="regi_giveBtn" @click="">선물하기</button>
                            </div>
                        </div>                
                        <!--받은선물인 경우-->
                        <div class="regi_items" v-if="item.orderNo != null">
                            <img :src="item.imgSrc" class="regi_items_image" v-if="item.tripNo == null">
                            <img :src="item.imgSrc" class="regi_items_image" v-if="item.productNo == null">                  
                            <p class="regi_pro_name">{{item.pName}}</p>
                            <p class="regi_pro_price">{{item.pPrice}} 원</p>
                            <div class="regi_items_options_taken">
                                <button id="regi_taken_gift" disabled>선물완료</button>
                            </div>
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
        
    	userId: ""    
    ,   registry: []
    ,	image: []
	, 	imgUrl1: ''
    ,   imgUrl2: ''
    }   
    , methods: {
        fnGetId: function(){
            var self = this;
            var originalUrl = window.location.href;
            var urlParameter = window.location.search;           
            var urlStr = originalUrl;           
            var url = new URL(urlStr);
            var urlParams = url.searchParams;         
            self.userId = urlParams.get('id'); 
            console.log(self.userId);
        }
    ,   fnselectUser: function(){
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
        
	,	fnGiveGift: function() {
			let popUrl = "/registryGift.do";
    		let popOption = "width = 500px, height=600px, top=300px, left=300px, scrollbars=no";
    		
    		window.open(popUrl, "옵션 설정", [popOption]);
		}
    }   
    , created: function () {
    	var self = this;
        self.fnGetId();
        self.fnselectUser();
        self.fnselectImage();
	}
});
</script>
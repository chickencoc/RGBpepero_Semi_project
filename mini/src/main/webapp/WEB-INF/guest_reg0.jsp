<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/layout/header.jsp"></jsp:include>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	<link rel="stylesheet" href="/css/myInfo_reg.css">
	<title>비회원용 페이지</title>
</head>

<body>
    <div id="app">
		<div class="regi_content">
        <main class="regi_main">
            <div class="regi_container">              
                <span id="regi_user">{{userName}} & {{registry.partner}}의 레지스트리</span>           
            </div>           
            <div class="regi_container">                
                <div class="regi_back_image_box" v-if="imgUrl1 != ''">
                	<img :src="imgUrl1" class="regi_back_image" >                               
                </div>    
                <div class="regi_back_image_box" v-if="imgUrl1 === ''" style="background-color: lightpink;">
                	<div class="regi_back_image" style="background-color: lightpink;"> </div>                            
                </div>    
                    <img :src="imgUrl2" id="regi_profile" v-if="imgUrl2 != ''">
                    <div id="regi_profile" v-if="imgUrl2 === ''" style="background-color: lightcoral;"></div>                      
            </div>
            <div class="regi_container">
                <div class="regi_select">
                    <select v-model="sortOp" @change="fnselectUser()">
                        <option value="R.R_CDATETIME DESC">최신순</option>
                        <option value="R.R_CDATETIME">오래된순</option>
                        <option value="TOTALPRICE">낮은 가격순</option>
                        <option value="TOTALPRICE DESC">높은 가격순</option>
                    </select>
                </div>             
                
                <div class="myinfo_registry boxshadowline" >

                    <div v-for="(item, index) in registry">                              
                        <div class="regi_items" v-if="item.orderNo == null">
                            <!--매우원함-->
	                        <div id="regi_wanted_badge" v-if="item.rOption == 'A'">
								 <img :src="item.imgSrc" class="regi_items_image">
							</div>
							<img :src="item.imgSrc" class="regi_items_image" v-if="item.rOption != 'A'">
                                <p class="regi_pro_name">{{item.pName}}</p>
                                <p class="regi_pro_price">{{item.pPrice}} 원</p>
                            <!--펀딩퍼센트-->
                            <div class="regi_percentage" v-if="item.fundYn == 'Y'">
                                <progress id="regi_progress" :value="item.progVal" max="100"></progress>
                                <span style="margin-left: 10px;">{{item.progVal}}%</span>                        
                            </div>
                            <div class="regi_items_options_taken" v-if="item.fundYn === 'N' || item.fundYn === null || item.fundYn === ''">
                                <span id="regi_stock_text2">수량</span>
                                <label id="regi_stock_number2">{{item.rCnt}}</label>
                                <button id="regi_giveBtn" class="btn1" @click="fnGiftBtn(item)">선물하기</button>
                            </div>
                            <div class="regi_items_options_taken" v-if="item.fundYn === 'Y'">
                                <span id="regi_stock_text2_fund">수량</span>
                                <label id="regi_stock_number2_fund">{{item.rCnt}}</label>
                                <button id="regi_giveBtn_fund" class="btn1" @click="fnGiftBtn(item)">선물하기</button>
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
        
        <!-- dim popup start -->
		   <div class="user-read">
		       <div class="dim-layer">
		         <div class="read_dim">
		         </div>
		       </div>
		        <!-- dim content -->
		        <div class="read-inner">
					
		            <div class="reg_options_popup">
						
						<img src="../image/icon/fi-sr-cross.png" @click="dimClose" class="dimClose" id="reg_option_popup_close">
						
		                <div class="reg_options_popup_imageBox">
							<img :src="item.imgSrc" id="reg_options_popup_image">
						</div>
		                <div class="reg_options_popup_info">
							
		                    <div id="reg_options_popup_name">상품 명 : {{item.pName}}</div>
		                    <div class="reg_options_popup_price">상품 가격 : {{item.pPrice}}원</div>
		                    <div>상품 수량 : <input type="number"  id="reg_options_popup_stock_number" size="1" v-model="item.rCnt" @keydown="fnCntCheck($event)"></div>
		                    <div class="reg_options_popup_price">합계 : {{item.pPrice * item.rCnt}}원</div>
		                </div>
		                <ul class="reg_options_popup_checkbox">
		                    <li id="reg_options_popup_checkbox_title">상품 표시 옵션</li>
		                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" > "정말 필요한 물건" 표시</li>
		                    <li id="reg_options_popup_checkbox" v-if="item.fundYn != 'Y'">
		                    	<input type="checkbox" name="choice" > "그룹선물(펀딩)"로 변경하기
		                    	<span style="font-size: 12px; color: orangered;">[설정시 일반으로 변경 불가, 삭제만 가능]</span>
		                    </li>
		                </ul>    
		                <div class="reg_options_popup_memo">
		                    <div><img src="../image/icon/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보</div>
		                    <label id="reg_options_popup_memo_txt" style="margin-top: 30px">{{item.rContent}}</label>
		                </div>
		                <button class="reg_options_popup_btn" @click="fnSendItem">선물하기</button>
		            </div>
				</div>
		        <!-- dim content -->
		   </div>
		   <!-- dim popup end -->
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
    ,   userName: ""
	, sortOp: 'R.R_CDATETIME DESC'
    // ,   progressValue : (item.fPutprice / item.fSetprice) * 100
    
    //dim popup
    , item: {}
    
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
        }
    ,   fnselectUser: function(){
    		var self = this;
            var nparmap = {userId: self.userId, sortOp : self.sortOp}; //select 요소를 kind 변수에담음. xml이랑 연결됨.
            $.ajax({
                url:"/myRegistry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {    
                    console.log(data);
                    for( i in data.registry) {
                    	data.registry[i].progVal = Math.round(data.registry[i].fputprice / data.registry[i].fsetprice * 100);
                    	if(isNaN(data.registry[i].progVal))
                    		data.registry[i].progVal = 0;
                    }
	                self.registry = data.registry;
                    self.userName= self.registry[0].uName;
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
                    }
                    else if(self.image[i].imgUsetype == 2){
                        self.imgUrl2 = self.image[i].imgSrc;
                    }
                    // Add more conditions for other image types if necessary
                }
            },
            error: function(xhr, textStatus, errorThrown) {
                console.error(textStatus);
            }
        });
    }
    , pageChange : function(url, param) {
		var target = "_self";
		if(param == undefined){
		//	this.linkCall(url);
			return;
		}
		var form = document.createElement("form"); 
		form.name = "dataform";
		form.action = url;
		form.method = "post";
		form.target = target;
		for(var name in param){
			var item = name;
			var val = "";
			if(param[name] instanceof Object){
				val = JSON.stringify(param[name]);
			} else {
				val = param[name];
			}
			var input = document.createElement("input");
    		input.type = "hidden";
    		input.name = item;
    		input.value = val;
    		form.insertBefore(input, null);
		}
		document.body.appendChild(form);
		form.submit();
		document.body.removeChild(form);
	}
    ,	fnGiftBtn: function(item){
		var self = this;
        localStorage.setItem('userItemList', JSON.stringify(item));

        self.fnselectOption();
		
       	$('.user-read').fadeIn().addClass('on');
	    $('.read-inner').fadeIn().addClass('on');
	    $("body").css("overflow", "hidden"); //body 스크롤바 없애기

	}
    	// dim popup script START
		//method
	 ,   fnselectOption: function(){
	         var self = this;
	         const userItemList = localStorage.getItem('userItemList');    
	         var item = JSON.parse(userItemList);                 
	         self.item = item;
	         console.log(item);
	       
	    }
    ,	fnCntCheck : function(item) {
    	console.log(item);
    }
	,	fnSendItem : function() {
	       var self = this;
	       self.item.totalprice = self.item.rCnt * self.item.pPrice;
			self.pageChange("/guest.do", self.item);
		}
	,	dimClose: function(){
			var self= this;
			 
			$('.user-read').fadeOut().removeClass('on');
			$('.read-inner').fadeOut().removeClass('on');
			$("body").css("overflow", "visible");
			localStorage.removeItem('userItemList');
			
			self.fnselectUser();
	  		self.fnselectImage();
	
	}
		// dim popup script END
    }
    , created: function () {
    	var self = this;
        self.fnGetId();
        self.fnselectUser();
        self.fnselectImage();
        
	}
});
</script>
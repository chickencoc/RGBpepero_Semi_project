<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="/layout/header.jsp"></jsp:include>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">	
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/myInfo_reg.css">
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	<title>회원 레지스트리</title>
	<style>
		/* 회원정보 상세 보기*/
		.dimClose {grid-area: header; width: 20px; height: 20px; position: relative; left: 525px; bottom: 8px;}
		.user-read {display: none; position: relative; z-index:1001;}
		.user-read.on {display: block;}
		.dim-layer {position: fixed; position: absolute;  top: 0;  left: 0; width: 100%;  height: 100%;  z-index: 1001;}
		.dim-layer .read_dim {position: absolute;  top: 0;  left: 0;  width: 100%; height: 100%; background: #000; opacity: .5; filter: alpha(opacity=50);}
		.read-inner {max-width: 600px; height: 700px; border-radius: 8px; background: #fff; display: grid; box-sizing: border-box; z-index: 1002; justify-items: center; place-items: center;
					position: fixed; margin: 0 auto; left: 0; right: 0;top: 50%; transform: translateY(-50%);padding: 25px}
	</style>
</head>
<body>
    <div id="app">  		
	    <div id="wrapper">	
			<div class="myinfo_category_list">
				<a href="information.do">회원정보</a>
				<a href="myRegistry.do"><strong>나의 레지스트리</strong></a>
				<a href="mygift.do">받은 선물 목록</a>
				<a href="returngoods.do">보낸답례품</a>
				<a href="main.do">캘린더</a>
			</div>  	
	        <div class="regi_content">
	        <main class="regi_main">
	            <div class="regi_container boxshadowline">               
	                <span id="regi_user">{{sessionName}}의 레지스트리</span>
	                <div class="regi_your_url">
	                    <h6 style="text-align: center;">당신의 레지스트리 주소</h6>
	                    <span id="regi_url">
	                    	{{myUrl}}
	                        <a href="#" @click="fnUrlCopy()"><img src="/image/icon/fi-ss-upload.png" id="regi_icon"></a>
	                        <span style="font-size: 9px;">주소복사</span>
	                    </span>
	                </div>
	            </div>           
	            <div class="regi_container">                
	                <div class="regi_back_image_box" v-if="imgUrl1 != ''">
	                    <button id="regi_back_image_button" @click="fnBackImageAlter(item)">배경사진 수정</button>
	                    <img :src="imgUrl1" class="regi_back_image">                                      
	                </div>
					<div class="regi_back_image_box" v-if="imgUrl1 === ''">
						<button id="regi_back_image_button" @click="fnBackImageAlter(item)">배경사진 수정</button>
						<div class="regi_back_image" style="background-color: lightpink;"> </div>                            
					</div>    
	                <img :src="imgUrl2" id="regi_profile" @click="fnProfileAlter(item)" v-if="imgUrl2 != ''">                       
	                <div id="regi_profile" @click="fnProfileAlter(item)" v-if="imgUrl2 === ''" style="background-color: lightcoral; text-align: center; display: flex;
						align-items: center; justify-content: center; color: #fff;">프로필 변경</div>                      
	            </div>
	            <div class="regi_container">
	                
	                <div class="regi_add_gifts" @click="fnProductPage">
	                    <img src="/image/icon/fi-sr-plus.png" id="regi_icon">
	                    <div>선물 추가하기</div>
	                </div>
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
	                        <div class="regi_items_options">
	                            <span id="regi_stock_text">수량</span>
	                            <label id="regi_stock_number">{{item.rCnt}}</label>
	                            <button id="regi_optionBtn" class="btn1" @click="fnOptionBtn(item)">옵션설정</button>
	                            <a id="regi_delete" @click="fnDeleteItem(item)">삭제하기</a>
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
		                    <div>상품 수량 : <input type="text" size="1" v-model="item.rCnt" id="reg_options_popup_stock_number"></div>
		                    <div class="reg_options_popup_price">합계 : {{item.pPrice * item.rCnt}}원</div>
		                </div>
		                <ul class="reg_options_popup_checkbox">
		                    <li id="reg_options_popup_checkbox_title">상품 표시 옵션</li>
		                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-bind:checked="inputWanted" v-on:change="updateWanted"> "정말 필요한 물건" 표시</li>                 
		                    <li id="reg_options_popup_checkbox" v-if="item.fundYn != 'Y'">
		                    	<input type="checkbox" name="choice" v-bind:checked="inputGroup" v-on:change="updateGroup"> "그룹선물(펀딩)"로 변경하기
		                    	<span style="font-size: 12px; color: orangered;">[설정시 일반으로 변경 불가, 삭제만 가능]</span>
		                    </li>
		                </ul>    
		                <div class="reg_options_popup_memo">
		                    <div><img src="../image/icon/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보를 기재해주세요</div>
		                    <input type="text" id="reg_options_popup_memo_txt" v-bind:value="inputText" v-on:input="updateInput">
		                </div>
		                <button class="reg_options_popup_btn" @click="fnOptionInput">저장하기</button>
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
		    sessionId: "${sessionId}"
		    , userId: "${sessionId}"
		    , sessionName : "${sessionName}"    
		    , registry: []
			, image: []
			, imgUrl1: ''
		    , imgUrl2: ''
		    , myUrl: 'http://localhost:8080/guestRegistry.do?id=${sessionId}'
		    , sortOp: 'R.R_CDATETIME DESC'
		    
		    //dim popup
		    , item: {}
		    , inputWanted: false
		    , inputGroup: false
		    , inputText: ''
		    , wanted: ''
		    , group: ''
	    }   
	    , methods: {
	    	
	    	fnselectUser: function(){
	    		var self = this;
	            var nparmap = {userId : self.userId, sortOp : self.sortOp}; //select 요소를 kind 변수에담음. xml이랑 연결됨.
	            $.ajax({
	                url:"/myRegistry.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) {    
	                    console.log(data.registry);   
	                    for( i in data.registry) {
	                    	data.registry[i].progVal = Math.round(data.registry[i].fputprice / data.registry[i].fsetprice * 100);
	                    	if(isNaN(data.registry[i].progVal))
	                    		data.registry[i].progVal = 0;
	                    }
		                self.registry = data.registry;
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
	    ,   fnUrlCopy : function() {	            
				var self = this;
				var copyTextarea = document.createElement('textarea');
				copyTextarea.value = self.myUrl; //myUrl을 밸류값으로 넣어줌.
				document.body.appendChild(copyTextarea);
				copyTextarea.select();
				document.execCommand('copy');
				document.body.removeChild(copyTextarea);
	    }
	    ,	fnBackImageAlter : function(item){
	            let popUrl = "/registryBackImg.do";
	            let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
				localStorage.setItem('userImgInfo', JSON.stringify(item));				
	    		let popup = window.open(popUrl, "배경이미지설정", [popOption]);
	    		popup.onbeforeunload = function() {
					localStorage.removeItem('userImgInfo');
	            	location.reload();
	            };
				
				
	    	}
	    	
	    ,	fnProfileAlter : function(item){
	            let popUrl = "/registryProfileImg.do";
	            let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
				localStorage.setItem('userImgInfo', JSON.stringify(item));
				let popup = window.open(popUrl, "프로필이미지설정", [popOption]);
	            popup.onbeforeunload = function() {
					localStorage.removeItem('userImgInfo');
	                location.reload();
	            };
	    	}
	    ,	fnOptionBtn: function(item){
	    		var self = this;
	            localStorage.setItem('userItemList', JSON.stringify(item));

		        self.fnselectOption();
				self.fnGetInformation();
	    		
	           	$('.user-read').fadeIn().addClass('on');
			    $('.read-inner').fadeIn().addClass('on');
			    $("body").css("overflow", "hidden"); //body 스크롤바 없애기

	    	}
	    ,	fnDeleteItem: function(thing){
	    		if(confirm("삭제하시겠습니까? \n\n* 펀딩 상품인 경우 펀딩이 종료됩니다.")) {
	                var nparmap = {registryNo: thing.registryNo
	                				,fundYn: thing.fundYn
	                				};
					$.ajax({
			                url:"/myRegistryDelete.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) {
			                	
			                }
			     	}); 
	    		}
				console.log(thing);
	    		
	    	}
	    ,	fnOrderInfo: function(){
	            window.loction.href="/myInfoGift9.do";
	    	}
	    ,	fnReview: function(){
	            window.loction.href= "/review.do";
	    	}
	    ,	fnProductPage: function(){
	    		window.location.href = "/bedroom.do";
	    	}
	    ,
	    
	    // dim popup script START
		//method
		     fnselectOption: function(){
	              var self = this;
	              const userItemList = localStorage.getItem('userItemList');    
	              var item = JSON.parse(userItemList);                 
	              self.item = item;
	              console.log(item);
	            
	         }
	    ,   updateWanted : function(event){
	            var self = this;
	            self.wanted = event.target.checked ? 'A' : '';
	             //체크시 배지
	        }
	    ,   updateGroup : function(event){
	            var self = this;
	            if(event.target.checked == true) {
	  	            if(confirm("정말 펀딩 항목으로 설정하시겠습니까? \n\n*변경한 상품은 일반 상품으로 되돌릴 수 없습니다.")) {
		            	self.group = event.target.checked ? 'Y' : '';
		            } else {
		            	event.target.checked = false;
		            }
	            }
	             //체크시 펀딩
	        }
	    ,	updateInput : function(event) {
	            var self = this;
	            self.inputText = event.target.value;
	             //텍스트 저장
	        }    
	    ,	fnOptionInput : function(){
	            var self = this;
	    		var nparmap = {
	                registryNo: self.item.registryNo,
					rOption: self.wanted, 
					fundYn: self.group, 
					rContent: self.inputText,
					rCnt: self.item.rCnt
	                
	            };
	                  $.ajax({
	                            url: "/registryOption.dox",
	                            type: "POST",
	                            dataType: "json",
	                            data: nparmap,
	                            success: function(response) {
	                                // 서버 응답을 처리하는 코드 작성
	                                alert("저장되었습니다.");
	                                self.dimClose();
	                            },
	                            error: function(xhr, textStatus, errorThrown) {
	                                // 오류 처리 코드 작성
	                                console.error(textStatus);
	                            }
	                        });
	                
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
	    ,   fnGetInformation : function() {
	            var self = this;
	            
				if(self.item.rOption == 'A'){
                	self.inputWanted = true;
            	}
            
            	if(self.item.fundYn == 'Y') {
                	self.inputGroup = true;
            	} 
	        }
	    // dim popup script END
	    
	    } 
	    , created : function () {
	    	var self = this;
	        self.fnselectUser();
	        self.fnselectImage();
		}
	});

	
	
</script>
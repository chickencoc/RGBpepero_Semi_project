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
		.dimClose {position:absolute; top: 30px; right:30px;}
		.user-read {display: none; position: relative; z-index:1001;}
		.user-read.on {display: block;}
		.dim-layer {position: fixed; _position: absolute;  top: 0;  left: 0; width: 100%;  height: 100%;  z-index: 1001;}
		.dim-layer .read_dim {position: absolute;  top: 0;  left: 0;  width: 100%; height: 100%; background: #000; opacity: .5; filter: alpha(opacity=50);}
		.read-inner {max-width: 600px; height: 700px; border-radius: 8px; background: #fff; display: inline-block; box-sizing: border-box; z-index: 1002;
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
	                <div class="regi_back_image_box">
	                    <button id="regi_back_image_button" @click="fnBackImageAlter()">배경사진 수정</button>
	                    <img :src="imgUrl1" class="regi_back_image" alt="이미지">                                      
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
	       <!-- dim popup start -->
		   <div class="user-read">
		       <div class="dim-layer">
		         <div class="read_dim">
		         </div>
		       </div>
		        <!-- dim content -->
		        <div class="read-inner">
		            <div class="reg_options_popup">
		                <div class="reg_options_popup_image">
		                </div>
		                <div class="reg_options_popup_info">
		                    <div id="reg_options_popup_name">{{item.pName}}</div>
		                    <div id="reg_options_popup_price">{{item.pPrice}}</div>
		                    <div>수량<input type="text" size="1" :value="item.rCnt" id="reg_options_popup_stock_number"></div>
		                </div>
		                <ul class="reg_options_popup_checkbox">
		                    <li id="reg_options_popup_checkbox">상품 표시 옵션</li>
		                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-bind:checked="inputWanted" v-on:change="updateWanted"> "정말 필요한 물건" 표시</li>                 
		                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-bind:checked="inputGroup" v-on:change="updateGroup"> "그룹선물(펀딩)"로 변경하기</li>
		                </ul>    
		                <div class="reg_options_popup_memo">
		                    <div><img src="/image/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보를 기재해주세요</div>
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
		    //dim popup
		    , item: []
		    , inputWanted: false
		    , inputGroup: false
		    , inputText: ''
		    , wanted: ''
		    , group: ''
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
	    		var self = this;
	            //localStorage.setItem('userItemList', JSON.stringify(item)); 
	            //console.log(item);		
	    		//let popUrl = "/registryOption.do";
	    		//let popOption = "width = 600px, height=700px, top=300px, left=300px, scrollbars=no";
	    		//let popup = window.open(popUrl, "옵션 설정", [popOption]);
	    		
	           	$('.user-read').fadeIn().addClass('on');
			    $('.read-inner').fadeIn().addClass('on');
			    $("body").css("overflow", "hidden"); //body 스크롤바 없애기

		        self.fnselectOption();
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
	    ,
	    
	    // dim popup script START
		    fnselectOption: function(){
	            var self = this;          
	            const userItemList = localStorage.getItem('userItemList');    
	            var item = JSON.parse(userItemList);                 
	            console.log(item);
	            self.item = item;
	            
	        }
	    ,    updateWanted : function(event){
	            var self = this;
	            self.wanted = event.target.checked ? 'A' : '';
	            console.log(self.wanted);
	             //체크시 배지
	        }
	    ,   updateGroup : function(event){
	            var self = this;
	            self.group = event.target.checked ? 'Y' : '';
	            console.log(self.group);
	             //체크시 펀딩
	        }
	    ,	updateInput : function(event) {
	            var self = this;
	            self.inputText = event.target.value;
	            console.log(self.inputText);
	             //텍스트 저장
	        }    
	    ,	fnOptionInput : function(){
	            var self = this;
	    		var nparmap = {
	                registryNo: self.item.registryNo,
	                rOption: self.wanted, 
	                fundYn: self.group, 
	                rContent: self.inputText,
	                
	            };
	                  $.ajax({
	                            url: "/registryOption.dox",
	                            type: "POST",
	                            dataType: "json",
	                            data: nparmap,
	                            success: function(response) {
	                                // 서버 응답을 처리하는 코드 작성
	                                alert("저장되었습니다.");
	                                console.log();
	                                // window.close();
	                            },
	                            error: function(xhr, textStatus, errorThrown) {
	                                // 오류 처리 코드 작성
	                                console.error(textStatus);
	                            }
	                        });
	                localStorage.removeItem('userItemList');
	                window.close();
	        },
	        fnGetInformation : function() {
	            var self = this;
	            
	            // inputWanted: false
	            
	            // self.
	            // inputGroup: false
	        }
	    // dim popup script END
	    
	    } //method
	    , created : function () {
	    	var self = this;
	        self.fnselectUser();
	        self.fnselectImage();      
		}
	});

	$(document).on("click", ".dimClose", function() {
	    $('.user-read').fadeOut().removeClass('on');
	    $('.read-inner').fadeOut().removeClass('on');
	    $("body").css("overflow", "visible"); //body 스크롤바 없애기
	});
	
</script>
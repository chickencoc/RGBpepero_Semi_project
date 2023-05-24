<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/prod4_sub0.css">
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	<title>상품 정보</title>
</head>
<body>
    <!-- wrap START -->
 <div id="app"> 
    <div id="wrapper">
        <div class="prodCategoryList">
            <ul>
            	<li class="prodCategoryList_li" v-for="(item, index) in catList" @click="fnChange(item.code)"><template v-if="item.code == pKind"><b>{{item.name}}</b></template><template v-else>{{item.name}}</template></li>
            </ul>
        </div>
        <div id="contentbox">
            <div id="prodboxtop" class="boxshadowline">
                <div id="imgbox">   
                	<img id="mainimg" class="boxshadowline" :src="list.imgSrc">
                </div>
                <div id="explainbox">
                    <div>상품명 : <span>{{list.pName}}</span></div>
                    <div>좋아요 : {{list.iLike}}</div>
                    <div>재고 :{{list.pSale}}</div>
                    <div>상품 가격 : {{list.pPrice}}</div>
                    <hr id="inner_line" class="div_line">
                    <div class="buttonbox">
                        <button class="btn1" @click="fnOptionBtn()" v-if="sessionId != ''">레지스트리 등록</button>
                        <button @click="fnMoveModifyProduct" v-if="sessStatus == 'S'">상품정보수정</button>
                    </div>
                </div>
                
            </div>
            <div class="prodcase boxshadowline">  <!-- 1s -->
	            <div id="prodboxbottom">
	                {{list.pContent}}
	            </div>
	            <hr class="div_line"></hr>
	            <!-- <h3>후기</h3>
	            <div id="reviewbox">
	                <div id="re_tb">
	                    <table id="review_table">
	                        <template>
	                        <tr>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td></td>
	                            <td><button>후기 수정</button></td>
	                        </tr>
	                        <tr>
	                            <td><img src=""></td>
	                            <td><img src=""></td>
	                            <td><img src=""></td>
	                            <td><img src=""></td>
	                            <td><img src=""></td>
	                        </tr>
	                        <tr>
	                            <td colspan="5"><div class="review_detail">
	                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
	                            </div></td>
	                        </tr>
	                        <tr>
	                            <td colspan="5"><hr class="div_line"></hr></td>
	                        </tr>
	                        </template>
	                    </table>
	            	</div>
	        	</div>  -->
        </div> <!-- 1e -->
    </div>
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
							
		                    <div id="reg_options_popup_name">{{item.pName}}</div>
		                    <div id="reg_options_popup_price">{{item.pPrice}} 원</div>
		                    <div>수량<input type="text" size="1" v-model="item.rCnt" id="reg_options_popup_stock_number"></div>
		                </div>
		                <ul class="reg_options_popup_checkbox">
		                    <li id="reg_options_popup_checkbox_title">상품 표시 옵션</li>
		                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-bind:checked="inputWanted" v-on:change="updateWanted"> "정말 필요한 물건" 표시</li>                 
		                    <li id="reg_options_popup_checkbox">
		                    	<input type="checkbox" name="choice" v-bind:checked="inputGroup" v-on:change="updateGroup"> "그룹선물(펀딩)"로 변경하기 
		                    	<span style="font-size: 12px; color: orangered;">[설정시 일반으로 변경 불가, 삭제만 가능]</span>
		                    </li>
		                </ul>    
		                <div class="reg_options_popup_memo">
		                    <div><img src="../image/icon/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보를 기재해주세요.</div>
		                    <input type="text" id="reg_options_popup_memo_txt" v-bind:value="inputText" v-on:input="updateInput">
		                </div>
		                <button class="reg_options_popup_btn btn1" @click="fnOptionInput">등록하기</button>
		            </div>
				</div>
		        <!-- dim content -->
		   </div>
		   <!-- dim popup end -->
 </div> 
    <!-- wrap END -->
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
        	productNo : "${map.productNo}"   
        	, sessStatus: "${sessionStatus}"
            , list : []
            , pKind : ""
            , catList : []
            , checkList : []
            , sessionId : "${sessionId}"
		     //dim popup
		    , item: {}
		    , inputWanted: false
		    , inputGroup: false
		    , inputText: ''
		    , wanted: ''
		    , group: 'N'
    
        }
    	, computed: {
			fnFundingNo : function() { //펀딩번호 생성 ( F + 2자리년도 + 월 + 일 + 시간 + 분 + 초 + 랜덤 3자리수 )
		        let date = new Date();
		        let num1 = "";
		        let arr = [date.getFullYear().toString().substring(2,4)
		                    , (date.getMonth() + 1).toString()
		                    , date.getDate().toString()
		                    , date.getHours().toString()
		                    , date.getMinutes().toString()
		                    , date.getSeconds().toString()
		                ];
		        for(var i in arr) { //년도부터 초까지 한자리 수이면 앞에 0 붙여줌
		            if(arr[i].length < 2) arr[i] = 0 + arr[i];
		            num1 += arr[i];
		        }
		        let num2 = Math.random();
		        num2 = num2.toString().substring(2,5); //랜덤 3자리 수 생성

		        return 'F' + num1 + num2;
			}
		}
        , methods: {
        	fnChange : function(code){
        		var self = this;
        		
        		self.keyword = "";
        		if(code == "W"){
        			location.href="/prod5Sub0.do";
        		}else if(code == "A"){
        			location.href="/triprecommend.do";
        		}else if(code == "B"){
        			location.href="/bedroom.do";
        		}else if(code == "L"){
        			location.href="/livingroom.do";
        		}else if(code == "D"){
        			location.href="/dressroom.do";
        		}else if(code == "K"){
        			location.href="/kitchen.do";
        		}else if(code == "V"){
        			location.href="/utilityroom.do";
        		}else if(code == "T"){
        			location.href="/toilet.do";
        		}else if(code == "H"){
        			location.href="/hobby.do";
        		}else{
        			location.href="/main.do";
        		}
        	},
        	fnGetCategoryList : function(){
	            var self = this;
	            var nparmap = {};
	            $.ajax({
	                url:"/categoryList.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.catList = data.code;
	                	}
	           		}); 
	        }
        	,
            fnProductInformation : function(){
                var self = this;
                var nparmap = {productNo : self.productNo};
                $.ajax({
                    url:"/producttemporaryinfo.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        self.list = data.list;
                        self.pKind = self.list.pKind;
                        console.log(self.list);
                    }
                }); 
            },
            fnMoveModifyProduct : function(){
        		var self = this;
        		self.pageChange("./productmodifytemporary.do", {productNo : self.productNo});
        	},
        	pageChange : function(url, param) {
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
			},
		    // dim popup script START
		    	fnOptionBtn: function(){
	    		var self = this;
	    		//const userItemList = localStorage.getItem('list');
	    		//var item = JSON.parse(userItemList);                 
	            //self.item = item;
            	self.inputGroup = false;
	           	$('.user-read').fadeIn().addClass('on');
			    $('.read-inner').fadeIn().addClass('on');
			    $("body").css("overflow", "hidden"); //body 스크롤바 없애기

		        self.fnselectOption();
				self.fnGetInformation();

			    console.log(self.item);
	    	}
			,   fnselectOption: function(){
		              var self = this;            
		              self.item = self.list;
		         }
		    ,   updateWanted : function(event){
		            var self = this;
		            self.wanted = event.target.checked ? 'A' : 'N';
		             //체크시 배지
		        }
		    ,   updateGroup : function(event){
		            var self = this;
		            self.group = event.target.checked ? 'Y' : 'N';
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
		    			userId : "${sessionId}",
	                	productNo : "${map.productNo}",
						rOption: self.wanted,
						fundYn: self.group,
						rContent: self.inputText,
						rCnt: self.item.rCnt,
						fsetprice : self.item.rCnt * self.item.pPrice,
						fundingNo : self.fnFundingNo
		            };
		    		console.log(nparmap);
	                  $.ajax({
	                            url: "/registryAdd.dox",
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
		            //self.fnProductInformation();
		            //self.fnGetCategoryList();

			}
		    ,   fnGetInformation : function() {
		            var self = this;
		            
					if(self.item.rOption === 'A'){
	                	self.inputWanted = true;
	            	}
	            
	            	if(self.item.fundYn === 'Y') {
	                	self.inputGroup = true;
	            	} 
		        }
		    // dim popup script END
        }   
        , created: function () {
            var self = this;
            self.fnProductInformation();
            self.fnGetCategoryList();
    
        }
    });
    </script>
</html>
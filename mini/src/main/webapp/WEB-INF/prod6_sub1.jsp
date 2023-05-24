<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	 <script defer src="./index.js"></script>
  	 <script
    defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD8S0aO9c84mo7FhiSQQGVDATPm_rt32Zw&callback=initMap"
  ></script>
	<title>여행지 상세 페이지</title>
    <style>
        .container{
          margin: auto;
            width: 1200px;
        }
        .product_category_list > a:not(:last-child):after {
        content: '';
        display: inline-block;
        width: 2px;
        height: 15px;
        background: #999;
        position: relative;
        top: 2px;
        margin-left: 13px;
       }
       .product_category_list > a {
        margin: 0 5px;
       }
       .product_category_list{
        text-align: center;
        margin-top: 10px;
        margin-bottom: 10px;
       }
        .container .travelBanner{
            text-align: center;
        }
        .container #travelBanner2{
            width: 1200px;
            height: 400px;
            margin-bottom: 30px;
        }
        #explane h1{
            font-size: 35px;
            text-align: center;
            margin-bottom: 50px;
        }
        #miniExplane h1{
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .picture1 #boracay{
           max-width: 1000px;
            max-height: 500px;
        }
        .container .picture1{
            text-align: center;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        .container hr{
            margin-bottom: 20px;
        }
        
        #api #box{
            width: 900px;
            height: 400px;
            border: 1px solid black;
            background-color: gray;
            text-align: center;
        }
        #api #apiExplane{
            margin-bottom: 20px;
        }
        #api #apiBox{
            text-align: center;
            margin-bottom: 40px;
            margin-left: 100px;
        }
        .fundingBtn button{
            border: 1px solid black;
            border-radius: 50px;
            padding: 20px 30px;
            background-color: black;
            color: white;
            margin-left: 510px;
        }
        .prodCategoryList {
        	height: 45px;
        	display: flex;
        	justify-content: center;
        	align-items: center;
        }
        .prodCategoryList li {
        	display: inline-block;
        	margin: 0 5px;
        }

        .prodCategoryList li:not(:last-child):after {
        	content: '';
        	display: inline-block;
        	width: 2px;
        	height: 15px;
        	background: #999;
        	position: relative;
        	top: 2px;
        	margin-left: 13px;
        }

        .prodCategoryList>li {
        	margin: 0 5px;
        }
        .adminBtn{
        	 text-align: right;
        }
        #reg_options_popup_stock_number {width: 150px;}

    </style>
</head>
<body>
<div id="app">
    <div id="wrapper">
        <div class="container">
			<div class="prodCategoryList">
				<ul>
					<li class="prodCategoryList_li" v-for="(item, index) in catList"
						@click="fnChange(item.code)"><template
							v-if="item.code == pKind">
							<b>{{item.name}}</b>
						</template>
						<template v-else>{{item.name}}</template></li>
				</ul>
			</div>
            <div class="travelBanner"><img :src="info.imgsrc" id="travelBanner2"></div>
            <div id="explane">
                <h1>{{info.tName}}</h1>
            </div>
            <div id="miniExplane">
                <h1 v-html="info.tContent">{{info.tContent}}</h1>
            </div>
            <template v-for="(item, index) in list">
	            <div class="picture1">
	                <img :src="item.imgsrc" id="boracay">
	            </div>
            </template>
            <hr>
            <div id="api">
                <div id="apiExplane">{{info.tAddr}}</div>
                <div id="apiBox">       
  					<div id="map" style="height: 600px;"></div>                   
                </div>
            </div>
            <hr>  
            <div class="fundingBtn">
                <button class="btn1" @click="fnTripFund()">펀딩레지스트리 등록</button>
            </div>
            <!-- dim popup start -->
		   <div class="user-read">
		       <div class="dim-layer">
		         <div class="read_dim">
		         </div>
		       </div>
		        <!-- dim content -->
		        <div class="read-inner">
					
		            <div class="reg_options_popup_guest">
						
						<img src="../image/icon/fi-sr-cross.png" @click="dimClose" class="dimClose" id="reg_option_popup_close">
						
		                <div class="reg_options_popup_imageBox">
							<img :src="item.imgSrc" id="reg_options_popup_image">
						</div>
		                <div class="reg_options_popup_info">
							
		                    <div id="reg_options_popup_name">펀딩 명 : <input type="text" id="reg_options_popup_stock_number" :value="item.productNo" maxlength="10"></div>
		                    <div class="reg_options_popup_price">펀딩 설정 가격 : <input type="number" placeholder="1,000,000"  id="reg_options_popup_stock_number" v-model="item.fsetprice" maxlength="8"></div>
		                    <div class="reg_options_popup_price">표시 가격 : {{(item.fsetprice || 0).toLocaleString()}}원</div>
		                </div>
		                <ul class="reg_options_popup_checkbox">
		                    <li id="reg_options_popup_checkbox_title">상품 표시 옵션</li>
		                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-model="item.rOption"> "정말 필요한 물건" 표시</li>
		                <div class="reg_options_popup_memo">
		                    <div><img src="../image/icon/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보를 기재해주세요</div>
		                    <input type="text" id="reg_options_popup_memo_txt" v-model="item.inputText" >
		                </div>
		                <button class="reg_options_popup_btn" @click="fnOptionInput">등록 하기</button>
		            </div>
				</div>
		        <!-- dim content -->
		   </div>
		   <!-- dim popup end -->
         </div>
     </div>
 </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
function initMap() {
	  // 지도 생성
	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 10,  // 지도 확대 레벨
	  });

	  // 검색한 나라의 이름
	  var country = app.tAddr;

	  // 지오코더 생성
	  var geocoder = new google.maps.Geocoder();

	  // 검색한 나라의 좌표 가져오기
	  geocoder.geocode({ 'address': country }, function(results, status) {
	    if (status === 'OK') {
	      if (results[0]) {
	        // 검색한 나라의 좌표
	        var countryLatLng = results[0].geometry.location;

	        // 지도의 중심을 검색한 나라의 좌표로 설정
	        map.setCenter(countryLatLng);
	      } else {
	        console.log('검색 결과가 없습니다.');
	      }
	    } else {
	      console.log('지오코딩에 실패했습니다. 상태: ' + status);
	    }
	  });
	}
var app = new Vue({ 
    el: '#app',
    data: {
    	catList : [],
        pKind : "A",
        tripNo : "${map.tripNo}",
        info:{},
        list:{},
    	status: "${sessionStatus}",
    	map : {},
    	ps : {},
    	marker : {},
    	markers : [],
    	tAddr:''
    	
   		//dim popup
   	    ,   item: {}
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
    	}
    	,fnGetCategoryList : function(){
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
    	,fnGetInfo : function(){
            var self = this;     
            var nparmap = {tripNo : self.tripNo,};
            $.ajax({
                url: "/tripView.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data)
                	self.info = data.info;
                	self.tAddr = data.info.tAddr;
                   initMap();

                   self.item.productNo = self.info.tName + " 여행";
                }
            }); 
        }
        ,fnGetImg : function(){
            var self = this;     
            var nparmap = {tripNo : self.tripNo};
            $.ajax({
                url: "/tripImg.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	console.log(data)
                	self.list = data.list;
                }
            }); 
        }
        ,	fnTripFund: function(){
    		var self = this;
            
           	$('.user-read').fadeIn().addClass('on');
    	    $('.read-inner').fadeIn().addClass('on');
    	    $("body").css("overflow", "hidden"); //body 스크롤바 없애기

    	}
     	// dim popup script START
		//method
		 ,   fnselectOption: function(){
		        var self = this;

		        console.log(item);
	    }
	    ,	fnOptionInput : function(){
	            var self = this;
	            if(self.item.rOption) {
	            	var rOption = "A";
	            } else {
	            	var rOption = "";
	            }
	            var fundingNo = self.fnFundingNo
 	    		var nparmap = {
 	    				tripNo : self.info.tripNo
 	    				, tripNo : self.item.productNo
 	    				, productNo : 0
 	    				, fsetprice : self.item.fsetprice
 	    				, inputText : self.item.inputText
 	    				, fundingNo : fundingNo
 	    				, userId : "${sessionId}"
 	    				, rCnt : 1
 	    				, rOption : rOption
 	    				, rContent : self.item.inputText
 	    				, fundYn : 'Y'
	           			};
	             $.ajax({
                      url: "/tripFundingAdd.dox",
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
	            console.log(nparmap);
        }
		,	dimClose: function(){
				var self= this;
				 
				$('.user-read').fadeOut().removeClass('on');
				$('.read-inner').fadeOut().removeClass('on');
				$("body").css("overflow", "visible");
				localStorage.removeItem('userItemList');
				
		}
		// dim popup script END
       
    }
    , created: function () {
    	var self = this;
    	self.fnGetCategoryList();
    	self.fnGetInfo();
    	self.fnGetImg();
	}
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<link rel="stylesheet" href="../css/prod5_sub0.css">
<!-- 페이징 추가 1-->
<script src="https://unpkg.com/vuejs-paginate@latest"></script>
<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
<title>예식장 페이지</title>
</head>
<body>
	<div id="app">
		<div id="wrapper1">
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
				<div class="banner_container">                   
					<div class="slidebox">
						<input type="radio" name="slide" id="slide1" checked>
						<input type="radio" name="slide" id="slide2">
						<input type="radio" name="slide" id="slide3">
						<input type="radio" name="slide" id="slide4">
						<ul class="slidelist">							
							<li class="slideitem">
								<div>
									<label for="slide4" class="left"></label>
									<label for="slide2" class="right"></label>
									<img src="../image/banner/wedding_banner1.jpg">
								</div>
							</li>
							<li class="slideitem">
								<div>
									<label for="slide1" class="left"></label>
									<label for="slide3" class="right"></label>
									<img src="../image/banner/wedding_banner2.jpg">
								</div>
							</li>
							<li class="slideitem">
								<div>
									<label for="slide2" class="left"></label>
									<label for="slide4" class="right"></label>
									<img src="../image/banner/wedding_banner3.jpg">
								</div>
							</li>
							<li class="slideitem">
								<div>
									<label for="slide3" class="left"></label>
									<label for="slide1" class="right"></label>
									<img src="../image/banner/wedding_banner4.jpg">
								</div>
							</li>
						</ul>
					</div>
				</div>
				
				<div class="weddingTitle">추천 웨딩홀</div>
				
				<div class="grid_Area1">
					<div class="imgBox1" id="grid_Area1_ImgBox1"
						v-for="(item, index) in getRandomItems(rList, 4)">
						<a href="javascript:;" @click="fnMoveUrl(item.wUrl)">
							<div>
								<img :src="item.imgsrc" id="weddingImg1">
							</div>
							<div id="grid_Area1_Name">{{item.wName}}</div>
						</a>
					</div>
				</div>
				<div class="options">
					<select v-model="wLocation">
						<option value="">::전체::</option>
						<option value="서울특별시">서울</option>
						<option value="경기도">경기도</option>
						<option value="강원도">강원도</option>
						<option value="경상도">경상도</option>
						<option value="전라도">전라도</option>
						<option value="충청도">충청도</option>
						<option value="인천광역시">인천</option>
						<option value="광주광역시">광주</option>
						<option value="대전광역시">대전</option>
						<option value="대구광역시">대구</option>
						<option value="울산광역시">울산</option>
						<option value="부산광역시">부산</option>
						<option value="제주도">제주도</option>
					</select>
					<div class="modifyButton">
						<button class="btn1" v-if="status=='S'" @click="fnAddWedding">예식장 추가하기</button>
					</div>
				</div>
				<div class="grid_Area2">
					<div class="imgBox2" v-for="(item, index) in list">
						<a href="javascript:;" @click="fnMoveUrl(item.wUrl)">
							<div>
								<img :src="item.imgsrc">
							</div>
							<div class="hall_Location">{{item.wLocation}}</div>
							<div class="hall_Name">{{item.wName}}</div>
						</a>
						<div class="btnBox" v-if="status=='S'">
							<button class="btn1" @click="fnRemoveWedding(item)">삭제하기</button>
							<button class="btn1" @click="fnEditWedding(item.weddingNo)">수정하기</button>
						</div>
					</div>

				</div>
				<template>
					<paginate :page-count="pageCount" :page-range="3" :margin-pages="2"
						:click-handler="fnSearch" :prev-text="'<'" :next-text="'>'"
						:container-class="'pagination'" :page-class="'page-item'">
					</paginate>
				</template>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
		list:[],
		selectPage: 1,
		pageCount: 1,
		cnt : 0,
		wLocation:'',
		rList:[],
		catList : [],
		pKind: 'W',
		status: "${sessionStatus}",
		
    }
    ,watch: {
    	 wLocation: function(newVal){
    		 var self = this;
			console.log(newVal);
			self.fnSearch(1);
    	}
	}
    , methods: {
    	fnGetList : function(){
            var self = this;
            self.fnSearch(1);
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 8);
    		var lastNum = (self.selectPage * 8)+1;
            var nparmap = {
    				startNum : startNum, 
    				lastNum : lastNum,
    				wLocation : self.wLocation,
    				pKind : self.pKind};
            $.ajax({
                url:"/prodSubWedding.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                    console.log(data);
                    self.cnt = data.cnt;
                    console.log(self.cnt);
                    self.pageCount = Math.ceil(self.cnt / 8);
                }
            }); 
        }
    	,fnGetRList : function(){
    		var self= this;
    		 var nparmap = {};
             $.ajax({
                 url:"/weddingRecommend.dox",
                 dataType:"json",	
                 type : "POST", 
                 data : nparmap,
                 success : function(data) { 
                 	self.rList = data.rList;
                     console.log(data);
                 }
             }); 
    	}
	    , fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 8);
			var lastNum = (pageNum * 8)+1;
			var nparmap = {startNum : startNum, 
    				lastNum : lastNum,
    				wLocation : self.wLocation,
    				pKind : self.pKind};
			$.ajax({
				url : "/prodSubWedding.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 8);
					console.log(data);
					}
				});
			}
	    , fnMoveUrl : function(wUrl){
	    	var self = this;
	    	window.open(wUrl, '_blank')
	    }
	    , getRandomItems(arr, count) {
	        // 배열을 복사하여 셔플
	        const shuffled = [...arr].sort(() => 0.5 - Math.random());
	        // count 개수만큼 잘라서 반환
	        return shuffled.slice(0, count);
	      }
	    ,fnChange : function(code){
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
	   ,fnAddWedding : function(){
		   location.href="prod5Sub1.do"
	   }
	   ,fnEditWedding : function(weddingNo){
		   var self = this;
			self.pageChange("prod5Sub2.do", {weddingNo : weddingNo});
	   }
	   ,fnRemoveWedding : function(item){
		   var self = this;
			var nparmap = item; //key 값을 보내야 한다.
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			$.ajax({
				url : "/removeWedding.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					alert("삭제되었습니다.");
					self.fnGetList();
				}
			});
	   }
	   
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();
    	self.fnGetRList();
    	self.fnGetCategoryList();
	}
});
</script>
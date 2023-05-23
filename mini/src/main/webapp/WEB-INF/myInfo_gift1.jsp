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
	<link rel="stylesheet" href="/css/myInfo_gift1.css">
	<!-- 페이징 추가 1-->
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>카드페이지</title>
</head>
<body>
    <div id="app">
        <div class="container">
			<div class="myinfo_category_list">
				<a href="information.do">회원정보</a>
				<a href="myRegistry.do">나의 레지스트리</a>
				<a href="mygift.do">받은 선물 목록</a>
				<a href="returngoods.do">보낸답례품</a>
				<a href="main.do">캘린더</a>
			</div>
            <div class="cardBox boxshadowline">
                <img class="mainCard" src="../image/categoryR/thankyou.jpg" alt="카드 메인 이미지">
            </div>
			<div id="cardTitle">감사장</div>
            
                <select name="" class="scroll" v-model="arrayOrder">
                    <option value="like">인기순</option>
                    <option value="P_PRICE">가격순</option>
                    <option value="P_CDATETIME">최신순</option>
                </select>
            
            <div class="cardImg_list" > <!-- 사진 전체 묶음 -->
                <div class="cardThumbnail"  v-for="(item, index) in list" :key="index">
                    <a href="javascript:;" @click=fnProdMove(item)>
                        <img class="card" :src="item.imgsrc" alt="">
                        <div class="cardList1">
                            <div>{{item.pName}}</div>
                            <div>{{(item.pPrice).toLocaleString()}}원</div>
                        </div>
                    </a>
                </div>   
            </div>
             <!-- 페이징 추가 3-->
			<template>
				<paginate
				   	:page-count="pageCount"
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				</paginate>
			</template>     
        </div>
    <!-- wrap END -->
    <!-- footer END -->
    </div>
</body>

</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 	
    el: '#app',
    data: {
		list :{},
		arrayOrder : 'P_CDATETIME',
		checkedBox : '${map.checkedBox}',
			<!-- 페이징 추가 5-->
		selectPage: 1,
		pageCount: 1,
		cnt : 0
    }
	,watch : {
		arrayOrder :function(){
			var self = this;
			self.fnGetList();
	}
}
    , methods: {
    	fnGetList : function(){
            var self = this;
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 6);
    		var lastNum = (self.selectPage * 6)+1;
            var nparmap = {keyword : self.keyword,
    				kind : self.selectItem, 
    				startNum : startNum, 
    				lastNum : lastNum,
    				arrayOrder : self.arrayOrder};
            $.ajax({
                url:"/myInfoGift1.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.list = data.list;
                    console.log(data);
                    self.cnt = data.cnt;
                    console.log(self.cnt);
                    self.pageCount = Math.ceil(self.cnt / 6);
                }
            }); 
        }
    <!-- 페이징 추가 7-->
	    , fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 6);
			var lastNum = (pageNum * 6)+1;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/myInfoGift1.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 6);
					console.log(data);
					}
				});
			}
	    , fnProdMove : function(item){
	    	var self = this;
	    	self.pageChange("/myInfoGift1Send.do", {product : item, checkedBox: self.checkedBox});
	    	
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
    }   
    , created: function () {
    	var self = this;
		self.fnGetList();
	}
});
</script>
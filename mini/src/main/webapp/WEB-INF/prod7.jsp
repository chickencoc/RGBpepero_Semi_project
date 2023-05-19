<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/prod0.css">
	<title>첫번째 페이지</title>
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<style>
	<!-- 페이징 추가 2-->
</style>
</head>

<body>
    <div id="app">
<div id="wrapper">
        <div class="container">
            <div class="prodCategoryList">
            <ul>
            	<li class="prodCategoryList_li" v-for="(item, index) in catList" @click="fnChange(item.code)"><template v-if="item.code == pKind"><b>{{item.name}}</b></template><template v-else>{{item.name}}</template></li>
            </ul>
            </div>
            <div class="prod0Banner">
                <img src="/image/prod0Banner.jpg" id="bannerImg">
                <div class="bannerText">
                    <p>취미</p>
                    <p>가제</p>
                </div>
            </div>
            <div class="searchBox">
               
                <input type="text" placeholder="상품명을 입력해주세요" class="searchBar search" v-model="keyword" @change="fnSearchProd">
                <button class="prodBtn searchM" @click="fnSearchProd">검색</button><button class="prodBtn cancelBtn searchR" @click="fnResetSearchProd">초기화</button>
            </div>
            <div class="prodSelectBox">
                <select id="prodArray" v-model="selectItem">
                    <option value="">::정렬::</option>
                    <option value="p">가격순</option>
                    <option value="i">인기순</option>
                    <option value="c">최신순</option>
                </select>
            </div>
            <div class="prodListBox">
                <div class="prodList" >
                        <div class="prodBox" v-for="(item, index) in list" @click="fnView(item.productNo)">
	                        <template v-if="item.imgSrc != null || item.imgSrc != ''">
	                        	<img :src="item.imgSrc" class="prod0Img">
	                        </template>
                            <div class="prodName">{{item.pName}}</div>
                            <div class="prodPrice">{{item.pPrice}}원</div>
                            <div class="prodLike">좋아요 : {{item.iLike}}<img src="/image/icon/Like.png" class="prodLikeImg"></div>
                        </div>
                </div>
            </div>
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
        selectPage: 1,
        pageCount: 1,
        cnt : 0,
        list : [],
        catList : [],
        pdImgList : [],
        pKind : "H",
        keyword : "${map.keyword}",
        selectItem : ""
    } 
	, watch : {
		selectItem : "fnGetProductList"
		, keyword : "fnSearchProd"
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
    	,
    	fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 6);
			var lastNum = (pageNum * 6)-1;
			var nparmap = {startNum : startNum, lastNum : lastNum , pKind : self.pKind, keywordType : self.selectItem};
			$.ajax({
				url : "/productList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.product;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 6);
					}
				});
			},
		fnSearchProd : function(){
				var self = this;
				self.fnGetProductList(); 
			},
		fnResetSearchProd : function(){
			var self = this;
			self.keyword = "";
			self.selectItem = "";
			self.fnGetProductList();
		},
        fnGetProductList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 6);
    		var lastNum = (self.selectPage * 6);
            var nparmap = {pKind : self.pKind ,startNum : startNum, lastNum : lastNum, keywordType : self.selectItem, keyword : self.keyword};
            $.ajax({
                url:"/productList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.product;
                    self.cnt = data.cnt;
                    self.pageCount = Math.ceil(self.cnt / 6);
                	}
           		}); 
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
			, fnView : function(productNo){
	    		var self = this;
	    		self.pageChange("./producttemporaryinfo.do", {productNo : productNo});
	    	}
			
    }   
    , created: function () {
        var self = this;
        self.fnGetCategoryList();
        self.fnGetProductList();
    }
});
</script>
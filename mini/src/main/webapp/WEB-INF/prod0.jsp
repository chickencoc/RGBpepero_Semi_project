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
	
</style>
</head>

<body>
    <div id="app">
<div id="wrapper">
        <div class="container">
            <div class="prodCategoryList">
            <ul>
            	<li class="prodCategoryList_li" v-for="(item, index) in catList" @click="fnChange(item.code, $event)">{{item.name}}</li>
            </ul>
            </div>
            <div class="prod0Banner">
                <img src="/image/banner1.jpg" id="bannerImg">
                <div class="bannerText">
                    <p>하루 중 가장 많은 시간을 보내는 곳</p>
                    <p>편안하고 아늑한 잠자리를 위하여</p>
                </div>
            </div>
            <div class="searchBox">
               
                <input type="text" placeholder="상품명을 입력해주세요" class="searchBar search">
                <button class="prodBtn searchM">검색</button><button class="prodBtn cancelBtn searchR">초기화</button>
            </div>
            <div class="prodSelectBox">
                <select id="prodArray">
                    <option value="">::정렬::</option>
                    <option value="price">가격순</option>
                    <option value="pop">인기순</option>
                    <option value="new">최신순</option>
                </select>
            </div>
            <div class="prodListBox">
                <div class="prodList" >
                        <div class="prodBox" v-for="(item, index) in list">
                        	<img :src="item.imgSrc" class="prod0Img">
                            <div class="prodName">{{item.pName}}</div>
                            <div class="prodPrice">{{item.pPrice}}원</div>
                            <div class="prodLike">좋아요 : {{item.iLike}}<img src="/image/Like.png" class="prodLikeImg"></div>
                        </div>
                </div>
            </div> 
            <div class="pageList">
                <input type="number" class="pageListNum" min="1"> <a href="">페이지로 이동</a>
                
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
        pKind : "K"
    }   
    , methods: {
    	fnChange : function(code, event){
    		var self = this;
    		
    		self.selectPage = 1;
    		self.pKind = code;
            self.fnGetProductList();
    	}
    	,
    	fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 6)+1;
			var lastNum = (pageNum * 6);
			var nparmap = {startNum : startNum, lastNum : lastNum , pKind : self.pKind};
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
        fnGetProductList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 6)+1;
    		var lastNum = (self.selectPage * 6);
            var nparmap = {pKind : self.pKind ,startNum : startNum, lastNum : lastNum};
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
			
    }   
    , created: function () {
        var self = this;
        self.fnGetProductList();
        self.fnGetCategoryList();
    }
});
</script>
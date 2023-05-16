<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<!-- 페이징 추가 1-->
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>여행지 추천</title>
    <style>
        .container{
            margin: auto;
            height: 1300px;
            width: 1200px;
            text-align:center;
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

        .container #tripText{
            font-size: 30px;
        }
        .container #travelBanner2{
            width: 1200px;
            height: 400px;
            margin-bottom: 30px;
        }
        .grid_Box1{
            background-color: #D9D9D9;
            width: 1200px;
            place-items: center;
            display: grid;
        	align-items: center;
   	 		justify-items: center;
   			grid-template-columns: repeat(3, 1fr); 
    		grid-gap:0;
            margin-top: 10px;
            margin-bottom:20px;
        }
        #search_Box{padding-top: 100px;}
        #search_Box img{height: 25px;width: 20px;}
        #search{
            text-align: center;
            margin-top: 20px;
        }
        #readingGlass{
            position: absolute;
            margin-left: 215px;
            margin-top: -27px;
        }
        #img1{
            width: 20px;
        }
        #boracay{
            width: 200px;
            height: 200px;
            margin-bottom: 10px;
        }
        .travel_Box{
            background-color: white;
            width: 325px;
            height: 325px;
            text-align: center;
            margin: 30px;
            padding-top: 40px;
        }
        .travel_Box img{ 
            width: 200px;
            height: 200px;
            margin-bottom: 10px;
        }
        #radioAndSelect{
            margin : 10px 20px;
        }
        #radioAndSelect #out_Travel{
            margin-right: 20px;
        }
        #radioAndSelect #in_Travel{
            margin-right: 20px;
        }
        #radioAndSelect select{
           width: 94px;
            margin-left: 10px;
        }
        #page{
            text-align: center;
            margin-top: 35px;
        }
        .pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
	.tripR{
	text-align:left;}
	.tripName{
	font-size:1.5em;}
	.prodCategoryList {height: 45px; display: flex; justify-content: center; align-items: center;}
.prodCategoryList li {display: inline-block; margin: 0 5px; } 
.prodCategoryList li:not(:last-child):after { content: ''; display: inline-block; width: 2px; height: 15px; background: #999; position: relative; top: 2px; margin-left: 13px; } 
.prodCategoryList > li { margin: 0 5px; } 

    </style>
</head>
<body>
<div id ="app">
    <div id="wrapper">
        <div class="container">
           
            <div class="prodCategoryList">
            <ul>
            	<li class="prodCategoryList_li" v-for="(item, index) in catList" @click="fnChange(item.code, $event)">{{item.name}}</li>
            </ul>
            </div>
            <div class="travelBanner"><img src="/image/travelBanner.jpg" id="travelBanner2"></div>
            <div class="tripR">
            <div id="tripText">여행지 추천</div>
	            <div id="radioAndSelect">
	                <label id="out_Travel"><input type="radio" name="tripKind" v-model="tKind" value="O"> 해외 </label>
	                <label id="in_Travel"><input type="radio" name="tripKind"v-model="tKind" value="I"> 국내 </label>
	             
	             </div>
             </div>   
            <div class="grid_Box1">
                <div id="search_Box" class="travel_Box">
                    <div>떠나고싶은 여행지</div>
                    <input id="search" type="text" placeholder="여행지 검색" v-model="tName" @keyup.enter="fnTripSearch">
                    <div id="readingGlass">
                    	<a href="javascript:;" @click="fnTripSearch">
                    		<img src="/image/tripsearch.png" id="img1">
                    	</a>
                    </div>
                </div>
                <div class="travel_Box" v-for="(item, index) in list">
                	<a href="javascript:;" @click="fnMove(item.tripNo)">
	                    <div>
	                       <img :src="item.imgsrc" id="boracay">
	                    </div>
	                    <div class="tripName">{{item.tName}}</div>
                    </a>
                </div>
            </div>
             <template class="pageList">
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
	list:{},
	tKind:'O',
	selectPage: 1,
	pageCount: 1,
	cnt : 0,
	tName:'',
	catList : [],
    pKind : "A"
	
    },watch: {
   		tKind: function(newVal){
			console.log(newVal);
			this.fnGetList()
 		}
	}   
    , methods: {
    	fnGetList : function(){
            var self = this;
            <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 5);
    		var lastNum = (self.selectPage * 5)+1;
            var nparmap = {
    				startNum : startNum, 
    				lastNum : lastNum,
    				tKind : self.tKind,
    				tName : self.tName,
    				pKind : self.pKind};
            $.ajax({
                url: "/tripRecommend.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
                    console.log(data);
                    self.cnt = data.cnt;
                    console.log(self.cnt);
                    self.pageCount = Math.ceil(self.cnt / 5);
                }
            }); 
        }
	    , fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 5);
			var lastNum = (pageNum * 5)+1;
			var nparmap = {startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "/tripRecommend.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 5);
					console.log(data);
				}
			});
		}
	    ,fnTripSearch : function(){
	    	var self = this;
	    	self.fnGetList();
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
	    ,fnMove:function(tripNo){
	    	var self = this;
	    	self.pageChange("/prod6Sub1.do", {tripNo : tripNo});
	    }
	    ,fnChange : function(code){
    		var self = this;
    		if(code == "W")
    			location.href="/weddingrecommend.do";
    			else
    				self.pageChange("/product.do", {kind : code});
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
    	self.fnGetList();
    	self.fnGetCategoryList();

	}
});
</script>
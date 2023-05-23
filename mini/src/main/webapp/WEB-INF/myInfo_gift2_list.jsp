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
	<link rel="stylesheet" href="/css/myInfo_gift2_list.css">
		<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>답례품 목록 페이지</title>
</head>
<style>
	/* <!-- 페이징 추가 2--> */
	.pagination {

        display: inline-flex;
        
    }
    ul {
        text-align: center;
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
</style>
<body>
    <div id="app">
	<div id="wrapper">
        <div class="return_gift_list_menu">
			<a href="information.do">회원정보</a>
			<a href="myRegistry.do">나의 레지스트리</a>
			<a href="mygift.do">받은 선물 목록</a>
			<a href="returngoods.do">보낸답례품</a>
			<a href="main.do">캘린더</a>
        </div>
        <div class="return_gift_content">       
        <main class="return_gift_main">              
            <div class="return_gift_container">
                <div id="return_gift_menu_txt">답례품</div>  
                <div class="return_gift_banner_container">                    
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
									<img src="../image/categoryR/returnBanner.jpg">
								</div>
							</li>
							<li class="slideitem">
								<div>
									<label for="slide1" class="left"></label>
									<label for="slide3" class="right"></label>
									<img src="../image/categoryR/returnBanner2.jpg">
								</div>
							</li>
							<li class="slideitem">
								<div>
									<label for="slide2" class="left"></label>
									<label for="slide4" class="right"></label>
									<img src="../image/categoryR/returnBanner3.jpg">
								</div>
							</li>
							<li class="slideitem">
								<div>
									<label for="slide3" class="left"></label>
									<label for="slide1" class="right"></label>
									<img src="../image/categoryR/returnBanner4.jpg">
								</div>
							</li>
						</ul>
					</div>
				</div>
                <div class="return_gift_search">
                    <input type="text" class="text1" id="return_gift_input_txt search" v-model="keyword" placeholer="상품명 입력" @keyup.enter="fnSearchList">
                    <button class="btn1" id="return_gift_searchBtn btn1 searchM" @click="fnSearchList">검색</button>
                    <button class="btn1" id="return_gift_resetBtn btn searchR">초기화</button>
                </div>
                <div class="return_gift_select">
                    <select class="return_gift_select_bar" v-model="arrayOrder">
						<option class="return_gift_select_option" value="P_CDATETIME">최신순</option>
                        <option class="return_gift_select_option" value="lowPrice">낮은가격순</option>
                        <option class="return_gift_select_option" value="highPrice">높은가격순</option>
                    </select>
                </div>
                
                    <div class="return_gift_listbox">
                        <div class="return_gift_list_item" v-for="(item, index) in list">
                            <div>
                                <a href="javascript:;" @click="fnSendMove(item)">
                                	<img class="return_gift_list_item_image" :src="item.imgsrc" >
                                </a>
                            </div>
                            <div class="return_gift_list_item_info">
                                <p class="return_gift_list_item_name">{{item.pName}}</p>
                                <p class="return_gift_list_item_price">{{item.pPrice}}</p>
                                <p class="return_gift_list_item_explain">{{item.pContent}}</p>
                            </div>
                        </div>
                    </div>
                    <div class="return_gift_pagechange">
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
                    </div>                  
            </div>                
        </main>
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
		list:{},
		arrayOrder : 'P_CDATETIME',
		checkedBox : '${map.checkedBox}',
		keyword:''
    }
	,watch : {
		arrayOrder :function(){
			var self = this;
			self.fnGetList();
		}
	}
    , methods: {
    	 fnSearch : function(pageNum){
 			var self = this;
 			self.selectPage = pageNum;
 			var startNum = ((pageNum-1) * 9);
 			var lastNum = (pageNum * 9)+1;
 			var nparmap = {startNum : startNum, lastNum : lastNum};
 			$.ajax({
 				url : "/myInfoGift1.dox",
 				dataType : "json",
 				type : "POST",
 				data : nparmap,
 				success : function(data) {
 					self.list = data.list;
 					self.cnt = data.cnt;
 					self.pageCount = Math.ceil(self.cnt / 9);
 					console.log(data);
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
	    ,fnGetList : function(){
	        var self = this;
	        <!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 9);
			var lastNum = (self.selectPage * 9)+1;
	        var nparmap = {keyword : self.keyword,
					kind : self.selectItem, 
					startNum : startNum, 
					lastNum : lastNum,
					arrayOrder : self.arrayOrder,
					keyword : self.keyword};
	        $.ajax({
	            url:"/myInfoGift2List.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {
	            	self.list = data.list;
	                console.log(data);
	                self.cnt = data.cnt;
	                console.log(self.cnt);
	                self.pageCount = Math.ceil(self.cnt / 9);
	            }
	        }); 
	    } 
	    , fnSendMove : function(item){
	    	var self = this;
	    	self.pageChange("/myInfoGift2Send.do", {product : item, checkedBox: self.checkedBox})
	    	
	    }
	    , fnSearchList : function(){
	    	var self = this;
	    	self.fnGetList();
	    }

    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();

	}
});
</script>
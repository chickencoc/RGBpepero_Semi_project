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
	<title>식장 페이지</title>
    <style>
        .container{
            margin: auto;
            height: 1400px;
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
       .weddingMain #mainWeddingImg{
        height: 400px;
        width: 97.5%;
       }
       .weddingMain{
        text-align: center;
       }
       .explaneBox1 .weddingRec{
        border: 1px solid black;
        background-color: black;
        width: 120px;
        height: 30px;
        margin-top: 10px;
        color: white;
        text-align: center;
        margin-left: 15px;
       }
        .imgBox1{
        border: 1px solid #D9D9D9;
        width: 270px;
        height: 220px;
        margin: 15px;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
    
       }
       .imgBox1 #weddingImg1{
        width: 190px;
        height: 150px;
        margin-top: 15px;
       }
       .options .produce{
        float: right;
       }
       .grid_Area2{
            display: grid;
            grid-template-columns: 300px 300px 300px 300px;
       }
       .grid_Area2 .imgBox2{
        border: 1px solid #D9D9D9;
        width: 270px;
        height: 270px;
        margin: 15px;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
       }
       .imgBox2 #weddingImg5{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .options{
       text-align:left;}
       .options .location{
        margin-left: 15px;
       }
       .options .produce{
        margin-right: 15px;
       }
       .container .page{
        text-align: center;
       }
      .modifyButton{
        text-align: right;
      }
      .modifyButton .modify{
        background-color: black;
        color: white;
        width: 100px;
        height: 40px;
      }
      .imgBox1 img{
        margin-bottom: 10px;
        filter: drop-shadow(3px 3px 3px #000);
        
      }
      .imgBox2 img{
        margin-bottom: 10px;
        filter: drop-shadow(3px 3px 3px #000);
      }
      .grid_Area1{
        display: grid;
        align-items: center;
    justify-items: center;
   	grid-template-columns: repeat(4, 1fr); 
    grid-gap:0;
      }
      
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
	.prodCategoryList {height: 45px; display: flex; justify-content: center; align-items: center;}
.prodCategoryList li {display: inline-block; margin: 0 5px; } 
.prodCategoryList li:not(:last-child):after { content: ''; display: inline-block; width: 2px; height: 15px; background: #999; position: relative; top: 2px; margin-left: 13px; } 
.prodCategoryList > li { margin: 0 5px; } 
 
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
            <div class="weddingMain">
                <img src="../image/mainWedding.jpg" id="mainWeddingImg">
            </div>
            <div class="explaneBox1">
                <div class="weddingRec">웨딩홀 추천</div>
            </div>
            <div class="grid_Area1">
                <div class="imgBox1" id="grid_Area1_ImgBox1" v-for="(item, index) in getRandomItems(rList, 4)">
                	<a href="javascript:;" @click="fnMoveUrl(item.wUrl)">
	                    <div><img :src="item.imgsrc" id="weddingImg1"></div>
	                    <div>{{item.wName}}</div>
                    </a>
                </div> 
            </div>
            <div class="options">
                <select class="location" v-model="wLocation">
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
                
            </div>
            <div class="grid_Area2">
                <div class="imgBox2" v-for="(item, index) in list">
                	<div v-if="status=='S'">
                		<button class="modify"  @click="fnRemoveWedding(item)">삭제하기</button>
                		 <button class="modify" @click="fnEditWedding">수정하기</button>
                	</div>
                	<a href="javascript:;" @click="fnMoveUrl(item.wUrl)">
	                    <div><img :src="item.imgsrc" id="weddingImg5"></div>
	                    <div class="hall_Location">{{item.wLocation}}</div>
	                    <div class="hall_Name">{{item.wName}}</div>
                    </a>
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
            <div class="modifyButton">
                <button class="modify" v-if="status=='S'" @click="fnAddWedding">추가하기</button>
               
                
            </div>
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
			console.log(newVal);
			this.fnGetList()
    	}
	}
    , methods: {
    	fnGetList : function(){
            var self = this;
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
			var nparmap = {startNum : startNum, lastNum : lastNum};
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
    		if(code == "A")
    			location.href="/triprecommend.do";
    			else
    				self.pageChange("/product.do", {kind : code});
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
	   ,fnEditWedding : function(){
		   var self = this;
			self.pageChange("/weddingModify.do", {weddingNo : self.weddingNo});
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
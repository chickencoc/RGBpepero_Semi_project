<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
    <link rel="stylesheet" href="/css/myInfo_gift2.css">
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>보낸 답례품</title>
</head>

<body>
    <div id="app">
    <div id="wrapper">
        <div class="container" id="app">
			<div class="myinfo_category_list">
				<a href="information.do">회원정보</a>
				<a href="myRegistry.do">나의 레지스트리</a>
				<a href="mygift.do">받은 선물 목록</a>
				<a href="returngoods.do"><strong>보낸답례품</strong></a>
				
			</div>  	
            <div class="returnSearchBox">
                <input type="text" placeholder="받은 사람 이름" class="returnSearchBar search" v-model="keyword" @click="fnKeyword()" @keyup.enter="fnKeyword">
                <button class="returnSearchBtn searchM">검색</button>
                <button class="returnSearchBtn searchR">초기화</button>
            </div>
            <fieldset class="returnProdTableBox">
                <legend class="returnProdTableTitle">보낸 답례품 목록</legend>
                <table class="returnProdTable">
                    <tr>
                        <th colspan="2">제품</th>
                        <th>받은 사람</th>
                        <th>수량</th>
                        <th>보낸 일자</th>
                        <th>상품 금액</th>
                    </tr>
                    <tr v-for="(item, productNo) in returnList">
                        <td rowspan="1" class="returnProdImgBox">
                            <img :src="item.imgSrc" class="returnProdImg">
                        </td>
                        <td class="returnProdNameBox">{{item.pName}}</td>
                        <td class="returnGuestNameBox" rowspan="1">
                            <div class="returnGuestNameBox2">
                            	<p>{{item.gName}}</p>
                            </div>
                        </td>
                        <td  rowspan="1" class="returnProdCntBox">1</td>
                        <td  rowspan="1" class="returnProdDateBox">{{item.cDatetime}}</td>
                        <td  rowspan="1" class="returnProdPriceBox">{{(item.pPrice).toLocaleString()}} 원</td>
                    </tr> 
                </table>
            </fieldset>
            <div class="page">
		            <template class="page">
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
        returnList : [],
		returnGuestList : [],
		userId : "${sessionId}",
		cnt : 0, //pagenation
		keyword: ''

    }
    , methods: {
        fnShowGuest : function(item){
           var self = this;
           item.guestFlg = !item.guestFlg;
           
        }
        ,fnKeywrod : function(){
        	var self = this;
        	self.fnGetReturnList();
        },
        fnGetReturnList : function(){
            var self = this;
            var startNum = ((self.selectPage-1) * 10);
            var nparmap = {userId : self.userId, keyword: self.keyword, startNum : startNum};
            $.ajax({
                url:"/returnList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.returnList = data.returnList;
                	console.log("returnList", self.returnList);
                	console.log("cnt", data.cnt);
                	
                	for(var i = 0; i < self.returnList.length; i++) {
                		self.returnGuestList.push({gName : self.returnList[i].gName});
                	}
                	//console.log("returnGuestList",self.returnGuestList);
                	                	
                	// pagenation cnt
                	self.cnt = data.cnt
                	self.pageCount = Math.ceil(self.cnt / 10);
                }
           	}); 
        }
        , fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 10);
			var nparmap = {userId : self.userId, keyword: self.keyword, startNum : startNum};
			$.ajax({
				url : "/returnList.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.returnList = data.returnList;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 10);
					}
				});
			}
        , fnKeyword : function() {
        	var self = this;
        	self.fnGetReturnList();
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
        self.fnGetReturnList();
    }
});
</script>
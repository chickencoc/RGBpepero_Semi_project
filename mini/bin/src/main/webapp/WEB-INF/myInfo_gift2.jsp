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
				<a href="main.do">캘린더</a>
			</div>  	
            <div class="returnSearchBox">
                <input type="text" placeholder="이름" class="returnSearchBar search">
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
                        <th>보낸 날짜</th>
                        <th>금액</th>
                    </tr>
                    <tr v-for="(item,index) in returnList">
                        <td rowspan="2" class="returnProdImgBox">
                            <img :src="item.imgSrc" class="returnProdImg">
                        </td>
                        <td class="returnProdNameBox">{{pName}}</td>
                        <td class="returnGuestNameBox" rowspan="2">
                            <div class="returnGuestNameBox2">
                                
                                <div @click.prevent="fnShowGuest()">
                                    <a href="" v-if="guestFlg">더 보기▼</a>
                                    <a href="" v-if="!guestFlg">접기▲</a>
                                </div>
                                <p>g_name</p>
                                <div v-if="!guestFlg">
                                    <p>{{gName}}</p>
                                </div>
                            </div>
                        </td>
                        <td  rowspan="2" class="returnProdCntBox">1개</td>
                        <td  rowspan="2" class="returnProdDateBox">cdatetime</td>
                        <td  rowspan="2" class="returnProdPriceBox">price</td>
                    </tr>
                    
                </table>
            </fieldset>
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
        guestFlg : true,
        selectPage: 1,
        pageCount: 1,
<<<<<<< HEAD
        cnt : 0,
        returnList : [],
		returnGuestList : []
		
    }   
=======
        cnt : 0
    }
>>>>>>> branch 'main' of https://github.com/chickencoc/RGBpepero_Semi_project.git
    , methods: {
        fnShowGuest : function(){
            var self = this;
            self.guestFlg=!self.guestFlg
        }
        ,fnSearch : function(){

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
    }   
    , created: function () {
        var self = this;
    }
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/myInfo_gift0.css">
	<script src="https://unpkg.com/vuejs-paginate@latest"></script>
	<script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
	<title>받은 선물 목록</title>
	<style>
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
</head>

<body>
    <div id="app">

        <div id="wrapper">
   			<div class="myinfo_category_list">
				<a href="information.do">회원정보</a>
				<a href="myRegistry.do">나의 레지스트리</a>
				<a href="mygift.do"><strong>받은 선물 목록</strong></a>
				<a href="returngoods.do">보낸답례품</a>
				<a href="main.do">캘린더</a>
			</div>
            <div class="itemSearchBox">
                <input class="itemSearchBar search" type="text" value="검색" v-model="pName" @keyup.enter="fnSearchGift"></input>
                        <button class="itemSearchBar searchM" @click=fnSearchGift>검색</button>
                        <button class="itemSearchBar searchR" @click=fnSearchReset>초기화</button>
                    <select name="" class="itemSearchBar slt1" v-model="arrayOrder">
                        <option value="O_CDATETIME">최신순</option>
                        <option value="PRICE">가격순</option>
                        <option value="funding">펀딩</option>
                    </select>
                    	<span class="listStyleBtns">
                    		<a href="javascript:;">
                        		<img class="listStyleImg" @click="fnChangeView($event)" src="/image/list1.jpg" alt="">
                        	</a>
                    	</span>
            </div>
            <div class="giftContentBox">
                <div class="profileBox">
                    <img src="/image/profile.png"> <!-- 프로필 이미지 -->
                    <div class="profileUid">ID : {{userId}}</div>
                </div>
                <!-- 그리드 스타일 -->
                <div class="giftListBox listStyle1" v-if="showFlg"> <!-- 리스트스타일1 전체 -->
                    <div class="giftDetailBox1">
                        <!-- 사진 전체 묶음 -->
                        <div class="giftDetail" v-for="(item, index) in list">
                            <img class="product" :src="item.imgsrc"> <!-- 받은 상품 이미지-->
                            <div class="giftList">
                                <div>제품명 : {{item.pName}}</div>
                                <div>선물해준 사람 : {{item.gName}}</div>
                                <div>선물 날짜 : {{item.oCdatetime}}</div>
                                <label><input @click="fnDivSelect($event)" class="none" name="gifts" type="checkbox" v-model="checkedBox" value="1">상품선물</label>
                            </div>
                        </div>
                    </div>
                    <div class="pagenation">
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
                        <div class="returnGiftBtnBox">
                            <button class="btn1">답례품 보내기</button>
                            <button class="btn1">카드 작성하기</button>
                        </div>    
                    </div>
                </div> <!-- 그리드 스타일 end -->

                <!-- 리스트 스타일-->
                <div class="giftListBox listStyle2" v-if="!showFlg">
                     <!-- 사진 전체 묶음 -->
                    <table class="giftDetailBox2">
                        <tr class="giftDetailHead">
                            <th>
                                <input type="checkbox" name="gifts" @click="fnCheckAll()">
                            </th>
                            <th colspan="2">받은 선물 내용</th>
                            <th><img class="fundingImg" src="/image/funding.PNG">펀딩</th>
                            <th>수량</th>
                            <th>선물 날짜</th>
                            <th>금액</th>
                        </tr>
                        <!-- 받은 상품 -->
                        <tr class="giftDetailList" v-for="(item, index) in list">
                            <td class="giftDetailList_check">
                                <input type="checkbox" name="gifts" @click="fnCheckBoxChk()" v-model="checkedBox" value="1"  v-bind:value="item">
                            </td>
                            <td class="giftDetailList_img">
                                <img :src="item.imgsrc">
                            </td>
                            <td class="giftDetailList_text">
                                <div class="giftDetailList_Info">
                                    <div class="giftName">받은선물 : {{item.pName}} </div>
                                    <div class="giftSender">보낸사람 : {{item.gName}} </div>
                                </div>
                                <div class="giftContent">{{item.pContent}}</div>
                            </td>
                            <td class="giftDetailList_fund">펀딩</td>
                            <td class="giftDetailList_cnt">{{item.oCnt}} 개</td>
                            <td class="giftDetailList_date">{{item.oCdatetime}}</td>
                            <td class="giftDetailList_price">{{item.price}}원</td>
                        </tr>
                        
                    </table>

                    <div class="pagenation">
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
                        <div class="returnGiftBtnBox">
                            <button class="btn1" @click="fnSendReturn">답례품 보내기</button>
                            <button class="btn1" @click="fnSendCard">카드 작성하기</button>
                        </div>    
                    </div>
                </div> <!-- 리스트 스타일 end -->
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
		showFlg : true,   
		name:'',
		checkedBox : [],
        giftItems : [], //v-for="(item, index) in giftItems"
        list:{},
        userId:"${sessionId}",
        arrayOrder:'O_CDATETIME',
        pName:'',
        selectPage: 1,
    	pageCount: 1,
    	cnt : 0,
    }
	,watch : {
		arrayOrder :function(){
			var self = this;
			self.fnGetList();
		}
	}
    , methods: {
        // 목록 스타일 변경
    	fnChangeView : function(item){
    		var self = this;
    		self.showFlg = !self.showFlg;
            self.checkedBox = [];
            if(item.target.src.includes("t1"))
                item.target.src = "/image/list2.jpg";
            else
                item.target.src = "/image/list1.jpg";
    	},
        fnDivSelect : function(item) {
            var self = this;
            item.target.parentNode.parentNode.parentNode.classList.toggle("divBackgroundChange");
        },
        // 리스트 스타일 체크박스 전체 선택 on/off
    	fnCheckAll : function(){
            var self = this;
            $("input[name=gifts]:gt(0)").each(function(index, gifts) {
                gifts.checked = $("input[name=gifts]:eq(0)").prop("checked");
            });
    	},
        fnCheckBoxChk : function(){
            $("input[name=gifts]:eq(0)").prop("checked", false);
    	},
        fnSendCard : function() {
            // location.href
        }
        ,fnGetList : function() {
			var self = this;
			var startNum = ((self.selectPage-1) * 6);
    		var lastNum = (self.selectPage * 6)+1;
			var nparmap = {userId : self.userId, 
					arrayOrder : self.arrayOrder,
					pName : self.pName,
					startNum : startNum, 
    				lastNum : lastNum
					};
			
			$.ajax({
				url : "/myInfoGift0.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					console.log(self.list);
					 self.pageCount = Math.ceil(self.cnt / 6);
				}
			});
		}
		 , fnSearch : function(pageNum){
				var self = this;
				self.selectPage = pageNum;
				var startNum = ((pageNum-1) * 6);
				var lastNum = (pageNum * 6)+1;
				var nparmap = {startNum : startNum, lastNum : lastNum};
				$.ajax({
					url : "/tripRecommend.dox",
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
        ,fnSearchGift : function(){
        	var self = this;
        	self.fnGetList();
        }
        ,fnSearchReset : function(){
        	var self = this;
        	self.pName = ''
        }
        ,fnSendCard : function(){
        	var self = this;
        	if(self.checkedBox==''){
        		alert("보낼 사람을 선택해주세요.")
        	} else{
	    	self.pageChange("/myInfoGift1.do", {checkedBox : self.checkedBox});
        	}
        }
        ,fnSendReturn : function() {
        	var self=this;
        	if(self.checkedBox==''){
        		alert("보낼 사람을 선택해주세요.")
        	} else{
            // location.href
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
    }
    , created: function () {
    	var self = this;
		self.fnGetList();
	}
});
</script>
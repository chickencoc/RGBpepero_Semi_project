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
	<title>받은 선물 목록</title>
</head>

<body>
    <div id="app">

        <div id="wrapper">
            <div class="itemSearchBox">
                <input class="itemSearchBar search" type="text" value="검색"></input>
                        <button class="itemSearchBar searchM">검색</button>
                        <button class="itemSearchBar searchR">초기화</button>
                    <select name="" class="itemSearchBar slt1">
                        <option value="price">가격순</option>
                        <option value="newest">최신순</option>
                        <option value="funding">펀딩</option>
                        <option value="productGift">상품 선물</option>
                    </select>
                    <span class="listStyleBtns">
                        <img class="listStyleImg" @click="fnChangeView($event)" src="/image/list1.jpg" alt="">
                    </span>
            </div>
            <div class="giftContentBox">
                <div class="profileBox">
                    <img src="/image/profile.png"> <!-- 프로필 이미지 -->
                    <div class="profileUid">ID : test123</div>
                </div>
                <!-- 그리드 스타일 -->
                <div class="giftListBox listStyle1" v-if="showFlg"> <!-- 리스트스타일1 전체 -->
                    <div class="giftDetailBox1">
                        <!-- 사진 전체 묶음 -->
                        <div class="giftDetail">
                            <img class="product" src="/image/cup.jpg"> <!-- 받은 상품 이미지-->
                            <div class="giftList">
                                <div>제품명 : pdName</div>
                                <div>선물해준 사람 : gName</div>
                                <div>받은 날짜 : date</div>
                                <label><input @click="fnDivSelect($event)" class="none" name="gifts" type="checkbox" v-model="checkedBox" value="1">상품선물</label>
                            </div>
                        </div>
 
                    </div>

                    <div class="pagenation">
                        <div class="arrowBox">
                            <img class="arrow1" src="/image/arrowLeft.jpg" alt="">
                            <span class="pageNumber">1</span>
                            <img class="arrow2" src="/image/arrowRight.jpg" alt="">
                        </div>
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
                            <th>받은 날짜</th>
                            <th>금액</th>
                        </tr>
                        <!-- 받은 상품 -->
                        <tr class="giftDetailList">
                            <td class="giftDetailList_check">
                                <input type="checkbox" name="gifts" @click="fnCheckBoxChk()" v-model="checkedBox" value="1">
                            </td>
                            <td class="giftDetailList_img">
                                <img src="/image/cup.jpg">
                            </td>
                            <td class="giftDetailList_text">
                                <div class="giftDetailList_Info">
                                    <div class="giftName">받은선물 : pdName </div>
                                    <div class="giftSender">보낸사람 : gName </div>
                                </div>
                                <div class="giftContent">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                            </td>
                            <td class="giftDetailList_fund">펀딩</td>
                            <td class="giftDetailList_cnt">cnt 개</td>
                            <td class="giftDetailList_date">date</td>
                            <td class="giftDetailList_price">pdPrice 원</td>
                        </tr>
                        <tr class="giftDetailList">
                            <td class="giftDetailList_check">
                                <input type="checkbox" name="gifts" @click="fnCheckBoxChk()" v-model="checkedBox" value="1">
                            </td>
                            <td class="giftDetailList_img">
                                <img src="/image/cup.jpg">
                            </td>
                            <td class="giftDetailList_text">
                                <div class="giftDetailList_Info">
                                    <div class="giftName">받은선물 : pdName </div>
                                    <div class="giftSender">보낸사람 : gName </div>
                                </div>
                                <div class="giftContent">이 컵은 아기자기하고 신혼부부들이 많이 사용합니다.</div>
                            </td>
                            <td class="giftDetailList_fund">펀딩</td>
                            <td class="giftDetailList_cnt">cnt 개</td>
                            <td class="giftDetailList_date">date</td>
                            <td class="giftDetailList_price">pdPrice 원</td>
                        </tr>
                    </table>

                    <div class="pagenation">
                        <div class="arrowBox">
                            <img class="arrow1" src="/image/arrowLeft.jpg" alt="">
                            <span class="pageNumber">1</span>
                            <img class="arrow2" src="/image/arrowRight.jpg" alt="">
                        </div>
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
var app = new Vue({ 
    el: '#app',
    data: {
		showFlg : true,
		name:'',
		checkedBox : [],
        giftItems : [] //v-for="(item, index) in giftItems"
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
        fnSendReturn : function() {
            // location.href
        },
        fnSendCard : function() {
            // location.href
        }

    }
    , created: function () {
    	var self = this;

	}
});
</script>
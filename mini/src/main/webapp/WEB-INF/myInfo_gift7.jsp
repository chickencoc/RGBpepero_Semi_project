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
	<link rel="stylesheet" href="/css/myInfo_gift7.css">
	<title>주문 상세 내역 / 배송 조회 페이지</title>
</head>

<body>
    <div id="app">
	<div class="container">
            <div class="wrapper">
                <h6 class="pay_title">결제 상세 내역</h6>
                <h6 class="pay_title2">결제가 완료되었습니다!</h6>
                <fieldset class="info_box goods_info receive_box" style="border-top: 2px dotted black;">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">상품 정보</h4>
                    </legend>
                    <table class="info_box_goods_table">     
                        <tr>
                            <th colspan="3">　</th>
                            <th class="tableTitle">수량</th>
                            <th class="tableTitle">금액</th>
                        </tr>   
                        <tr >
                            <td class="tableCheckbox" style="font-size: 10px; color: #555">●</td>
                            <td class="info_box_goods_table_img tableContent" ><img :src="info.imgSrc" class="info_box_goods_img"></td>
                            <td class="info_box_goods_table_text">{{info.pName}}{{info.pContent}}</td>
                            <td class="info_box_goods_table_cnt_price tableContent">{{info.rCnt}}개</td>
                            <td class="tableContent" v-if="info.fundYn == 'N'">{{info.pPrice}}원</td>
                            <td class="tableContent" v-else>{{info.givePrice}}원</td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="info_box receive_box" style="margin-top: 40px; border-top: 2px dotted black;">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">주문금액</h4>
                    </legend>
                    <div class="orderInfoBox">
                        <table class="orderInfoTable">
                            <tr>
                                <td class="orderInfoTitle">결제방법</td>
                                <td>카드</td>
                            </tr>
                            <tr>
                                <td class="orderInfoTitle">상품금액</td>
                                <td v-if="info.fundYn == 'N'">{{info.pPrice}}원</td>
                                <td v-else>{{info.givePrice}}원</td>
                            </tr>
                      
                            <tr>
                                <td class="orderInfoTitle">총 금액</td>
                                <td v-if="info.fundYn == 'N'">{{info.pPrice}}원</td>
                                <td v-else>{{info.givePrice}}원</td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
                <div class="purchaseBtnBox" style="margin-top: 0px; border-bottom: 2px dotted black;">
                   <button class="purchaseBtn btn1" @click="fnGoBack">레지스트리로 이동</button>
                    <button class="purchaseBtn btn1" @click="fnMain">메인으로 이동</button>
                </div>
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
    	info : {},
    	product : [],
    	userList : {}
    	
    	/* deliveryNo : "${sessionDeliveryNo}",
    	orderNo : "${sessionOrderNo}" */
    }
	
    , methods: {
    	fnGetInfo : function() {
			var self = this;
			var nparmap = {};
			$.ajax({
				url : "/guest/getItem.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.info = data.item;
					self.info.givePrice = data.givePrice;
					console.log(self.info);
					self.fnGetUserInfo();
				}
			});
		},
		fnGetUserInfo : function() {
			var self = this;
			var nparmap = {userId : self.info.userId};
			$.ajax({
				url : "/guest/userInfo.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.userList = data.info;
					console.log(self.userList);
				}
			});
		},
		fnGoBack : function(){
			var self =this;
			location.href="guestRegistry.do" + "?id=" + self.info.userId
		},
		fnMain : function(){
			var self = this;
			location.href="main.do"
		}
    }   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
    	
	}
});
</script>
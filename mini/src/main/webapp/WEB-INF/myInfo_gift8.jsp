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
<link rel="stylesheet" href="/css/myInfo_gift8.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<title>카드, 답례품 결제 페이지</title>
</head>

<body>
	<div id="app">
		<div class="container">
			<div class="wrapper">
				<h6 class="pay_title">답례품 주문</h6>
				<fieldset class="info_box goods_info receive_box">
					<legend class="info_box_name_legend">
						<h4 class="info_box_name_h">상품 정보</h4>
					</legend>
					<table class="info_box_goods_table">
						<tr>
							<td colspan="2"></td>
							<td class="tableTitle">수량</td>
							<td class="tableTitle">개당 금액</td>
						</tr>
						<template>
							<tr>
								<td class="info_box_goods_table_img tableContent" rowspan="2">
									<img class="info_box_goods_img" :src="product.imgsrc">
								</td>
								<td class="info_box_goods_table_text">{{product.pName}}</td>
								<td class="info_box_goods_table_cnt_price tableContent" rowspan="2">
									<input type="number" v-model="oCnt" min="1" class="text1 cntText">개</td>
								<td rowspan="2" class="tableContent">{{product.pPrice}} 원</td>
							</tr>
							<tr>
								<td class="info_box_goods_table_text">{{product.pContent}}</td>
							</tr>
						</template>
					</table>
				</fieldset>
				<fieldset class="info_box payer_info delivey_info destinationBox">
					<legend class="info_box_name_legend">
						<h4 class="info_box_name_h">배송지 정보</h4>
					</legend>
					<fieldset class="destinationInfoBox" v-for="(item, index) in checkedBox">
						<legend class="info_box_name_legend_destination">
							<!--background-color를 주변 색깔에 맞춰 변경해야함-->
							<p class="destinationRecipient">수령인 {{index+1}}: {{item.gName}}</p>
						</legend>
						<table class="destinationTable">
							<tr>
								<td class="destinationInfo">연락처</td>
								<td class="destinationTextBox"><input type="text"
									class="destinationText text1" v-model="item.gPhone"></td>
							</tr>
							<tr>
								<td class="destinationInfo">배송지</td>
								<td class="destinationTextBox">
									<input type="text" class="destinationText text1" 
									v-model="item.gAddrNo+item.gAddr1+item.gAddr2">
								</td>
							</tr>
						</table>
					</fieldset>
				</fieldset>
				<div class="wrapper">
					<fieldset class="pay_box">
						<div class="pay_info_box">
							<h4 class="pay_info_box_name_h">결제 수단</h4>
							<div class="pay_info_box_btns">
								<label for="pay_info_box_radio_a">
									<input id="pay_info_box_radio_a" type="radio" name="pay" checked v-model="purchase" value="A" disabled> 계좌이체
								</label> 
								<label for="pay_info_box_radio_b">
									<input id="pay_info_box_radio_b" type="radio" name="pay" v-model="purchase" value="B" disabled> 간편결제
								</label> 
								<label for="pay_info_box_radio_c">
									<input id="pay_info_box_radio_c" type="radio" name="pay" v-model="purchase" value="C"> 카드결제
								</label>
							</div>
						</div>
						<div class="pay_total_price_box">
							<div class="pay_total_price_box_detail">
								<div>
									<p>상품 금액 :</p>
									<p>{{(product.pPrice*checkedBox.length*oCnt).toLocaleString()}} 원</p>
								</div>
								<div>
									<p>배송비 :</p>
									<p>무료배송</p>
								</div>
							</div>
							<h4 class="pay_total_price_box_name_h">결제 금액</h4>
							<h4 class="pay_total_price_box_name_h">{{(product.pPrice*checkedBox.length*oCnt).toLocaleString()}} 원</h4>
						</div>
					</fieldset>
					<div class="pay_btn_box">
						<button class="pay_btn btn1" type="button" @click="requestPay()">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
IMP.init("imp55171728");
	var app = new Vue({
		el : '#app',
		data : {
			product : [],
	    	userId : "${sessionId}",
	    	checkedBox : [],
	    	purchase : 'C',
	    	oCnt : 1,
			gPhoneO : {}
		}
	, computed: {
		fnOrderNo : function() { //주문번호 생성 ( O + 2자리년도 + 월 + 일 + 시간 + 분 + 초 + 랜덤 3자리수 )
	        let date = new Date();
	        let num1 = "";
	        let arr = [date.getFullYear().toString().substring(2,4)
	                    , (date.getMonth() + 1).toString()
	                    , date.getDate().toString()
	                    , date.getHours().toString()
	                    , date.getMinutes().toString()
	                    , date.getSeconds().toString()
	                ];
	        for(var i in arr) { //년도부터 초까지 한자리 수이면 앞에 0 붙여줌
	            if(arr[i].length < 2) arr[i] = 0 + arr[i];
	            num1 += arr[i];
	        }
	        let num2 = Math.random();
	        num2 = num2.toString().substring(2,5); //랜덤 3자리 수 생성

	        return 'O' + num1 + num2;
		}
	}
	, methods : {
			fnGetInfo:function(){
				var self = this;
				console.log(self.checkedBox)
				console.log(self.product)
				for(var i=0; i<self.checkedBox.length; i++){
					var item=self.checkedBox[i];
					var gPhone = item.gPhone;
					self.gPhoneO[i]=gPhone;
					console.log(self.gPhoneO);
				}
			}
			,requestPay: function () { //결제창
				var self = this;
				var orderno = self.fnOrderNo;
				console.log(orderno);
				IMP.request_pay({ // param
		          pg : "kcp.{test}",
		          merchant_uid : orderno,
		          name : self.product.pName,
		          amount : self.product.pPrice*self.checkedBox.length*self.oCnt,
		          buyer_email : "gildong@gmail.com",
		          buyer_name : "홍길동",
		          buyer_tel : "010-4242-4242",
		          buyer_addr : "서울특별시 강남구 신사동",
		          buyer_postcode : "01181"
		        }, rsp => { // callback
	                if (rsp.success) {
	                	self.fnOrder(orderno);
	                } else {
	                    console.log(rsp);
	                }
		        });
		      }
			,fnOrder : function(orderno) {
				var self = this;
				var nparmap = {}
				for(var i=0; i<self.checkedBox.length; i++){
					nparmap = {
						gPhone: self.gPhoneO[i]
						, userId : self.userId
						, gPhone : self.checkedBox.gPhone
						, productNo : self.product.productNo 
						, orderNo : orderno
						};
	        	$.ajax({
	    			url : "/addGiftOrder.dox",
	    			dataType : "json",
	    			type : "POST",
	    			data : nparmap,
	    			success : function(data) {
	    				if(data.result == "success"){
	    					alert(data.result);
	    					// location.href="/main.do"
	    					}
	    				}
	    			});
				}
			}
			
		},
		created : function() {
			var self = this;
			self.checkedBox = JSON.parse('${map.checkedBox}');
			self.product = JSON.parse('${map.product}');
			self.fnGetInfo();

		}
	});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/headerLogo.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<link rel="stylesheet" href="/css/guest_reg3.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<title>펀딩 결제</title>
</head>

<body>
	<div id="app">
		<div class="container">
			<div class="wrapper">
				<h6 class="pay_title">비회원 결제</h6>
				<fieldset class="info_box goods_info">
					<legend class="info_box_name_legend">
						<h4 class="info_box_name_h">상품 정보</h4>
					</legend>
					<table class="info_box_goods_table">
						<tr>
							<td class="info_box_goods_table_img" rowspan="6"><img
								class="info_box_goods_img"></td>
							<td class="info_box_goods_table_text fundLists">상품 이름</td>
							<td class="info_box_goods_table_cnt_price fundListA" colspan="2">{{info.pName}}</td>
						</tr>
						<tr>
							<td class="fundLists">상품 가격</td>
							<td class="fundListA" colspan="2">{{info.pPrice}}원</td>
						</tr>
						<tr>
							<td class="fundLists">남은 금액</td>
							<td class="fundListA" colspan="2">{{remain}}원</td>
						</tr>
						<tr>
							<td class="fundLists">원하는 결제 금액</td>
							<td class="fundListA" colspan="2"><input type="text" placeholder="금액 입력" class="text1" v-model="givePrice" @keyup="fnSelfIn()">원</td>
						</tr>
						<tr>
							<td class="fundLists">금액설정</td>
							<td class="fundListA" colspan="2">
								<div>
									<button class="fundPutMoneyBtn btn1" id="10000btn" @click="fnFastIn(10000)">+10,000원</button>
									<button class="fundPutMoneyBtn btn1" @click="fnFastIn(50000)">+50,000원</button>
									<button class="fundPutMoneyBtn btn1" @click="fnFastIn(100000)">+100,000원</button>
								</div>
								<div>
									<button class="fundPutMoneyBtn btn1" @click="fnFastIn(0.1)">+10%</button>
									<button class="fundPutMoneyBtn btn1" @click="fnFastIn(0.25)">+25%</button>
									<button class="fundPutMoneyBtn btn1" @click="fnFastIn(0.5)">+50%</button>
									<button class="fundPutMoneyBtn btn1" @click="fnFastIn(-1)">ALL</button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="fundLists">진행도</td>
							<td class="fundListA">
								<div>
									<progress max="100" id="fundGuageBefore" :value="percent"></progress>
									<progress max="100" id="fundGuageAfter" :value="addPercent"></progress>
								</div>
							</td>
							<td class="fundGuagePerBox">
								<p class="fundGuagePer" v-if="percent >= addPercent">{{info.progVal}}%</p>
								<p class="fundGuagePer" v-else>{{info.progVal}}% / {{addPercent}}%</p>
							</td>
						</tr>
					</table>
				</fieldset>
				<fieldset class="info_box payer_info">
					<legend class="info_box_name_legend">
						<h4 class="info_box_name_h">결제자 정보</h4>
					</legend>
					<div class="payer_info_box">
						<div class="payer_info_box_text">
							<p>이름</p>
							<p>{{gname}}</p>
						</div>
						<div class="payer_info_box_text">
							<p>전화번호</p>
							<p>{{gphone}}</p>
						</div>
						<div class="payer_info_box_text">
							<p>주소</p>
							<p>{{gaddress}}</p>
						</div>
						<div class="payer_info_box_text">
							<p>신랑, 신부에게 전할 메세지</p>
						</div>
						<div>
							<textarea placeholder="메세지 입력" class="toCoupleMessage" v-model="sendContent"></textarea>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="wrapper">
				<fieldset class="pay_box">
					<div class="pay_info_box">
						<h4 class="pay_info_box_name_h">결제 수단</h4>
						<div class="pay_info_box_btns">
							<label for="pay_info_box_radio_a"><input id="pay_info_box_radio_a" type="radio" name="pay" v-model="purchase" value="C">카드 결제</label>
							<!-- <label for="pay_info_box_radio_b"><input id="pay_info_box_radio_b" type="radio" name="pay"> 무통장 입금</label>
							<label for="pay_info_box_radio_c"><input id="pay_info_box_radio_c" type="radio" name="pay"> 빼빼로 페이</label>  -->
						</div>

					</div>
					<div class="pay_total_price_box">
						<div class="pay_total_price_box_detail">
							<!-- <div>
								<p>상품 금액 :</p>
								<p>{{pdPrice}}원</p>
							</div>
							<div>
								<p>배송비 :</p>
								<p>무료배송</p>
							</div>  -->
						</div>
						<h4 class="pay_total_price_box_name_h">결제 금액</h4>
						<h4 class="pay_total_price_box_name_h">{{givePrice}}원</h4>
					</div>
				</fieldset>
				<div class="pay_btn_box">
					<button class="pay_btn btn1" type="button" @click="requestPay()">결제 하기</button>
				</div>
			</div>
		</div>


	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">

	IMP.init("imp55171728"); // 예: imp00000000a / 판매자 코드
	var app = new Vue({
		el : '#app',
		data : {
			gname: "${gname}",
			gphone: "${phone}",
			gaddress: "${address}",
			info: '${item}',
			productNo: '${item.productNo}',
			pdPrice: 100000,
			givePrice: '',
			remain: 90000,
			percent: '${item.progVal}',
			addPercent: 10,
			sendContent: '',
			purchase: 'C'
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
		, methods : {
			fnGuest : function() {
				var self = this;
				var nparmap = { };
				$.ajax({
					url: "/guest/info.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(data) {
						console.log(data);
						self.gname = data.gname;
						self.gphone = data.phone;
						self.gaddress = data.address;
						
					}
				});
			},
			fnSelfIn : function() {
				var self = this;
				var gp = self.givePrice;
				var rm = self.remain;
				if(gp > rm) gp = rm;
				self.givePrice = gp;
				self.fnGauge();
			},
			fnFastIn : function(amount) {
				var self = this;
				var gp = self.givePrice;
				var rm = self.remain;
				
				if(gp == '') gp = 0;
				gp = parseInt(gp);
				rm = parseInt(rm);
				
				if(amount > 2) {
					gp += amount;
				} else if(amount != -1) {
					gp += Math.floor(rm * amount, 0);
				} else {
					gp = self.remain;
				};
				
				if(gp > rm) gp = rm;
				self.givePrice = gp;
				self.fnGauge();
			},
			fnGauge : function() {
				var self = this;
				self.addPercent = self.percent + (self.givePrice / self.pdPrice) * 100;
			},
			fnPhoneThree : function() {
				var self = this;
				self.gphone = "${phone}".replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
			},
			requestPay: function () { //결제창
				var self = this;
				var orderno = self.fnOrderNo;
				IMP.request_pay({ // param
		          pg : "kcp.{test}",
		          merchant_uid : orderno,
		          name : self.list.pName,
		          amount : self.totalPrice,
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
		      },
			fnOrder : function(orderno) {
				var self = this;
				var nparmap = {userId : self.info.userId
								, givePrice : self.givePrice
								, sendContent : self.sendContent
								, purchase : self.purchase
								, orderNo : orderno
								, fundingNo : self.info.fundingNo
								, registryNo : self.info.registryNo
								, pPrice : self.info.pPrice
								, purchase : self.purchase
								};
	        	$.ajax({
	    			url : "/guest/order.dox",
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
		},
		created : function() {
			var self = this;
			self.fnPhoneThree();
		}
	});
</script>
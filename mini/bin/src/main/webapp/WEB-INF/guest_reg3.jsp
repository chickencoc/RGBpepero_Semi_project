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
<link rel="stylesheet" href="/css/guest_reg3.css">
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
							<td class="info_box_goods_table_cnt_price fundListA" colspan="2">{{p_name}}</td>
						</tr>
						<tr>
							<td class="fundLists">상품 가격</td>
							<td class="fundListA" colspan="2">{{p_price}}</td>
						</tr>
						<tr>
							<td class="fundLists">남은 금액</td>
							<td class="fundListA" colspan="2">{{p_price-fputprice}}</td>
						</tr>
						<tr>
							<td class="fundLists">원하는 결제 금액</td>
							<td class="fundListA" colspan="2"><input type="text"
								placeholder="금액 입력" class="text1"> 원</td>
						</tr>
						<tr>
							<td class="fundLists">금액설정</td>
							<td class="fundListA" colspan="2">
								<div>
									<button class="fundPutMoneyBtn btn1" id="10000btn"
										onclick="fnFundGuage()">+10,000원</button>
									<button class="fundPutMoneyBtn btn1">+50,000원</button>
									<button class="fundPutMoneyBtn btn1">+100,000원</button>
								</div>
								<div>
									<button class="fundPutMoneyBtn btn1">+10%</button>
									<button class="fundPutMoneyBtn btn1">+25%</button>
									<button class="fundPutMoneyBtn btn1">+50%</button>
									<button class="fundPutMoneyBtn btn1">ALL</button>
								</div>
							</td>
						</tr>
						<tr>
							<td class="fundLists">현재 진행도</td>
							<td class="fundListA">
								<div>
									<progress value="30" max="100" id="fundGuageBefore"></progress>
									<progress value="0" max="100" id="fundGuageAfter"></progress>
								</div>
							</td>
							<td class="fundGuagePerBox">
								<p class="fundGuagePer">{{%}} + {{%}}</p>
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
							<p>{{name}}</p>
						</div>
						<div class="payer_info_box_text">
							<p>전화번호</p>
							<p>{{phone}}</p>
						</div>
						<div class="payer_info_box_text">
							<p>주소</p>
							<p>{{address}}</p>
						</div>
						<div class="payer_info_box_text">
							<p>신랑, 신부에게 전할 메세지</p>
						</div>
						<div>
							<textarea placeholder="메세지 입력" class="toCoupleMessage"></textarea>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="wrapper">
				<fieldset class="pay_box">
					<div class="pay_info_box">
						<h4 class="pay_info_box_name_h">결제 수단</h4>
						<div class="pay_info_box_btns">
							<label for="pay_info_box_radio_a"><input
								id="pay_info_box_radio_a" type="radio" name="pay" checked>
								카드 결제</label> <label for="pay_info_box_radio_b"><input
								id="pay_info_box_radio_b" type="radio" name="pay"> 무통장
								입금</label> <label for="pay_info_box_radio_c"><input
								id="pay_info_box_radio_c" type="radio" name="pay"> 빼빼로
								페이</label>
						</div>

					</div>
					<div class="pay_total_price_box">
						<div class="pay_total_price_box_detail">
							<div>
								<p>상품 금액 :</p>
								<p>{{1,234}}원</p>
							</div>
							<div>
								<p>배송비 :</p>
								<p>무료배송</p>
							</div>
						</div>
						<h4 class="pay_total_price_box_name_h">결제 금액</h4>
						<h4 class="pay_total_price_box_name_h">{{900,000}}원</h4>
					</div>
				</fieldset>
				<div class="pay_btn_box">
					<button class="pay_btn btn1" type="button" @click="">결제 하기</button>
				</div>
			</div>
		</div>


	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
function fnFundGuage() {
    var Guage = document.getElementById("fundGuageAfter");
    fundGuageAfter.value = 70;
    
}
	var app = new Vue({
		el : '#app',
		data : {

		},
		methods : {

		},
		created : function() {
			var self = this;

		}
	});
</script>
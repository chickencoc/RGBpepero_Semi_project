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
<title>카드, 답례품 결제 페이지</title>
</head>

<body>
	<div id="app">
		<div class="container">
			<div class="wrapper">
				<h6 class="pay_title">주문 상세 내역</h6>
				<fieldset class="info_box goods_info receive_box">
					<legend class="info_box_name_legend">
						<h4 class="info_box_name_h">상품 정보</h4>
					</legend>
					<table class="info_box_goods_table">
						<tr>
							<td colspan="3"></td>
							<td class="tableTitle">수량</td>
							<td class="tableTitle">금액</td>
							<td class="tableTitle">배송상태</td>
						</tr>
						<tr>
							<td class="tableCheckbox" rowspan="2"><input type="checkbox"></td>
							<td class="info_box_goods_table_img tableContent" rowspan="2"><img
								class="info_box_goods_img"></td>
							<td class="info_box_goods_table_text">{{p_name}}</td>
							<td class="info_box_goods_table_cnt_price tableContent"
								rowspan="2">{{1개}}</td>
							<td rowspan="2" class="tableContent">{{p_price}}</td>
							<td rowspan="2" class="tableContent">{{status}}</td>
						</tr>
						<tr>
							<td class="info_box_goods_table_text">{{p_content}}</td>
						</tr>
						<tr>
							<td colspan="6"><hr class="tableLine"></td>
						<tr>
							<td class="tableCheckbox" rowspan="2"><input type="checkbox"></td>
							<td class="info_box_goods_table_img tableContent" rowspan="2"><img
								class="info_box_goods_img"></td>
							<td class="info_box_goods_table_text">{{p_name}}</td>
							<td class="info_box_goods_table_cnt_price tableContent"
								rowspan="2">{{1개}}</td>
							<td rowspan="2" class="tableContent">{{p_price}}</td>
							<td rowspan="2" class="tableContent">{{status}}</td>
						</tr>
						<tr>
							<td class="info_box_goods_table_text">{{p_content}}</td>
						</tr>
					</table>
				</fieldset>
				<fieldset class="info_box payer_info delivey_info destinationBox">
					<legend class="info_box_name_legend">
						<h4 class="info_box_name_h">배송지 정보</h4>
					</legend>
					<fieldset class="destinationInfoBox">
						<legend class="info_box_name_legend_destination">
							<!--background-color를 주변 색깔에 맞춰 변경해야함-->
							<p class="destinationRecipient">수령인 {{index}}: {{g_name}}</p>
						</legend>
						<table class="destinationTable">
							<tr>
								<td class="destinationInfo">연락처</td>
								<td class="destinationTextBox"><input type="text"
									class="destinationText text1"></td>
							</tr>
							<tr>
								<td class="destinationInfo">배송지 주소</td>
								<td class="destinationTextBox"><input type="text"
									class="destinationText text1"></td>
							</tr>
						</table>
					</fieldset>
					<fieldset class="destinationInfoBox">
						<legend class="info_box_name_legend_destination">
							<p class="destinationRecipient">수령인 {{index}}: {{g_name}}</p>
						</legend>
						<table class="destinationTable">
							<tr>
								<td class="destinationInfo">연락처</td>
								<td class="destinationTextBox"><input type="text"
									class="destinationText"></td>
							</tr>
							<tr>
								<td class="destinationInfo">배송지 주소</td>
								<td class="destinationTextBox"><input type="text"
									class="destinationText"></td>
							</tr>
						</table>
					</fieldset>
				</fieldset>
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
						<button class="pay_btn btn1" type="button" @click="">결제
							하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
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
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
	<link rel="stylesheet" href="/css/myInfo_gift9.css">
	<title>주문 상세 내역 / 배송 조회 페이지</title>
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
                            <td colspan="3">　</td>
                            <td class="tableTitle">수량</td>
                            <td class="tableTitle">금액</td>
                            <td class="tableTitle">배송상태</td>
                        </tr>   
                        <tr>
                            <td class="tableCheckbox"  rowspan="2"><input type="checkbox"></td>
                            <td class="info_box_goods_table_img tableContent" rowspan="2"><img class="info_box_goods_img"></td>
                            <td class="info_box_goods_table_text">{{p_name}}</td>
                            <td class="info_box_goods_table_cnt_price tableContent" rowspan="2">{{1개}}</td>
                            <td rowspan="2" class="tableContent">{{p_price}}</td>
                            <td rowspan="2" class="tableContent">{{status}}</td>
                        </tr>
                        <tr>
                            <td class="info_box_goods_table_text">{{p_content}}</td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="info_box payer_info delivey_info receive_box">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">배송 상세 정보</h4>
                    </legend>
                    <table class="deliveryTable">
                        <tr>
                            <td class="deliveryTitle">송장 번호</td>
                            <td class="deliveryContent">{{deliveryno}}</td>
                        </tr>
                        <tr>
                            <td class="deliveryTitle">배송 업체</td>
                            <td class="deliveryContent">우체국 택배</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="deliveryContent">
                                <a href="https://service.epost.go.kr/iservice/usr/trace/usrtrc001k01.jsp">
                                    <button class="deliveryCheckBtn btn1">배송조회</button>
                                </a>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <fieldset class="info_box receive_box">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">배송지 정보</h4>
                    </legend>
                        <div class="deliveryReceiveBox">
                            <table class="deliveryReceiveTable">
                                <tr>
                                    <td class="deliveryReceiveTitle">수령인</td>
                                    <td>{{userid}}</td>
                                </tr>
                                <tr>
                                    <td class="deliveryReceiveTitle">연락처</td>
                                    <td>{{phone}}</td>
                                </tr>
                                <tr>
                                    <td class="deliveryReceiveTitle">배송지 주소</td>
                                    <td>{{addr}}</td>
                                </tr>
                                <tr>
                                    <td class="deliveryReceiveTitle">배송 메모</td>
                                    <td>{{d_message}}</td>
                                </tr>
                            </table>
                        </div>
                </fieldset>
                <fieldset class="info_box receive_box">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">주문금액</h4>
                    </legend>
                    <div class="orderInfoBox">
                        <table class="orderInfoTable">
                            <tr>
                                <td class="orderInfoTitle">결제방법</td>
                                <td>{{o_purchase}}</td>
                            </tr>
                            <tr>
                                <td class="orderInfoTitle">상품금액</td>
                                <td>{{price}}</td>
                            </tr>
                            <tr>
                                <td class="orderInfoTitle">배송비</td>
                                <td>{{d_price}}</td>
                            </tr>
                            <tr>
                                <td class="orderInfoTitle">총 금액</td>
                                <td>{{price}}</td>
                            </tr>
                        </table>
                    </div>
                </fieldset>
                <div class="purchaseBtnBox">
                    <button class="purchaseBtn btn1">뒤로가기</button>
                    <button class="purchaseBtn btn1">홈으로</button>
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

    }   
    , methods: {

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/headerLogo.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<link rel="stylesheet" href="/css/guest_reg2.css">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<title>일반 결제</title>
</head>

<body>
	<div id="app">
    <div id="wrapper">
        <div class="container">
            <div class="wrapper">
                <h6 class="pay_title">비회원 결제</h6>
                <fieldset class="info_box goods_info">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">상품 정보</h4>
                    </legend>
                    <table class="info_box_goods_table">
                        <tr>
                            <th colspan="2">상품 정보</th>
                            <th>수량</th>
                            <th>판매가격</th>
                        </tr>
                        <tr>
                            <td class="info_box_goods_table_img"><img class="info_box_goods_img"></td>
                            <td class="info_box_goods_table_text">{{list.pdName}}</td>
                            <td class="info_box_goods_table_cnt_price">{{totalCnt}} 개</td>
                            <td class="info_box_goods_table_cnt_price">{{list.pdPrice}} 원</td>
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
                    </div>
                </fieldset>
                <fieldset class="info_box ship_info">
                    <legend class="info_box_name_legend">
                        <h4 class="info_box_name_h">배송지 정보</h4>
                    </legend>
                    <div class="ship_info_box">
                        <div class="ship_info_box_text">
                            <p>수령인</p>
                            <p>{{uname}}</p>
                        </div>
                        <div class="ship_info_box_text">
                            <p>전화번호</p>
                            <p>{{uphone}}</p>
                        </div>
                        <div class="ship_info_box_text">
                            <p>배송 주소</p>
                            <p>{{uaddress}}</p>
                        </div>
                        <div class="ship_info_box_text">
                            <p>배송 메모</p>
                            <input type="text" class="text1" v-model="shipMemo" placeholder="배송 메모를 입력해주세요.">
                        </div>
                        <div class="ship_info_box_text">
                            <p>신랑, 신부에게 전할 메세지</p>
                            <input type="text" class="text1" v-model="sendContent" placeholder="신랑, 신부에게 전할 말을 입력해주세요.">
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="wrapper">
                <fieldset class="pay_box">
                    <div class="pay_info_box">
                        <h4 class="pay_info_box_name_h">결제 수단</h4>
                        <div class="pay_info_box_btns">
                            <label for="pay_info_box_radio_a"><input id="pay_info_box_radio_a" type="radio" name="pay" v-model="purchase" value="C"> 카드 결제</label>
                            <!-- <label for="pay_info_box_radio_b"><input id="pay_info_box_radio_b" type="radio" name="pay" v-model="purchase" value="A"> 무통장 입금</label> 
                            <label for="pay_info_box_radio_c"><input id="pay_info_box_radio_c" type="radio" name="pay" v-model="purchase" value="B"> 빼빼로 페이</label>  -->
                        </div>

                    </div>
                    <div class="pay_total_price_box">
                        <div class="pay_total_price_box_detail">
                            <div>
                                <p>상품 총 수량 : </p>
                                <p>{{totalCnt}} 개</p>
                            </div>
                            <div>
                                <p>상품 금액 : </p>
                                <p>{{totalPrice}} 원</p>
                            </div>
                            <div>
                                <p>배송비 : </p>
                                <p>무료배송</p>
                            </div>
                        </div>
                        <h4 class="pay_total_price_box_name_h">결제 금액</h4>
                        <h4 class="pay_total_price_box_name_h">{{totalPrice}} 원</h4>
                    </div>
                </fieldset>
                <div class="pay_btn_box">
                    <button class="pay_btn btn1" type="button" @click="requestPay()">결제 하기</button>
                </div>
            </div>
        </div>

    </div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">

	IMP.init("imp55171728"); // 예: imp00000000a
	var app = new Vue({ 
	    el: '#app'
	    , data: {
	    	userId: 'admin123',
			gname: "${gname}",
			gphone: '',
			gaddress: "${address}",
			uname: '',
			uphone: '',
			uaddress: '',
			productNo: 1,
			list: {pdName : 'TEST1', pdPrice : 100000},
			totalPrice: 0,
			totalCnt: 2,
			shipMemo: '',
			sendContent: '',
			purchase: 'C',
			REGISTRYNO: ''
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
	    , methods: {
			fnPdList : function() {
				var self = this;
	
				self.totalPrice = self.list.pdPrice;
				
			},
			fnUserInfo : function() {
				var self = this;
				var nparmap = {userId : self.userId};
	        	$.ajax({
	    			url : "/guest/userInfo.dox",
	    			dataType : "json",
	    			type : "POST",
	    			data : nparmap,
	    			success : function(data) {
	    				self.uname = data.info.uName;
	    				self.uphone = data.info.uPhone.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	    				if(data.info.uAddr2 == null) 
	    					self.uaddress = '(' + data.info.uAddrno + ') ' + data.info.uAddr1;
	    				else
	    					self.uaddress = '(' + data.info.uAddrno + ') ' + data.info.uAddr1 + ", " + data.info.uAddr2;
	    			}
    			});
			},
			requestPay: function () { //결제창
				var self = this;
				orderno = self.fnOrderNo;
				IMP.request_pay({ // param
		          pg : "kcp.{test}",
		          merchant_uid : orderno,
		          name : self.list.pdName,
		          amount : self.totalPrice,
		          buyer_email : "gildong@gmail.com",
		          buyer_name : "홍길동",
		          buyer_tel : "010-4242-4242",
		          buyer_addr : "서울특별시 강남구 신사동",
		          buyer_postcode : "01181"
		        }, rsp => { // callback
	                if (rsp.success) {
	                	fnOrder(merchant_uid);
	                } else {
	                    console.log(rsp);
	                }
		        });
		      },
			fnOrder : function(orderno) {
				var self = this;
				var nparmap = {userId : self.userId
								, productNo : self.productNo 
								, totalPrice : self.totalPrice
								, shipMemo : self.shipMemo
								, sendContent : self.sendContent
								, purchase : self.purchase
								, totalCnt : self.totalCnt
								, dStatus : 'A'
								, orderNo : orderno
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
			},
			fnPhoneThree : function() {
				var self = this;
				self.gphone = "${phone}".replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
			}
	    
		}
		, created: function() {
			var self = this;
			self.fnPdList();
			self.fnUserInfo();
			self.fnPhoneThree();
		}
	});
</script>
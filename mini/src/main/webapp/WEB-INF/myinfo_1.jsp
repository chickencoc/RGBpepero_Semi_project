<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<title>회원정보 수정</title>
<style>
/* style START */
.container {
	margin: auto;
}

.container fieldset {
	padding-top: 40px;
}

fieldset #information {
	margin-left: 200px;
}

#information input {
	margin-left: 15px;
}

fieldset {
	width: 900px;
	height: 700px;
	margin: auto;
	margin-top: 30px;
	line-height: 40px;
	box-shadow: 0px 0px 5px 0px #555;
}

#post {
	margin-left: 10px;
}

#information button {
	border-radius: 30px;
	color: white;
	background-color: black;
	border: 1px solid black;
	width: 120px;
	height: 50px;
	margin-left: 200px;
	margin-top: 25px;
}

#information select {
	margin-bottom: 10px;
	width: 50px;
}

#bank {
	margin-left: 63px;
}

fieldset #profile {
	margin-top: 10px;
	position: absolute;
	margin-left: 30px;
}

fieldset input {
	border: 2px solid black;
}

fieldset select {
	border: 2px solid black;
}

#idd {
	border: 2px;
}

.product_category_list>a:not(:last-child):after {
	content: '';
	display: inline-block;
	width: 2px;
	height: 15px;
	background: #999;
	position: relative;
	top: 2px;
	margin-left: 13px;
}

.product_category_list>a {
	margin: 0 5px;
}

.product_category_list {
	text-align: center;
}

.inputid {
	margin-left: 100px
}

#idline span {
	margin-left: 75px;
	color: gray;
}

#pwline input {
	margin-left: 55px;
}

#pwline2 input {
	margin-left: 22px;
}

#nameAndPartner #name {
	margin-left: 86px;
}

#gender #male {
	margin-left: 90px;
}

#phoneNumber #phone {
	margin-left: 57px;
}

#addresses #address1 {
	margin-left: 91px;
	width: 350px;
}

#addresses #address2 {
	margin-left: 121px;
}

#addresses #address3 {
	margin-left: 121px;
}

#mail #email1 {
	margin-left: 72.5px;
}

#birth #birthDay {
	margin-left: 57.5px;
	margin-right: 10px;
}
#weddingDate #weddingDay {
	margin-left: 42px;
	margin-right: 10px;
}

#bankInfo select {
	width: 60px;
	margin-left: 57.5px;
}
fieldset #fieldTitle{
	font-size : 30px;
	text-align : center;
	margin-bottom : 30px;
}

/* style END */
</style>
</head>
<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<div class="product_category_list">
					<a href=""><strong>회원정보</strong></a> <a href="">나의 레지스트리</a> <a
						href="">받은 선물 목록</a> <a href="">보낸답례품</a> <a href="">캘린더</a>
				</div>
				<fieldset>
					<h1 id="fieldTitle">내정보 수정하기</h1>
					<img src="/image/userimgA/profile1.PNG" id="profile">
					<div id="information">
						<div id="idline">
							아이디<span>{{userId}}</span>
						</div>
						<div id="pwline">
							<label>비밀번호 <input type="password" id="pw"
								v-model="password"></label>
						</div>
						<div id="pwline2">
							<label>비밀번호 확인 <input type="password" id="pw2" v-model="password2"></label>
						</div>
						<div id="nameAndPartner">
							<label>이름 <input type="text" id="name" v-model="uName"></label>
							<label>배우자명 <input type="text" id="partner"
								v-model="partner"></label>
						</div>

						<div id="phoneNumber">
							<label>전화번호 <input type="tel" id="phone" v-model="uPhone"></label>
						</div>
						<div id="addresses">
							<label>주소<input type="text" id="address1"
								v-model="uAddr1"></label> <label><input type="text"
								id="address2" v-model="uAddr2"></label>
						</div>
						<div id="mail">
							<label>이메일 <input type="email" id="email1"
								v-model="uEmail"></label>
						</div>
						<div id="birth">
							<label>생년월일 <input type="text" id="birthDay"
								v-model="birth"></label>
						</div>
						<div id="weddingDate">
							<label>결혼예정일 <input type="text" id="weddingDay"
								v-model="weddingday"></label>
						</div>

						<div id="bankInfo">
							계좌정보 <select id="bank" v-model="bank">
								<option value="A">국민</option>
								<option value="B">신한</option>
								<option value="C">우리</option>
								<option value="D">농협</option>
								<option value="E">기업</option>
							</select> <input type="text" id="bankNumber" v-model="bankaccount">
						</div>
						<button id="btn" @click="fnUserInformationModify">수정완료</button>
					</div>
				</fieldset>
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
			userId : "${sessionId}",
			password : "",
			uName : "",
			partner : "",
			gender : "",
			uPhone : "",
			uAddr1 : "",
			uAddr2 : "",
			uEmail : "",
			birth : "",
			bank : "",
			bankaccount : "",
			weddingday : "",
			password2 : "",
			list : []

		}
	,
		methods : {
			fnMoveMain : function() {
				alert("성공적으로 수정되었습니다!");
				location.href = "/main.do";
			},
			fnUserInformationBefore : function() {
				var self = this;
				var nparmap = {
					userId : self.userId
				};
				$.ajax({
					url : "/informationmodify.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						self.list = data.list;
						console.log(self.list);
						self.uName = self.list.uName;
						self.partner = self.list.partner;
						self.password = self.list.password;
						self.gender = self.list.gender;
						self.uPhone = self.list.uPhone;
						self.uAddr1 = self.list.uAddr1;
						self.uAddr2 = self.list.uAddr2;
						self.uEmail = self.list.uEmail;
						self.bank = self.list.bank;
						self.birth = self.list.birth;
						self.weddingday = self.list.weddingday;
						self.bankaccount = self.list.bankaccount;
					}
				})
			},

			fnUserInformationModify : function() {
				var self = this;
				var nparmap = {
					userId : self.userId,
					password : self.password,
					uName : self.uName,
					partner : self.partner,
					gender : self.gender,
					uPhone : self.uPhone,
					uAddr1 : self.uAddr1,
					uAddr2 : self.uAddr2,
					uEmail : self.uEmail,
					birth : self.birth,
					bank : self.bank,
					bankaccount : self.bankaccount,
					weddingday : self.weddingday
				};
				console.log(nparmap);
				$.ajax({
					url : "/information/edit.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						location.href = "/information.do";
						if(self.password != self.password2){
							alert("비밀번호와 확인번호가 같지않습니다.");
							location.href="/informationmodify.do";
						}else {alert("수정되었습니다!");}
						
					}
				})
			}

		},
		created : function() {
			var self = this;
			self.fnUserInformationBefore();
		}

	});
</script>
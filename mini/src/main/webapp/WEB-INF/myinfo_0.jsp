<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/header.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<title>회원정보</title>
<style>
/* style START */
.container {
	margin: auto;
}

.container fieldset {
	padding-top: 50px;
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
	margin-top: 10px;
	line-height: 50px;
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
	margin-top : 10px;
}

.inputid {
	margin-left: 100px
}

#idline span {
	margin-left: 75px;
	color: gray;
}

#pwline span {
	margin-left: 60px;
	color: gray;
}

#pwline2 span {
	margin-left: 27px;
	color: gray;
}

#nameAndPartner #name {
	margin-left: 86px;
	color: gray;
	margin-right: 50px;
}

#nameAndPartner #partner {
	margin-left: 22px;
	color: gray;
}

#gender #genderKind {
	margin-left: 90px;
	color: gray;
}

#phoneNumber #phone {
	margin-left: 57px;
	color: gray;
}

#addresses #address1 {
	margin-left: 84px;
	color: gray;
}

#mail #email1 {
	margin-left: 72.5px;
	color: gray;
}

#birth #birthYear {
	margin-left: 57.5px;
	width: 70px;
	margin-right: 10px;
	color: gray;
}

#birth #birthMonth {
	width: 70px;
	margin-right: 10px;
	color: gray;
}

#birth #birthDay {
	width: 70px;
	margin-right: 10px;
	color: gray;
}
#weddingDay #weddingDate {
	width: 70px;
	margin-right: 10px;
	color: gray;
	margin-left: 45px;
}

#bankInfo #bank {
	margin-left: 57.5px;
	color: gray;
}

#bankInfo #bankNumber {
	margin-left: 30px;
	color: gray;
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
					<h1 id="fieldTitle">내정보 확인하기</h1>
					<img src="/image/profile1.PNG" id="profile">
					<div id="information">
						<div id="idline">
							아이디<span id="id">{{userId}}</span>
						</div>
						<div id="nameAndPartner">
							이름 <span id="name">{{list.uName}}</span> 배우자명 <span id="partner">{{list.partner}}</span>
						</div>
						<div id="gender">
							성별<span id="genderKind">{{list.gender}}</span>
						</div>
						<div id="phoneNumber">
							전화번호<span id="phone">{{list.uPhone}}</span>
						</div>
						<div id="addresses">
							주소 <span id="address1">{{list.uAddr1}} {{list.uAddr2}}</span>
						</div>
						<div id="mail">
							이메일 <span id="email1">{{list.uEmail}}</span>
						</div>
						<div id="birth">
							생년월일 <span id="birthYear">{{list.birth}}</span>
						</div>
						<div id="weddingDay">
							결혼예정일 <span id="weddingDate">{{list.weddingday}}</span>
						</div>
						<div id="bankInfo">
							계좌정보 <span id="bank">{{bank}}</span> 
							<span id="bankNumber">{{list.bankaccount}}</span>
						</div>
						<button id="btn" @click="fnMoveModify">수정하기</button>
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
    el: '#app',
    data: {
    	userId : "${sessionId}",
    	bank : "",
    	list : []
		
    }
	
    , methods: {
    	
    	fnMoveModify : function(){
    		var self = this;
    		location.href="/informationmodify.do";
    	},
    	fnUserInformation(){
    		var self = this;
            var nparmap = {userId : self.userId}; 
            $.ajax({
                url:"/information.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {             
             		console.log(data);
             		self.list = data.list;
             		console.log(self.list);
             		if(self.list.bank == "A"){
             			self.bank= "국민";
             		  }else if(self.list.bank == "B"){
             			 self.bank= "신한"; 
             		  }else if(self.list.bank == "C"){
             			 self.bank= "우리"; 
             		  }else if(self.list.bank == "D"){
             			 self.bank= "농협"; 
             		  }else if(self.list.bank == "E"){
             			 self.bank= "기업"; 
             		  }
    				}
    			})
    		}
    	}
   
    , created: function () {
    	var self = this;
    	self.fnUserInformation();
	}
});
</script>
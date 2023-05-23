<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<title>회원정보</title>
<style>
/* style START */
.container {margin: auto; }

fieldset {width: 670px; margin: 0 auto; margin-top: 25px; line-height: 50px; padding-top: 50px;}
fieldset .information {display: grid; place-content: center; margin-left: 200px; width: 600px; margin: 0 auto; margin-left: 70px; }
fieldset .information input {margin-left: 15px; }
fieldset .information select {margin-bottom: 10px;width: 50px; }
fieldset .editBtn { text-align: center; }
fieldset .editBtn .btn1 { height: 35px; width: 120px; margin: 30px 0; }

fieldset .profile {text-align: center;} 
fieldset input {border: 2px solid black; }
fieldset select {border: 2px solid black; }

.inputid {margin-left: 100px}
#idline span {margin-left: 75px;color: gray; } 
#pwline span {margin-left: 60px;color: gray; } 
#pwline2 span {margin-left: 27px;color: gray; } 
#nameAndPartner #name {margin-left: 86px;color: gray;margin-right: 50px; } 
#nameAndPartner #partner {margin-left: 22px;color: gray; } 
#gender #genderKind {margin-left: 90px;color: gray; } 
#phoneNumber #phone {margin-left: 57px;color: gray; } 
#addresses #address1 {margin-left: 84px;color: gray; } 
#mail #email1 {margin-left: 72.5px;color: gray; } 
#birth #birthYear {margin-left: 57.5px;width: 70px;margin-right: 10px;color: gray; } 
#birth #birthMonth {width: 70px;margin-right: 10px;color: gray; } 
#birth #birthDay {width: 70px;margin-right: 10px;color: gray; } 
#weddingDay #weddingDate {width: 70px;margin-right: 10px;color: gray;margin-left: 45px; } 
#bankInfo #bank {margin-left: 57.5px;color: gray; } 
#bankInfo #bankNumber {margin-left: 30px;color: gray; } 
fieldset #fieldTitle {font-size : 30px;text-align : center;margin-bottom : 30px; } 
#profileImage{width: 150px; height: 150px; border-radius: 50%; background-color: #E4DBD6;}

/* style END */
</style>
</head>
<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<div class="myinfo_category_list">
					<a href="information.do"><strong>회원정보</strong></a>
					<a href="myRegistry.do">나의 레지스트리</a>
					<a href="mygift.do">받은 선물 목록</a>
					<a href="returngoods.do">보낸답례품</a>
					<a href="main.do">캘린더</a>
				</div>
				<fieldset class="boxshadowline">
					<h1 id="fieldTitle">내정보 확인하기</h1>
					<div class="profile" >
						<img :src="imgUrl2" id="profileImage">
					</div>
					<div class="information">
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
					</div>
					<div class="editBtn">
						<button class="btn1" @click="fnMoveModify">수정하기</button>
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
    	list : [],
		image: [],
		imgUrl2: ""
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
    		},
			fnselectImage : function(){
	                var self = this;
	                var nparmap = {userId: self.userId};
	
	                $.ajax({
	                    url: "/registryImg.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function(data) {
	                        self.image = data.image; 
							console.log(self.image); // Assuming 'images' is an array of image objects
	                        for(var i = 0; i < self.image.length; i++) {
	                            if(self.image[i].imgUsetype == 2){
	                                self.imgUrl2 = self.image[i].imgSrc;
	                            }
	                            
	                        }
	                    },
	                    error: function(xhr, textStatus, errorThrown) {
	                        console.error(textStatus);
	                    }
	                });
	            }
		
    	}
    
    , created: function () {
    	var self = this;
    	self.fnUserInformation();
		self.fnselectImage();
	}
});
</script>
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
<link rel="stylesheet" href="/css/myInfo_1.css">
<title>회원정보 수정</title>
<style>
/* style START */

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
				<fieldset>
					<h3 id="fieldTitle">회원정보 수정하기</h3>
					<div class="profile" >
						<img :src="imgUrl2" id="profileImage" @click="fnProfileAlter">
					</div>
					<div class="information">
					
						<span>아이디</span>
						<span id="selectuserId">{{userId}}</span>

						<span>비밀번호</span> 
						<input type="password" id="pw" v-model="password">

						<span>비밀번호 확인</span> 
						<input type="password" id="pw2" v-model="password2">
			
						<span>이름</span> 
						<input type="text" id="name" v-model="uName">
					
						<span>배우자명</span>
						<input type="text" id="partner" v-model="partner">
					
						<span>전화번호</span> 
						<input type="tel" id="phone" v-model="uPhone" maxlength="11">
					
						<span>주소</span>
						<input type="text" id="address1" v-model="uAddr1">
						<span>상세주소</span>
						<input type="text" id="address2" v-model="uAddr2">
					
						<span>이메일</span>
						<input type="email" id="email1" v-model="uEmail">
					
						<span>생년월일</span>
						<input type="text" id="birthDay" v-model="birth">
					
						<span>결혼예정일</span> 
						<input type="text" id="weddingDay" v-model="weddingday">
						
						<span>계좌정보</span> 
						<select id="bank" v-model="bank">
							<option value="A">국민</option>
							<option value="B">신한</option>
							<option value="C">우리</option>
							<option value="D">농협</option>
							<option value="E">기업</option>
						</select> 
						<input type="text" id="bankNumber" v-model="bankaccount">
					</div>
					<div class="buttonBox">
						<button  class="btn1" @click="fnUserInformationModify">수정완료</button>
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
			list : [],
			image: [],
			imgUrl2: ""

		},
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
				 let getNumberCheck = /[0-9]/;
				 let getPwdCheck = /^(?=.*[!@#$%^&*])(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,20}$/;
				 let getNameCheck = /^[가-힣|a-z|A-Z]/;
				 if(self.password == ''||self.password2==''){
		                alert("비밀번호를 입력해주세요.")
		            } else if(self.uName==''){
		                alert("이름을 입력해주세요.")
		            } else if(self.uPhone1==''){
		                alert("연락처를 입력해주세요.")
		            } else if(self.addr==''||self.addrDetail==''){
		                alert("주소를 입력해주세요.")
		            } else if(self.uEmail==''){
		                alert("이메일을 입력해주세요.")
		            } else if(self.birth==''){
		                alert("생일을 입력해주세요.")
		            } else if(self.bankaccount==''||self.bank==''){
		                alert("계좌번호를 입력해주세요.")
		            } else if(!getNameCheck.test(self.uName)){
		                    alert("이름이 정확하지 않습니다.");
		                    self.name='';
		            } else if(!getNumberCheck.test(self.uPhone)){
						alert("전화번호는 숫자만 입력 가능합니다.");
						self.uPhone='';
					} else if(!getNumberCheck.test(self.bankaccount)){
		                alert("계좌번호는 숫자만 입력 가능합니다.");
		                self.bankaccount = '';
		            } else if(!getPwdCheck.test(self.password)){
		                alert("비밀번호의 형식이 올바르지 않습니다. 8~20글자, 영어 대소문자, 특수문자(!@#$%^&*)가 모두 포함되어야 합니다.")
		                self.pwd='';
		                self.pwdCheck='';
		           	} else if(self.password != self.password2){
		           		alert("비밀번호가 일치하지 않습니다.")
		           		self.password='';
		                self.password2='';
			        } else{
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
	            },
			fnProfileAlter : function(image){
	            let popUrl = "/registryProfileImg.do";
	            let popOption = "width = 500px, height=500px, top=300px, left=300px, scrollbars=no";
				localStorage.setItem('userImgInfo', JSON.stringify(image));
				let popup = window.open(popUrl, "프로필이미지설정", [popOption]);
	            popup.onbeforeunload = function() {
					localStorage.removeItem('userImgInfo');
	                location.reload();
	            };
	    }

		},
		created : function() {
			var self = this;
			self.fnUserInformationBefore();
			self.fnselectImage();
		}

	});
</script>
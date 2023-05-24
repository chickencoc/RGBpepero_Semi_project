<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
					
				</div>
				<fieldset>
					<h3 id="fieldTitle">회원정보 수정하기</h3>
					<div class="profile" >
						<img :src="imgUrl2" id="profileImage" @click="fnProfileAlter">
						<img src="/image/icon/editcon.png"  id="profileImageEdit" class="boxshadowline" @click="fnProfileAlter">
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
						<span>성별</span>
						<div id="genderType">
							<label>
								<input type="radio" name="gender" v-model="gender" value="M"> 남자
							</label> 
							<label>
								<input type="radio" name="gender" v-model="gender" value="F"> 여자
							</label>
						</div>
						<span>우편번호</span>
						<div id="findPost">
							<input type="text" class="registryAddr text1" readonly id="postcode" placeholder="우편번호" v-model="uAddrNo">
							<button class="checkBtn btn1" @click="fnAddr">우편번호 검색</button>
						</div>
						<span>주소</span>
						<input type="text" id="address1" v-model="uAddr1" readonly id="address">
						<span>상세주소</span>
						<input type="text" id="address2" v-model="uAddr2" id="detailAddress">
					
						<span>이메일</span>
						<input type="email" id="email1" v-model="uEmail">
					
						<span id="birthSpan">생년월일</span>
						<div id="birth">
						<select id="birthdayYear" v-model="birthYear">
								<option value="" hidden>::선택::</option>
								<option v-for="birthYear in birthYears" :key="birthYear"
									:value="birthYear">{{birthYear}}</option>
							</select> 년 <select id="birthdayMonth" v-model="birthMonth">
								<option value="" hidden>::선택::</option>
								<option v-for="birthMonth in birthMonths" :key="birthMonth"
									:value="birthMonth">{{birthMonth}}</option>
							</select> 월  
							<select id="birthdayDay" v-model="birthDay">
								<option value="" hidden>::선택::</option>
								<option v-for="birthDay in birthDays" :key="birthDay" :value="birthDay">{{birthDay}}</option>
							</select> 일
						</div>
						<span>결혼예정일</span> 
							<div id="weddingDate">
							<select id="weddingYear" v-model="weddingYear">
									<option value="">::미정::</option>
									<option v-for="weddingYear in weddingYears" :key="weddingYear"
										:value="weddingYear">{{weddingYear}}</option>
								</select> 년 <select id="weddingMonth" v-model="weddingMonth">
									<option value="">::미정::</option>
									<option v-for="weddingMonth in weddingMonths"
										:key="weddingMonth" :value="weddingMonth">{{weddingMonth}}</option>
								</select> 월 <select id="weddingDay" v-model="weddingDay">
									<option value="">::미정::</option>
									<option v-for="weddingDay in weddingDays" :key="weddingDay"
										:value="weddingDay">{{weddingDay}}</option>
								</select> 일
							</div>
						<span id="bankSpan">계좌정보</span> 
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
			uAddrNo: '',
			uAddr1 : "",
			uAddr2 : "",
			uEmail : "",
			birth : "",
			bank : "",
			bankaccount : "",
			weddingdays : "",
			password2 : "",
			list : [],
			image: [],
			imgUrl2: "",
			birthYear : '',
			birthMonth : '',
			birthDay : '',
			weddingYear: '',
		    weddingMonth: '',
		    weddingDay: '',
		    flg : false,
		    flg2 : false,
		    flg3: false,
		    flg4: false

		},
		computed:{
			 birthYears(){
		            const birthYears = []
		            for (var i = 1900; i<=new Date().getFullYear(); i++){
		                birthYears.push(i)
		            }
		            return birthYears;
		        },
		        birthMonths(){
		            const birthMonths =[]
		            for(var i = 1; i<=12; i++){
		                birthMonths.push(i)
		            }
		            return birthMonths
		        },
		        birthDays(){
		            const birthDays = []
		            const lastDayOfMonth = new Date(this.birthYear, this.birthMonth, 0).getDate()
		            for(var i=1; i<=lastDayOfMonth; i++){
		                birthDays.push(i)
		            }
		            return birthDays
		        }
		        ,
		        weddingYears(){
		            const weddingYears = []
		            for (var i = new Date().getFullYear(); i<=2050; i++){
		                weddingYears.push(i)
		            }
		            return weddingYears;
		        },
		        weddingMonths(){
		            const weddingMonths =[]
		            for(var i = 1; i<=12; i++){
		                weddingMonths.push(i)
		            }
		            return weddingMonths
		        },
		        weddingDays(){
		            const weddingDays = []
		            const lastDayOfMonth = new Date(this.weddingYear, this.weddingMonth, 0).getDate()
		            for(var i=1; i<=lastDayOfMonth; i++){
		                weddingDays.push(i)
		            }
		            return weddingDays
		        },
		        birthday: function(){
		        	return this.birthYear+'-'+this.birthMonth+'-'+this.birthDay;
		        },
		        weddingday : function(){
		        	var self = this;
		        	var weddingday = null;
		        	if(self.weddingYear!=''&&self.weddingMonth!=''&&self.weddingDay!=''){
		        	 weddingday = self.weddingYear+'-'+self.weddingMonth+'-'+self.weddingDay;
		        	} 
		        	return weddingday;
		        }

		}
		, watch:{
			birthYear(){
		    	if(this.flg2){
		    		this.birthDay = ''
		    	} else {
		    		this.flg2 = !this.flg2;
		    	}
		    },
		    birthMonth() {
		    	if(!this.flg){
		    		this.birthDay = ''
		    	} else {
		    		this.flg = !this.flg;
		    	}
		        
		    },
		    weddingMonth(){
		    	if(this.flg3){
		    		this.weddingDay = ''
		    	} else {
		    		this.flg3 = !this.flg3;
		    	}
		    },
		    weddingYear(){
		    	if(this.flg4){
		    		this.weddingDay = ''
		    	} else {
		    		this.flg4 = !this.flg4;
		    	}
		    }
		    
		   
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
						self.flg = true;
						self.list = data.list;
						console.log(self.list);
						self.uName = self.list.uName;
						self.partner = self.list.partner;
						self.gender = self.list.gender;
						self.uPhone = self.list.uPhone;
						self.uAddrNo = self.list.uAddrNo
						self.uAddr1 = self.list.uAddr1;
						self.uAddr2 = self.list.uAddr2;
						self.uEmail = self.list.uEmail;
						self.bank = self.list.bank;
						self.birth = self.list.birth;
						self.weddingdays = self.list.weddingday;
						self.bankaccount = self.list.bankaccount;
						
						var initiaDate = new Date(self.birth);
						self.birthYear = initiaDate.getFullYear();
						self.birthMonth = initiaDate.getMonth()+1;
						self.birthDay = initiaDate.getDate();
						console.log("weddingday", self.weddingdays)

						
						if(self.weddingdays != null){
							var initiaDate2 = new Date(self.weddingdays);
							self.weddingYear = initiaDate2.getFullYear();
							self.weddingMonth = initiaDate2.getMonth()+1;
							self.weddingDay = initiaDate2.getDate();
							
							console.log(initiaDate2, self.weddingYear, self.weddingMonth, self.weddingDay)
						}
						
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
		            } else if(self.birthYear==''||self.birthMonth==''||self.birthDay==''){
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
						uAddrNo : self.uAddrNo,
						uAddr1 : self.uAddr1,
						uAddr2 : self.uAddr2,
						uEmail : self.uEmail,
						birth : self.birthday,
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
	            ,fnAddr : function(){
		            var self = this;
		            new daum.Postcode({
		                oncomplete: function(data) {
		                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

		                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                    var address = ''; // 주소 변수
		                    

		                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                        address = data.roadAddress;
		                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                        address = data.jibunAddress;
		                    }
		                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                    self.uAddrNo = data.zonecode; // Vue 인스턴스의 데이터 변경
		                    self.uAddr1 = address; // Vue 인스턴스의 데이터 변경
		                    self.uAddr2 = ''; 
		                    // 커서를 상세주소 필드로 이동한다.
		                    /* document.getElementById("detailAddress").focus(); */
		                }
		            }).open();
		        }

		},
		created : function() {
			var self = this;
			self.fnUserInformationBefore();
			self.fnselectImage();
		}

	});
</script>
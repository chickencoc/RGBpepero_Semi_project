<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/headerLogo.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Registry.css">
	<title>회원가입 페이지</title>
</head>

<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<fieldset class="registryBox">
					<legend class="registTitle">회원가입</legend>
					<div class="registryQ">
						<p class="registryQList">아이디*</p>
						<p class="registryQList">비밀번호*</p>
						<p class="registryQList">비밀번호 확인*</p>
						<p class="registryQList">이름*</p>
						<p class="registryQList">성별*</p>
						<p class="registryQList">연락처*</p>
						<p class="registryQList">주소*</p>
						<p class="registryQList"></p>
						<p class="registryQList"></p>
						<p class="registryQList">이메일*</p>
						<p class="registryQList">생년월일*</p>
						<p class="registryQList">결혼예정일</p>
						<p class="registryQList">계좌번호*</p>
					</div>
					<div class="registryA">
						<div class="registryAList">
							<input type="text" class="registryId text1" v-model="id"
								@keyup="fnShow" id="idBox">
							<button class="checkBtn btn1" @click="fnIdCheck">중복검사</button>
							<div class="registryNote idCheck" id="idNotice">영어와 숫자 포함
								8~20 글자</div>
						</div>
						<div class="registryAList">
							<input type="password" class="registryPwd text1" v-model="pwd"
								@keyup="fnShow">
							<div class="registryNote pwdCheck" id="pwdNotice">8~20글자,
								영어 대소문자, 특수문자(!@#$%^&*)가 모두 포함되어야 합니다.</div>
						</div>
						<div class="registryAList">
							<input type="password" class="registryPwd text1"
								v-model="pwdCheck" @keyup="fnShow">
							<div class="registryNote pwd2Check" id="pwdNoticeCheck">
								비밀번호가 일치하지 않습니다.</div>
						</div>
						<div class="registryAList">
							<input type="text" class="registryName text1" v-model="name">
							배우자 이름 <input type="text" class="registryName2 text1"
								v-model="partner">
						</div>
						<div class="registryAList">
							<label class="registryGender"> <input type="radio"
								name="gender" checked v-model="gender" value="M"> 남자
							</label> <label class="registryGender"> <input type="radio"
								name="gender" v-model="gender" value="F"> 여자
							</label>
						</div>
						<div class="registryAList">
							<input type="text" class="registryPhone text1" v-model="phone1" maxlength='3'>
							- <input type="text" class="registryPhone text1" v-model="phone2" maxlength='4'>
							- <input type="text" class="registryPhone text1" v-model="phone3" maxlength='4'>
						</div>
						<div class="registryAList">
							<input type="text" class="registryAddr text1" readonly
								id="postcode" placeholder="우편번호" v-model="postcode">
							<button class="checkBtn btn1" @click="fnAddr">우편번호 검색</button>
						</div>
						<div class="registryAList">
							<input type="text" class="registryAddrDetail text1"
								placeholder="주소" id="address" v-model="addr" readonly>
						</div>
						<div class="registryAList">
							<input type="text" class="registryAddrDetail text1"
								placeholder="상세 주소 입력" v-model="addrDetail" id="detailAddress">
						</div>
						<div class="registryAList">
							<input type="email" class="registryEmail text1" v-model="email">
							@ <input type="text" class="registryEmailAddr text1"
								id="emailAddr" v-model="email2" :disabled="!isEmailAddrEditable">
							<select class="registryEmailSelect text1" id="emailSelect"
								v-model="selectedEmailDomain" v-on:change="fnEmailSelectChanged">
								<option value="">직접 입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</div>
						<div class="registryAList">
							<select id="birthdayYear" v-model="birthYear">
								<option value="">::선택::</option>
								<option v-for="birthYear in birthYears" :key="birthYear"
									:value="birthYear">{{birthYear}}</option>
							</select> 년 <select id="birthdayMonth" v-model="birthMonth">
								<option value="">::선택::</option>
								<option v-for="birthMonth in birthMonths" :key="birthMonth"
									:value="birthMonth">{{birthMonth}}</option>
							</select> 월 <select id="birthdayDay" v-model="birthDay">
								<option value="">::선택::</option>
								<option v-for="birthDay in birthDays" :key="birthDay"
									:value="birthDay">{{birthDay}}</option>
							</select> 일
						</div>
						<div class="registryAList">
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
						<div class="registryAList">
							<select v-model="bank">
								<option value="">::선택::</option>
								<option value="1">신한은행</option>
								<option value="2">기업은행</option>
								<option value="3">국민은행</option>
								<option value="4">농협은행</option>
								<option value="5">카카오뱅크</option>
								<option value="6">우리은행</option>
							</select> <input type="text" class="registryAccount text1"
								placeholder=" - 없이 입력" v-model="bankaccount">
						</div>
						<div class="btnBox">
							<button class="registryBtn btn1" @click="fnRegist">확인</button>
							<a href="#" @click="fnMain"><button class="registryBtn btn1">취소</button></a>
						</div>
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
	    	id : '',
	    	pwd : '',
	    	pwdCheck: '',
	    	name: '',
	    	partner : '',
	    	phone1 :'',
	    	phone2 :'',
	    	phone3 :'',
	    	email :'',
	    	email2 :'',
	    	addrDetail :'',
	    	bankaccount : '',
	        bank :'',
	        gender: 'M',
	        selectedEmailDomain: '',
	        birthYear : '',
	        birthMonth : '',
	        birthDay : '',
	        weddingYear: '',
	        weddingMonth: '',
	        weddingDay: '',
	        postcode : '',
	        addr : '',
	        registFlg : false
	    },
	    computed: {
	        isEmailAddrEditable() {
	        return this.selectedEmailDomain === '';
	        },
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
	        phoneNumber: function() {
	            return this.phone1+this.phone2+this.phone3;
	        },
	        emailAddr: function(){
	        	return this.email+'@'+this.email2;
	        },
	        birthday: function(){
	        	return this.birthYear+'-'+this.birthMonth+'-'+this.birthDay;
	        },
	        weddingday : function(){
	        	return this.weddingYear+'-'+this.weddingMonth+'-'+this.weddingDay;
	        }

	  },
	  watch:{
	    birthMonth() {
	        this.birthDay = ''
	    },
	    birthYear(){
	        this.birthDay = ''
	    },
	    weddingMonth(){
	        this.weddingDay= ''
	    },
	    weddingYear(){
	        this.weddingDay=''
	    },
	    
	   
	  }   
	, methods: { 	
	    	fnRegist : function(){
	            let getNumberCheck = /[0-9]/;
	            let getNameCheck = /^[가-힣|a-z|A-Z]/;
	            let getPwdCheck = /^(?=.*[!@#$%^&*])(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,20}$/;
	            
	    		var self = this;
	    		if(!self.registFlg){
	    			alert("아이디 중복체크를 완료해주세요")
	    		} else if(self.id == ''){
	                alert("아이디를 입력해주세요.")
	            } else if(self.pwd == ''||self.pwdCheck==''){
	                alert("비밀번호를 입력해주세요.")
	            } else if(self.name==''){
	                alert("이름을 입력해주세요.")
	            } else if(self.phone1==''||self.phone2==''||self.phone3==''){
	                alert("연락처를 입력해주세요.")
	            } else if(self.addr==''||self.addrDetail==''){
	                alert("주소를 입력해주세요.")
	            } else if(self.email==''||self.email2==''){
	                alert("이메일을 입력해주세요.")
	            } else if(self.birthYear==''||self.birthMonth==''||self.birthDay==''){
	                alert("생일을 입력해주세요.")
	            } else if(self.bankaccount==''||self.bank==''){
	                alert("계좌번호를 입력해주세요.")
	            } else if(!getNameCheck.test(self.name)){
	                    alert("이름이 정확하지 않습니다.");
	                    self.name='';
	            } else if(!getNumberCheck.test(self.phone1)||!getNumberCheck.test(self.phone2)||!getNumberCheck.test(self.phone3)){
					alert("전화번호는 숫자만 입력 가능합니다.");
					self.phone1='';
					self.phone2='';
					self.phone3='';
				} else if(!getNumberCheck.test(self.bankaccount)){
	                alert("계좌번호는 숫자만 입력 가능합니다.");
	                self.bankaccount = '';
	            } else if(!getPwdCheck.test(self.pwd)){
	                alert("비밀번호의 형식이 올바르지 않습니다.")
	                self.pwd='';
	                self.pwdCheck='';
	           	} else if(self.pwd != self.pwdCheck){
	           		alert("비밀번호가 일치하지 않습니다.")
	           		self.pwd='';
	                self.pwdCheck='';
	           	} else {
	           		var nparmap = {
			            userId : self.id, 
						pwd : self.pwd, 
						uName : self.name, 
						partner : self.partner,
						phoneNumber : self.phoneNumber,
						gender : self.gender,
						addrNo : self.postcode,
						addr1 : self.addr,
						addr2 : self.addrDetail,
						emailAddr : self.emailAddr,
						birthday : self.birthday,
						weddingday : self.weddingday,
						bank : self.bank,
						bankaccount : self.bankaccount};	
					$.ajax({
						url : "/userSignup.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							console.log(data);
							alert("회원가입이 완료되었습니다.")
							location.href="main.do" 
						}
					 });
	            }
			}
			,fnShow : function(){
				var self = this;
				let getIdCheck = /^[a-zA-z0-9]{8,20}$/;			
	    		if(!getIdCheck.test(self.id)){
	    			$("#idNotice").css("color", "red");
	    		}else{
	    			$("#idNotice").css("color", "green");
	    		}		
	    		let getPwdCheck = /^(?=.*[!@#$%^&*])(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,20}$/;
	    		if(!getPwdCheck.test(self.pwd)){
	    			$("#pwdNotice").css("color","red");
	    		} else{
	    			$("#pwdNotice").css("color", "green");
	    		}
	    		
	    		if(self.pwd != self.pwdCheck || self.pwdCheck==''){
	    			$("#pwdNoticeCheck").css("color", "red");
	    			$("#pwdNoticeCheck").text("비밀번호가 일치하지 않습니다.")
					} else{
						$("#pwdNoticeCheck").text("비밀번호가 일치합니다.")
		    			$("#pwdNoticeCheck").css("color", "green");
					}
	            }
	            , fnEmailSelectChanged() {
	            if (this.selectedEmailDomain === '') {
	                this.email2 = '';
	            } else {
	                this.email2 = this.selectedEmailDomain;
	            }
	        }
	        ,fnIdCheck : function () {
				var self = this;
				let getIdCheck = /^[a-zA-z0-9]{8,20}$/;	
				var nparmap = { userId: self.id };
				$.ajax({
					url: "/idCheck.dox",
					dataType: "json",
					type: "POST",
					data: nparmap,
					success: function(cnt) {
					    console.log(cnt);
				        if(!getIdCheck.test(self.id)){
			             	alert("올바른 형태의 아이디가 아닙니다.");
			             	self.id='';
			            } 
				        else if(cnt == 0){
				        	alert("사용할 수 있는 아이디입니다.")
				        	self.check=false;
				        	$("#idBox").css("pointer-events", "none");
				    		$("#idBox").css("opacity", "0.5");
				    		self.registFlg = true;
				    	} 
			            else{
				        	 alert("사용할 수 없는 아이디입니다.");
				        	 self.id='';
				    	}	
					}
				});
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
	                    self.postcode = data.zonecode; // Vue 인스턴스의 데이터 변경
	                    self.addr = address; // Vue 인스턴스의 데이터 변경
	                    self.addrDetail = ''; 
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("detailAddress").focus();
	                }
	            }).open();
	        }
	        ,fnMain : function(){
	        	var self= this;
	        	location.href="/main.do"
	        }
	        
	    }

	    , created: function () {
	    	var self = this;
	    	self.fnShow();
		}
	});
</script>
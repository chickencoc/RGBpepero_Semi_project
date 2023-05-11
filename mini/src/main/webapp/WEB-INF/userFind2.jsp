<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<link rel="stylesheet" href="/css/findPwd.css">
<title>첫번째 페이지</title>
</head>

<body>
	<div id="app">
		<div class="container">
			<div class="findPageLogo">
				<a href="http://localhost:8080/main.do">
                	<img src="/image/logo_Marrimo.png" class="logo">
                </a>
			</div>
			<fieldset class="findPwdBox" v-if="pwdFlg">
				<legend class="findPwdMent">비밀번호 찾기</legend>
				<div class="findPwd1">
					<div class="findPwdList">아이디</div>
					<div class="findPwdList">이름</div>
					<div class="findPwdList">이메일</div>
					<div class="findPwdList">인증번호</div>
				</div>
				<div class="findPwd2">
					<div class="findPwdList">
						<input type="text" class="findPwdTextBox text1"
							placeholder="아이디 입력">
					</div>
					<div class="findPwdList">
						<input type="text" class="findPwdTextBox text1"
							placeholder="이름 입력">
					</div>
					<div class="findPwdList">
						<input type="text" class="findPwdEmailBox text1"
							placeholder="이메일 입력">@ <input type="text"
							class="findPwdEmailBox text1" id="emailAddr" v-model="email2"
							:disabled="!isEmailAddrEditable"> <select
							class="findPwdEmailSelect text1" id="emailSelect"
							v-model="selectedEmailDomain" v-on:change="fnEmailSelectChanged">
							<option value="">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<button class="findPwdBtn btn1" @click="fnNotice">인증번호 받기</button>
					</div>
					<div class="findPwdList findPwdBtnBox">
						<input type="text" class="findPwdTextBox text1"
							placeholder="인증번호 6자리 입력">
						<button class="findPwdBtn btn1">인증번호 확인</button>
					</div>
				</div>
				<div class="findPwdNotice" v-if="noticeFlg">이메일로 보내드린 인증번호를
					확인해주세요.</div>
				<div class="findPwdCheck">
					<button class="findPwdCheckBtn findPwdBtn btn1" @click="fnPwd()">확인</button>
					<a href=""><button class="findPwdCheckBtn findPwdBtn btn1">아이디
							찾기</button></a>
				</div>
			</fieldset>
			<fieldset class="findPwdBox2" v-if="!pwdFlg">
				<legend class="findPwdMent">비밀번호 재설정</legend>
				<div id="findPwd2">
					<div class="findPwdList2">
						<input type="password" class="findPwdTextBoxAfter text1"
							placeholder="비밀번호 입력" v-model="pwd" @keyup="fnShow">
						<div class="findPwdNote pwdCheck" id="pwdNotice">8~20글자, 영어
							대소문자, 특수문자(!@#$%^&*)가 모두 포함되어야 합니다.</div>
					</div>
					<div class="findPwdList2">
						<input type="password" class="findPwdTextBoxAfter text1"
							placeholder="비밀번호 확인" v-model="pwdCheck" @keyup="fnShow">
						<div class="findPwdNote pwd2Check" id="pwdNoticeCheck">
							비밀번호가 일치하지 않습니다.</div>
					</div>
					<div class="findPwdCheck">
						<button class="findPwdCheckBtn findPwdBtn btn1">확인</button>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
        pwdFlg : true,
        noticeFlg : false,
        selectedEmailDomain: '',
        email : '',
        email2 : '',
        pwd :'',
        pwdCheck : ''

    },
    computed: {
        isEmailAddrEditable() {
        return this.selectedEmailDomain === '';
        }
    }   
    , methods: {
        fnPwd : function(){
            var self =this;
            self.pwdFlg = false;

        },
        fnNotice : function(){
            var self = this;
            self.noticeFlg = true
        }
        ,fnEmailSelectChanged() {
            if (this.selectedEmailDomain === '') {
                this.email2 = '';
            } else {
                this.email2 = this.selectedEmailDomain;
            }
        }
        ,fnShow : function(){
		var self = this;
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
    }   
    , created: function () {
        var self = this;
        self.fnShow();
    }
});
</script>
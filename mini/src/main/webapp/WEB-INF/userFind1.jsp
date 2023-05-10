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
	 <link rel="stylesheet" href="/css/findId.css">
	<title>아이디 찾기</title>
</head>

<body>
   <div id="app">
            <div class="container">
                <div class="findPageLogo"><img src="/image/logo_Marrimo.png"></div>
                <fieldset class="findIdBox">
                    <legend class="findIdMent">아이디 찾기</legend>
                    <div class="findIdListQ">
                        <div class="findIdList">이름</div>
                        <div class="findIdList">이메일</div>
                        <div class="findIdList">인증번호</div>
                    </div>
                    <div class="findIdListA">
                        <div class="findIdList">
                            <input type="text" class="findIdTextBox text1" placeholder="이름 입력">
                        </div>
                        <div class="findIdList">
                            <input type="text" class="findIdEmailBox text1"  placeholder="이메일 입력">@
                            <input type="text" class="findIdEmailBox text1" id="emailAddr" v-model="email2" :disabled="!isEmailAddrEditable">
                            <select class="findIdEmailSelect text1" id="emailSelect"  v-model="selectedEmailDomain" v-on:change="fnEmailSelectChanged">
                                <option value="">직접 입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                            </select>
                            <button class="findIdBtn btn1" @click="fnNotice"> 인증번호 받기</button>
                        </div>
                        <div class="findIdList">
                            <input type="text" class="findIdTextBox text1" placeholder="인증번호 6자리 입력">
                            <button class="findIdBtn btn1"> 인증번호 확인</button>
                        </div>
                    </div>
                    <div class="findIdNotice" v-if="noticeFlg">이메일로 보내드린 인증번호를 확인해주세요.</div>
                    <div class="findIdCheck"><button class="findIdCheckBtn findIdBtn btn1">확인</button></div>		
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
        noticeFlg: false,
        selectedEmailDomain: '',
        email : '',
        email2 : ''
    },
    computed: {
        isEmailAddrEditable() {
        return this.selectedEmailDomain === '';
        }
    }   
    , methods: {
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
       
    }   
    , created: function () {
        var self = this;
    }
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/layout/headerLogo.jsp"></jsp:include>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/findId.css">
	<title>아이디 찾기</title>
</head>

<body>
   <div id="app">
        <div class="container">
            <fieldset class="findIdBox boxshadowline">
            <div class="findIdContent">
               <legend class="findIdMent">아이디 찾기</legend>
               <div class="findIdListQ">
                   <div class="findIdList">이름</div>
                   <div class="findIdList">이메일</div>
                   <!--<div class="findIdList">인증번호</div>-->
               </div>
               <div class="findIdListA">
                   <div class="findIdList">
                       <input type="text" class="findIdTextBox text1" placeholder="이름 입력" v-model="name">
                   </div>
                   <div class="findIdList">
                       <input type="text" class="findIdEmailBox text1"  placeholder="이메일 입력" v-model="email">@
                       <input type="text" class="findIdEmailBox text1" id="emailAddr" v-model="email2" :disabled="!isEmailAddrEditable">
                       <select class="findIdEmailSelect text1" id="emailSelect"  v-model="selectedEmailDomain" v-on:change="fnEmailSelectChanged">
                           <option value="">직접 입력</option>
                           <option value="naver.com">naver.com</option>
                           <option value="daum.net">daum.net</option>
                           <option value="gmail.com">gmail.com</option>
                       </select>
                       <button class="findIdBtn btn1" @click="fnNameCheck"> 이메일 인증 </button>
                   </div>
                  <!--<div class="findIdList">
                       <input type="text" class="findIdTextBox text1" placeholder="인증번호 6자리 입력">
                       <button class="findIdBtn btn1" @click=fnCode> 인증번호 확인</button>
                   </div>-->
               </div>
               <div class="findIdNotice" v-if="noticeFlg">이메일 인증을 완료해주세요.</div>
               <div class="findIdCheck"><button class="findIdCheckBtn findIdBtn btn1" @click="fnFindId">아이디 찾기</button></div>		
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
        noticeFlg: false,
        selectedEmailDomain: '',
        email : '',
        email2 : '',
        name:'',
        checkFlg : false,
        userId : ''
    },
    computed: {
        isEmailAddrEditable() {
        return this.selectedEmailDomain === '';
        },
        emailAddr: function(){
        	return this.email+'@'+this.email2;
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
        ,fnMain : function(){
        	location.href="main.do"
        }
        ,fnNameCheck : function(){
        	var self= this;
        	var nparmap = {uName : self.name, emailAddr : self.emailAddr};
        	console.log(nparmap)
        	$.ajax({
    			url : "/userFindId.dox",
    			dataType : "json",
    			type : "POST",
    			data : nparmap,
    			success : function(data) {
    				console.log("data", data)
    				self.userId = data.info.userid
    				console.log("data.info", data.info)
    						console.log(self.userId)
    				if(data.result == 'success'){
    					alert("인증이 완료되었습니다.")
    		        	self.checkFlg = true;
    				}else{
    					alert("이름과 이메일이 일치하지 않습니다.")
    					self.name='';
    					self.email='';
    					self.email2='';
    					}
    				
    				}
    			});
        }
        ,fnFindId : function(){
        	var self = this;
        	if(!self.checkFlg){
        		alert("인증을 완료해주십시오.")
        	} else{
        		alert("당신의 아이디는 '"+self.userId+"' 입니다.")
        		location.href = "userLogin.do"
        	}
        }
        ,fnCode : function(){
        	var self = this;
        	self.checkFlg = true;
        }
       
    }   
    , created: function () {
        var self = this;
    }
});
</script>
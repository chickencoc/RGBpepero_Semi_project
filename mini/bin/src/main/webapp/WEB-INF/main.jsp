<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="js/jquery.js"></script>
		<script src="js/vue.js"></script>
		<title>회원가입</title>
		<style>
	        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	        * {
	            font-family: 'Noto Sans KR', sans-serif;
	        }
	
	        body {
	            background-color: #1BBC9B;
	        }
	
	        .div1 {
	            margin: auto;
	            width: 300px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	         .div2 {
	            margin: auto;
	            width: 250px;
	            background-color: #EEEFF1;
	            border-radius: 5px;
	            text-align: center;
	            padding: 20px;
	        }
	
	        input {
	            width: 100%;
	            padding: 10px;
	            box-sizing: border-box;
	            border-radius: 5px;
	            border: none;
	        }
	
	        .in {
	            margin-bottom: 10px;
	        }
	
	        #btn {
	            background-color: #1BBC9B;
	            margin-bottom: 30px;
	            color: white;
	        }
	
	        a {
	            text-decoration: none;
	            color: #9B9B9B;
	            font-size: 12px;
	        }
    	</style>
	</head>
	<body>
		<div id="app" class="div1">
			<div class="div2">
				<input type="text" class="in"  v-model="info.id" disabled></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="기존비밀번호" v-model="pwd3"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호 (8~16자)" v-model="pwd"></input>
			</div>
			<div class="div2">
				<input type="password" class="in" placeholder="비밀번호 확인" v-model="pwd2"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="이름" v-model="info.name"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="닉네임" v-model="info.nickname"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="나이" v-model="info.age"></input>
			</div>
			<div class="div2">
				<input type="text" class="in" placeholder="생년월일(6자리)" v-model="info.birth"></input>
			</div>
			<div class="div2">
				<input type="email" class="in" placeholder="이메일" v-model="info.email"></input>
			</div>
			<div class="div2">
			<label>성별 : 
				<select v-model="info.gender">
					<option value="M">남자</option>
					<option value="F">여자</option>
				</select>
			</label>
			</div>
			<div class="div2">
			<label>주소 : 
				<select v-model="info.address">
					<option value="서울" >서울</option>
					<option value="인천" >인천</option>
					<option value="경기도 고양">경기 고양</option>
					<option value="부산">부산</option>
					<option value="강원도">강원</option>
				</select>
			</label>
			</div>
			<div class="div2">
				<button id="btn" @click="fnCheck" >정보 수정</button>
			</div>
			<a href="find.do">비밀번호를 잊어버리셨나요?</a>
		</div> 
	</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	info : {}
    	, sessionId : "${sessionId}"
    	, id : ""
    	, pwd : ""
    	, pwd2 : ""
    	, pwd3 : ""
    	, name : ""
    	, nickname : ""
    	, age : ""
    	, birth : ""
    	, email : ""
    	, gender : "M"
    	, address : "서울"
    	, idEnable : ""
    	, idFlg : "N"
    	, user : {}
    	, list : []
    }   
    , methods: {
    	fnGetInfo : function(){
    		var self = this;
            var nparmap = {id : self.sessionId};
            $.ajax({
                url:"/mypage.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	
                	console.log(data)
	                self.info = data.info;
                	console.log(self.info);
                	/* self.title = self.info.title;
	                self.content = self.info.content; */
	                
                }
            }); 
    	},
    	fnEditInfo : function(){
    		var self = this;
            var nparmap = self.user;
            $.ajax({
                url:"/editinfo.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	self.list = data.list
                	alert("저장되었습니다.");
					location.href = "bbs.do";
                }
            });
    		
    	},fnIdFlg : function(){
    		var self = this;
    		self.idFlg = "N";
    	},
    	fnIdCheck : function(){
    		var self = this;
            var nparmap = {id : self.id};
            if(self.id == ''){
            	self.idFlg == 'N';
            	return;
            }
            $.ajax({
                url:"/idCheck.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	if(data.hasId == "True"){
                		self.idEnable = "사용 불가";
                		return;
                	}else{
                		self.idEnable = "사용 가능";
                		self.idFlg = "Y";
                	}
                }
            });
    		
    	},
    	fnCheck : function(){
    		var self = this;
    		if(self.pwd3 == ''){
    			alert("기존 비밀번호를 입력해주세요.");
    			return;
    		}else if(self.pwd3 != self.info.password){
    			alert("기존 비밀번호가 일치하지 않습니다.");
    			return;
    		}else if(self.pwd == ''){
    			alert("비밀번호를 입력해주세요.");
    			return;
    		}else if(self.pwd2 == ''){
    			alert("확인 비밀번호를 입력해주세요.");
    			return;
    		}else if(self.pwd != self.pwd2){
    			alert("비밀번호가 일치하지 않습니다.");
    			return;
    		}/* else if(self.pwd.length<8 || self.pwd.length>16){
    			alert("비밀번호는 8자 이상, 16자 이하여야 합니다.");
    			return;
    		} */else if(self.pwd == self.info.password){
    			alert("비밀번호는 기존 비밀번호와 동일할 수 없습니다.");
    			return;
    		}else if(self.info.name == ''){
    			alert("이름을 입력해 주세요.");
    			return;
    		}else if(self.info.nickname == ''){
    			alert("닉네임을 입력해 주세요.");
    			return;
    		}else if(self.info.age == ''){
    			alert("나이를 입력해 주세요.");
    			return;
    		}else if(self.info.birth == ''){
    			alert("생년월일을 입력해 주세요.(6자)");
    			return;
    		}else if(self.info.birth.length != 6){
    			alert("생년월일은 6자 입니다.");
    			return;
    		}else if(self.info.birth == ''){
    			alert("생년월일을 입력해 주세요.(6자)");
    			return;
    		}else if(self.info.email == ''){
    			alert("이메일을 입력해 주세요.");
    			return;
    		}else if(self.info.gender == ''){
    			alert("성별을 선택해 주세요.");
    			return;
    		}else if(self.info.address == ''){
    			alert("주소를 선택해 주세요.");
    			return;
    		}else{
    			self.user = {
    					id : self.sessionId ,
    					pwd : self.pwd ,
    					name : self.info.name ,
    					nickname : self.info.nickname ,
    					age : self.info.age ,
    					birth : self.info.birth ,
    					email : self.info.email ,
    					gender : self.info.gender ,
    					address : self.info.address 
    			};
    			self.fnEditInfo();
    		}
    	}
    	
    }   
    , created: function () {
    	var self = this;
    	self.fnGetInfo();
	}
});
</script>
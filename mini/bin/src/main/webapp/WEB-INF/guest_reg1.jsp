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
<link rel="stylesheet" href="/css/guest_reg1.css">
<title>비회원 정보 입력</title>
</head>

<body>
	<div id="app">
		<div class="container">
			<div class="findPageLogo">
				<img src="/image/logo_Marrimo.png">
			</div>
			<div class="guestRegistBanner">
				<img src="/image/return.jpg" id="guestRegistBannerImg">
				<div class="guestRegistBannerText">
					<p>감사의 마음을 담은 답례품을 보내드릴게요</p>
					<p>정보를 입력해주세요</p>
				</div>
			</div>
			<fieldset class="guestRegistBox">
				<legend class="guestRegistTitle">비회원 정보 입력</legend>
				<div class="guestRegistListQ">
					<div class="guestRegistList">이름</div>
					<div class="guestRegistList">이메일</div>
					<div class="guestRegistList">연락처</div>
					<div class="guestRegistList">주소</div>
					<div class="guestRegistList"></div>
					<div class="guestRegistList"></div>
				</div>
				<div class="guestRegistListA">
					<div class="guestRegistList">
						<input type="text" class="findIdTextBox text1" placeholder="이름 입력"
							v-model="name">
					</div>
					<div class="guestRegistList">
						<input type="text" class="guestRegistEmailBox text1"
							placeholder="이메일 입력" v-model="email"> @ <input
							type="text" class="guestRegistEmailBox text1" id="emailAddr"
							v-model="email2" :disabled="!isEmailAddrEditable"> <select
							class="guestRegistryEmailSelect text1" id="emailSelect"
							v-model="selectedEmailDomain" v-on:change="fnEmailSelectChanged">
							<option value="">직접 입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
					</div>
					<div class="guestRegistList">
						<input type="text" class="guestPhoneText" placeholder="연락처"
							v-model="phone1"> - <input type="text"
							class="guestPhoneText" placeholder="연락처" v-model="phone2">
						- <input type="text" class="guestPhoneText" placeholder="연락처"
							v-model="phone3">
					</div>
					<div class="guestRegistList">
						<input type="text" class="guestRegistryAddr text1" disabled
							id="postcode" placeholder="우편번호" v-model="postcode">
						<button class="guestRegistBtn btn1" @click="fnAddr">우편번호
							검색</button>
					</div>
					<div class="guestRegistList">
						<input type="text" class="guestRegistryAddrDetail text1"
							placeholder="주소" disabled id="address" v-model="address">
					</div>
					<div class="guestRegistList">
						<input type="text" class="guestRegistryAddrDetail text1"
							placeholder="상세 주소 입력" v-model="addrDetail" id="detailAddress">
					</div>
				</div>
				<div class="findIdCheck">
					<button class="guestRegistryCheckBtn findIdBtn btn1"
						@click="fnConfirm">다음 단계</button>
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
        postcode : '',
        address : '',
        name: '',
	    phone1 :'',
	    phone2 :'',
	    phone3 :'',
	    email :'',
	    email2 :'',
	    addrDetail :'',
        selectedEmailDomain: '',
        addr2:''
    },
    computed: {
        isEmailAddrEditable() {
        return this.selectedEmailDomain === '';
        }   
    }   
    , methods: {
        fnAddr : function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var address = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    address = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    address = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample6_extraAddress").value = extraAddr;
                
                 } //else {
                //     document.getElementById("sample6_extraAddress").value = '';
                // }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = address;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    },
    fnConfirm : function(){
        var self = this;
        if(confirm("정확한 정보를 입력하셨나요? 한 번 더 확인 부탁드립니다.")){
            self.fnRegist()
        }
    } 
    ,fnEmailSelectChanged() {
        if (this.selectedEmailDomain === '') {
            this.email2 = '';
        } else {
            this.email2 = this.selectedEmailDomain;
        }
    }
    ,fnRegist : function (){
                let getNumberCheck = /[0-9]/;
                let getNameCheck = /^[가-힣|a-z|A-Z]/;
                var self = this;
                if(self.name==''||
                    self.email==''||
                    self.email2==''||
                    self.phone1==''||
                    self.phone2==''||
                    self.phone3==''||
                    self.addr2==''||
                    self.address==''||
                    self.addrDetail==''){
                        alert("모든 정보를 입력해주세요.");
                    }
                    else if(!getNameCheck.test(self.name)){
                        alert("이름이 정확하지 않습니다.")
                    }
                    else if(!getNumberCheck.test(self.phone1)||!getNumberCheck.test(self.phone2)||!getNumberCheck.test(self.phone3)){
                        alert("전화번호는 숫자만 입력 가능합니다.");
                    }

			// } else{
	    	// 		var nparmap = {id : self.id, 
			//     			pwd : self.pwd, 
			//     			name : self.name, 
			//     			nickname : self.nickname,
			//     			age : self.age,
			//     			gender : self.gender,
			//     			address : self.address};	
			// 		  	$.ajax({
			// 				url : "/regist.dox",
			// 				dataType : "json",
			// 				type : "POST",
			// 				data : nparmap,
			// 				success : function(data) {
								
			// 					console.log(data);
			// 					alert("회원가입 완료");
			// 					self.id='';
			// 					self.pwd='';
			// 					self.pwd2='';
			// 					self.name='';
			// 					self.age='';
			// 					self.gender='';
			// 					self.address='';
			// 					self.nickname='';
								
			// 					self.check=true;
			// 	        	   	$("#idBox").css("pointer-events", "auto");
			// 	    			$("#idBox").css("opacity", "1.0");
			// 					}
			// 				});
            // }
			}
       
    }   
    , created: function () {
        var self = this;
    }
});
</script>
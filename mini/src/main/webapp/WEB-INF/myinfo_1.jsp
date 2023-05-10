<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>회원정보 수정</title>
    <style>
        /* style START */
        .container{
      margin: auto;
    }
    .container fieldset{
      padding-top: 40px;
    
    }
    fieldset #information{
      margin-left: 200px;
    }
    #information input{
      margin-left: 15px;

    }
    fieldset{
      width: 900px;
      height: 700px;
      margin: auto;
      margin-top: 30px;
      line-height: 40px;
    
    }
    #post {
      margin-left: 10px;
    }
    #information button{
      border-radius: 30px;
      color: white;
      background-color: black;
      border: 1px solid black;
      width: 120px;
      height: 50px;
      margin-left: 200px;
      margin-top: 25px;
    }
    #information select{
      margin-bottom: 10px;
      width: 50px;
    }
    #bank{
      margin-left: 63px;
    }
    fieldset #profile{
      margin-top: 10px;
      position: absolute;
      margin-left: 30px;
    }
    fieldset input{
      border: 2px solid black;
    }
    fieldset select{
      border: 2px solid black;
    }
    #idd{
      border: 2px;
    }
    .product_category_list > a:not(:last-child):after {
        content: '';
        display: inline-block;
        width: 2px;
        height: 15px;
        background: #999;
        position: relative;
        top: 2px;
        margin-left: 13px;
       }
       .product_category_list > a {
        margin: 0 5px;
       }
       .product_category_list{
        text-align: center;
       }
   .inputid{
    margin-left: 100px
   }
   #idline span{
    margin-left: 75px;
    color: gray;
   }
   #pwline input{
    margin-left: 55px;
   }
   #pwline2 input{
    margin-left: 22px;
   }
   #nameAndPartner #name{
    margin-left: 86px;
   }
   #gender #male{
    margin-left: 90px;
   }
   #phoneNumber #phone{
    margin-left: 57px;
   }
   #addresses #address1{
    margin-left: 87px;
   }
   #addresses #address2{
    margin-left: 121px;
    width: 300px;
   }
   #addresses #address3{
    margin-left: 121px;
   }
   #mail #email1{
    margin-left: 72.5px;
   }
   #birth #birthYear{
    margin-left: 57.5px; width: 70px; margin-right: 10px;
   }
   #birth #birthMonth{
    width: 70px; margin-right: 10px;
   }
   #birth #birthDay{
    width: 70px; margin-right: 10px;
   }
   #bankInfo select{
    width: 60px;
    margin-left: 57.5px;
   }


        /* style END */
    </style>
</head>
<body>
    <div id="wrapper">
        <div class="container">
            <div class="product_category_list">
              <a href=""><strong>회원정보</strong></a>
              <a href="">나의 레지스트리</a>
              <a href="">받은 선물 목록</a>
              <a href="">보낸답례품</a>
              <a href="">캘린더</a>
            </div>
            <fieldset>
              <img src="../image/profile.PNG" id="profile">
              <div id="information">
                <div id="idline">
                  아이디<span>test123</span>
                </div>
                <div id="pwline">
                  <label>비밀번호 <input type="password" id ="pw" placeholder="***"></label>
                </div>
                <div id="pwline2">
                  <label>비밀번호 확인 <input type="password" id ="pw2" placeholder="***"></label>
                </div>
                <div id="nameAndPartner">
                  <label>이름 <input type="text" id ="name" placeholder="홍길동"></label>
                  <label>배우자명 <input type="text" id ="partner" placeholder="홍찰찰"></label>
                </div> 
                <div id="gender">
                  <label>성별<input type="radio" id="male" value="M" name="gender" checked>남자</label>
                  <label><input type="radio" id="female" value="F" name="gender">여자</label>
                </div>
                <div id="phoneNumber">
                  <label>전화번호 <input type="tel" id = "phone"  placeholder="010-****-****"></label>
                </div>
                <div id="addresses">
                  <label>
                    주소 <input type="text" id = "address1" placeholder="사랑시">
                  </label>
                    <a id="post">우편번호</a>
                  <label><input type="text" id = "address2" placeholder="고백구 행복동"></label>
                  <label><input type="text" id = "address3" placeholder="**아파트 301호"></label>
                </div>
                <div id="mail">
                  <label>이메일 <input type="email" id="email1" placeholder="***@naver.com"></label>
                </div>
                <div id="birth">
                  생년월일
                  <input type="number" id="birthYear"placeholder="1999">년
                  <input type="number" id="birthMonth" placeholder="09">월        
                  <input type="number" id="birthDay" placeholder="09">일        
                </div>
                <div id="bankInfo">
                  계좌정보 
                  <select id ="bank">
                    <option>국민</option>
                    <option>우리</option>
                    <option>신한</option>
                    <option>기업</option>
                    <option>농협</option>
                    <option>하나</option>
                  </select>
                  <input type ="text" id ="bankNumber" placeholder="299-123456-444455">
                </div>
                <button id="btn">수정완료</button>
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

    }   
    , methods: {

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
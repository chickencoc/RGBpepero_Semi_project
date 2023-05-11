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
      line-height: 50px;
    
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
   #pwline span{
    margin-left: 60px;
    color: gray;
   }
   #pwline2 span{
    margin-left: 27px;
    color: gray;
   }
   #nameAndPartner #name{
    margin-left: 86px;
    color: gray;
    margin-right: 50px;
   }
   #nameAndPartner #partner{
    margin-left: 22px;
    color: gray;
   }
   #gender #male{
    margin-left: 90px;
   }
   #phoneNumber #phone{
    margin-left: 57px;
    color: gray;
   }
   #addresses #address1{
    margin-left: 84px;
    color: gray;
   }
   #mail #email1{
    margin-left: 72.5px;
    color: gray;
   }
   #birth #birthYear{
    margin-left: 57.5px; width: 70px; margin-right: 10px;
    color: gray;
   }
   #birth #birthMonth{
    width: 70px; margin-right: 10px;
    color: gray;
   }
   #birth #birthDay{
    width: 70px; margin-right: 10px;
    color: gray;
   }
   #bankInfo #bank{
    margin-left: 57.5px;
    color: gray;
   }
   #bankInfo #bankNumber{
    margin-left: 30px;
    color: gray;
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
                  아이디<span  id="id">test123</span>
                </div>
                <div id="pwline">
                  비밀번호<span id="pw">********</span>
                </div>
                <div id="pwline2">
                  비밀번호 확인<span id="pw2">********</span>
                </div>
                <div id="nameAndPartner">
                  이름 <span id="name">홍길동</span>
                  배우자명 <span id="partner">홍찰찰</span>
                </div> 
                <div id="gender">
                  <label>성별<input type="radio" id="male" value="M" name="gender" checked>남자</label>
                  <label><input type="radio" id="female" value="F" name="gender">여자</label>
                </div>
                <div id="phoneNumber">
                  전화번호<span id="phone">010-xxxx-xxxx</span> 
                </div>
                <div id="addresses">
                    주소 <span id="address1">사랑시 고백구 행복동 xx아파트 301호</span>
                </div>
                <div id="mail">
                  이메일 <span id="email1">xxx@naver.com</span>
                </div>
                <div id="birth">
                  생년월일
                  <span id="birthYear">1999</span>년
                  <span id="birthMonth">09</span>월        
                  <span id="birthDay">09</span>일        
                </div>
                <div id="bankInfo">
                  계좌정보 
                  <span id="bank">국민</span>
                  <span id ="bankNumber">299-5555-55555</span>
                </div>
                <button id="btn">수정완료</button>
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

    }   
    , methods: {

    }   
    , created: function () {
    	var self = this;

	}
});
</script>
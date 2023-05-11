<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	 <title>식장 관리 페이지</title>
    <style>
        .container{
            margin: auto;
            width: 1200px;
            height: 600px;   
        }
        .container h1{
            margin-top: 10px;
            font-size: 40px;
            margin-left: 150px;
            margin-bottom: 10px;
        }
        .container .wedding_Information_Box{
            width: 900px;
            height: 400px;
            margin: auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
            display: grid;
            grid-template-columns: 400px 500px;
        }
        .wedding_Information_Box .changeImg{
            border: 1px solid #D9D9D9;
            width: 300px;
            height: 200px;
            background-color: #D9D9D9;
            margin-left: 50px;
            margin-top: 85px;
            text-align: center;
        }
        .wedding_Information .wedding_Hall_Name{
          width: 350px; 
          margin: 20px;
          margin-top: 60px;
        }
        .wedding_Information .wedding_Hall_Location_List{
          width: 350px;
          margin: 20px;  
        }
        .wedding_Information .wedding_Hall_Address{
          margin: 20px;
          width: 350px;
        }
        .wedding_Information .wedding_Hall_URL{
          margin: 20px;  
          width: 350px;
          margin-left: 13px;
        }
        .buttons #del_Btn{
          margin-left : 150px;
          margin-right : 10px;
          width: 130px;
          height: 40px;
          margin-top: 10px;  
          background-color: black;
          color: white;
          border: solid 1px black;
        }
        .buttons #back_Btn{
          margin-right : 10px;
          width: 130px;
          height: 40px;
          margin-top: 10px;  
          background-color: black;
          color: white;
          border: solid 1px black;
        }
        .buttons #sub_Btn{
          margin-right : 10px;
          width: 130px;
          height: 40px;
          margin-top: 10px;  
          background-color: black;
          color: white;
          border: solid 1px black;
        }
        .wedding_Information label{
           width: 100px; 
           height: 100px;
        }
        .changeImg #plus{
            margin-top: 70px;
        }

    </style>
</head>
<body>
<div id="app">
    <div id="wrapper">
        <div class="container">
            <h1>식장정보 관리</h1>
           <fieldset class="wedding_Information_Box">
                <div class="changeImg">
                    <img src="../image/plus.png" id="plus">
                </div>
                <div class="wedding_Information">
                    <div><label>웨딩홀 이름 <input type="text" class="wedding_Hall_Name"></label></div>
                    <div><label>웨딩홀 주소 <input type="text" class="wedding_Hall_Address"></label></div>
                    <div><label>웨딩홀 URL <input type="text" class="wedding_Hall_URL"></label></div>
                    <div class="wedding_Hall_Location">
                        웨딩홀 지역 
                        <select class="wedding_Hall_Location_List"> 
                            <option>지역선택</option>
                            <option>서울</option>
                            <option>경기</option>
                            <option>강원</option>
                            <option>경북</option>
                            <option>경남</option>
                            <option>충북</option>
                            <option>충남</option>
                            <option>전남</option>
                            <option>전북</option>
                        </select> 
                    </div>
                </div>
           </fieldset>
           <div class="buttons">
                <button id="del_Btn">삭제</button>
                <button id="back_Btn">돌아가기</button>
                <button id="sub_Btn">등록하기</button>
            </div>
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
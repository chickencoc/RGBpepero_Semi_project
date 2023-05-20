<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>여행지 상세 페이지</title>
    <style>
        .container{
            margin: auto;
            height: 1400px;
            width: 1200px;
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
        margin-top: 10px;
        margin-bottom: 10px;
       }
        .container .travelBanner{
            text-align: center;
        }
        .container #travelBanner2{
            width: 1200px;
            height: 400px;
            margin-bottom: 30px;
        }
        #explane h1{
            font-size: 35px;
            text-align: center;
            margin-bottom: 50px;
        }
        #miniExplane h1{
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        #picture1 #boracay{
            width: 1000px;
            height: 350px;
        }
        .container #picture1{
            text-align: center;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        .container hr{
            margin-bottom: 20px;
        }
        
        #api #box{
            width: 1000px;
            height: 200px;
            border: 1px solid black;
            background-color: gray;
            text-align: center;
        }
        #api #apiExplane{
            margin-bottom: 20px;
        }
        #api #apiBox{
            text-align: center;
            margin-bottom: 40px;
            margin-left: 100px;
        }
        .fundingBtn button{
            border: 1px solid black;
            border-radius: 50px;
            padding: 20px 30px;
            background-color: black;
            color: white;
            margin-left: 510px;
        }
   
    </style>
</head>
<body>
<div id="app">
    <div id="wrapper">
        <div class="container">
            <div class="product_category_list">
                <a href="">침실</a>
                <a href="">거실</a> 
                <a href="">드레스룸</a> 
                <a href="">주방</a>
                <a href="">다용도실</a>
                <a href="">욕실</a> 
                <a href="">식장</a>
                <a href=""><strong>여행</strong></a>
            </div>
            <div class="travelBanner"><img src="/image/sunsetSea.jpg" id="travelBanner2"></div>
            <div id="explane">
                <h1>보라카이</h1>
            </div>
            <div id="miniExplane">
                <h1>필리핀 마닐라의 섬</h1>
                <h1>야자수가 늘어선 해변에 새하얀 모래,</h1>
                <h1>에메랄드빛 투명한 바다로 유명한 휴양지다.</h1>
            </div>
            <div id="picture1">
                <img src="/image/beach2.jpg" id="boracay">
            </div>
            <hr>
            <div id="api">
                <div id="apiExplane">보라카이 API</div>
                <div id="apiBox">
                    <div id="box">api 넣을거임</div>
                </div>
            <hr>  
            <div class="fundingBtn">
                <button>펀딩레지스트리 등록</button>
            </div>
               
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
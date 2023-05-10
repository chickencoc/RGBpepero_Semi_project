<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>식장 페이지</title>
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
       .weddingMain #mainWeddingImg{
        height: 400px;
        width: 97.5%;
       }
       .weddingMain{
        text-align: center;
       }
       .explaneBox1 .weddingRec{
        border: 1px solid black;
        background-color: black;
        width: 120px;
        height: 30px;
        margin-top: 10px;
        color: white;
        text-align: center;
        margin-left: 15px;
       }
        .imgBox1{
        border: 1px solid #D9D9D9;
        width: 270px;
        height: 220px;
        margin: 15px;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
    
       }
       .imgBox1 #weddingImg1{
        width: 190px;
        height: 150px;
        margin-top: 15px;
       }
       .imgBox1 #weddingImg2{
        width: 190px;
        height: 150px;
        margin-top: 15px;
       }
       .imgBox1 #weddingImg3{
        width: 190px;
        height: 150px;
        margin-top: 15px;
       }
       .imgBox1 #weddingImg4{
        width: 190px;
        height: 150px;
        margin-top: 15px;
       }
       .options .produce{
        float: right;
       }
       .grid_Area2{
            display: grid;
            grid-template-columns: 300px 300px 300px 300px;
       }
       .grid_Area2 .imgBox2{
        border: 1px solid #D9D9D9;
        width: 270px;
        height: 270px;
        margin: 15px;
        text-align: center;
        box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
       }
       .imgBox2 #weddingImg5{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg6{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg7{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg8{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg9{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg10{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg11{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .imgBox2 #weddingImg12{
        width: 200px;
        height: 170px;
        margin-top: 15px;
       }
       .options .location{
        margin-left: 15px;
       }
       .options .produce{
        margin-right: 15px;
       }
       .container .page{
        text-align: center;
       }
      .modifyButton{
        text-align: center;
      }
      .modifyButton .modify{
        background-color: black;
        color: white;
        width: 100px;
        height: 40px;
      }
      .imgBox1 img{
        margin-bottom: 10px;
        filter: drop-shadow(3px 3px 3px #000);
        
      }
      .imgBox2 img{
        margin-bottom: 10px;
        filter: drop-shadow(3px 3px 3px #000);
      }
      .grid_Area1{
        display: grid;
        grid-template-columns: 300px 300px 300px 300px;
      }
      
     #grid_Area1_ImgBox1{
        grid-column-start:1;
    }
 
    </style>
</head>
<body>
    <div id="wrapper">
        <div class="container">
            <div class="product_category_list" >               
                <a href="">침실</a>
                <a href="">거실</a> 
                <a href="">드레스룸</a> 
                <a href="">주방</a>
                <a href="">다용도실</a>
                <a href="">욕실</a> 
                <a href=""><strong>식장</strong></a>
                <a href="">여행</a>
            </div>
            <div class="weddingMain">
                <img src="../image/mainWedding.jpg" id="mainWeddingImg">
            </div>
            <div class="explaneBox1">
                <div class="weddingRec">웨딩홀 추천</div>
            </div>
            <div class="grid_Area1">
                    <div class="imgBox1" id="grid_Area1_ImgBox1">
                        <div><img src="../image/widdingHall1.jpg" id="weddingImg1"></div>
                        <a href="" class="shortCut">바로가기</a>
                    </div>
                    <div class="imgBox1" id="grid_Area1_ImgBox2">
                        <div><img src="../image/widdingHall2.jpg" id="weddingImg2"></div>
                        <a href="" class="shortCut">바로가기</a></div>
                    <div class="imgBox1" id="grid_Area1_ImgBox3">
                        <div><img src="../image/widdingHall3.jpg" id="weddingImg3"></div>
                        <a href="" class="shortCut">바로가기</a>
                    </div>
                    <div class="imgBox1" id="grid_Area1_ImgBox4">
                        <div><img src="../image/widdingHall4.jpg" id="weddingImg4"></div>
                        <a href="" class="shortCut">바로가기</a>
                    </div>
            </div>
            <div class="options">
                <select class="location">
                    <option>지역선택창</option>
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
                <select class="produce">
                    <option>가격순</option>
                    <option>인기순</option>
                    <option>최신순</option>
                </select>
            </div>
            <div class="grid_Area2">
                <div class="imgBox2">
                    <div><img src="../image/weddingHall5.jpg" id="weddingImg5"></div>
                    <div class="hall_Location">서울</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall6.jpg" id="weddingImg6"></div>
                    <div class="hall_Location">충남</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall7.jpg" id="weddingImg7"></div>
                    <div class="hall_Location">충북</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall8.jpg" id="weddingImg8"></div>
                    <div class="hall_Location">전남</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall9.jpg" id="weddingImg9"></div>
                    <div class="hall_Location">경남</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall10.jpg" id="weddingImg10"></div>
                    <div class="hall_Location">전북</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall11.jpg" id="weddingImg11"></div>
                    <div class="hall_Location">경북</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
                <div class="imgBox2">
                    <div><img src="../image/weddingHall12.jpg" id="weddingImg12"></div>
                    <div class="hall_Location">강원</div>
                    <a href="" class="hall_Name">xxx 예식장</a>
                </div>
            </div>    
            <div class="page"> 
                <img src="../image/direction2.png" id="arrowLeft"> 1 <img src="../image/direction.png" id="arrowRight">
            </div>
            <div class="modifyButton">
                <button class="modify">수정하기</button>
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
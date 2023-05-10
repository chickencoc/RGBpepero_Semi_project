<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>여행지 추천</title>
    <style>
        .container{
            margin: auto;
            height: 1300px;
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

        .container #tripText{
            font-size: 30px;
        }
        .container #travelBanner2{
            width: 1200px;
            height: 400px;
            margin-bottom: 30px;
        }
        .grid_Box1{
            background-color: #D9D9D9;
            width: 1200px;
            height: 800px;
            place-items: center;
            display: grid;
            grid-template-columns: 1fr 1fr 1fr;
            margin-top: 10px;
        }
        #search_Box{padding-top: 100px;}
        #search_Box img{height: 25px;width: 20px;}
        #search{
            text-align: center;
            margin-top: 20px;
        }
        #readingGlass{
            position: absolute;
            margin-left: 215px;
            margin-top: -27px;
        }
        #img1{
            width: 20px;
        }
        #boracay{
            width: 200px;
            height: 200px;
            margin-bottom: 10px;
        }
        .travel_Box{
            background-color: white;
            width: 325px;
            height: 325px;
            text-align: center;
            margin: 30px;
            padding-top: 40px;
        }
        .travel_Box img{ 
            width: 200px;
            height: 200px;
            margin-bottom: 10px;
        }
        #radioAndSelect{
            margin : 10px 20px;
        }
        #radioAndSelect #out_Travel{
            margin-right: 20px;
        }
        #radioAndSelect #in_Travel{
            margin-right: 20px;
        }
        #radioAndSelect select{
           width: 94px;
            margin-left: 10px;
        }
        #page{
            text-align: center;
            margin-top: 35px;
        }
   
    </style>
</head>
<body>
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
            <div class="travelBanner"><img src="../image/travelBanner.jpg" id="travelBanner2"></div>
            <div id="tripText">여행지 추천</div>
            <div id="radioAndSelect">
                <span id="out_Travel"><input type="radio" name="tripKind"> 해외 </span>
                <span id="in_Travel"><input type="radio" name="tripKind"> 국내 </span>
                <select>
                    <option>인기순</option>
                    <option>최신순</option>
                </select>
             </div>   
            <div class="grid_Box1">
                <div id="search_Box" class="travel_Box">
                    <div>떠나고싶은 여행지</div>
                    <input id="search" type="text" placeholder="여행지 검색">
                    <div id="readingGlass"><img src="../image/search.PNG" id="img1"></div>
                </div>
                <div class="travel_Box">
                    <div>
                       <img src="../image/beach1.jpg" id="boracay">
                    </div>
                    보라카이
                </div>
                <div class="travel_Box">
                   <div>
                    <img src="../image/osaka1.jpg" id="osaka">
                   </div>
                    오사카
                </div>
                <div class="travel_Box">
                   <div>
                    <img src="../image/prague2.jpg" id="prague">
                   </div>
                    프라하
                </div>
                <div class="travel_Box">
                   <div>
                    <img src="../image/hamburg1.jpg" id="hamburg">
                   </div>
                    함부르크
                </div>
                <div class="travel_Box">
                   <div><img src="../image/santorini1.jpg" id="santorini"></div>
                    산토리니
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
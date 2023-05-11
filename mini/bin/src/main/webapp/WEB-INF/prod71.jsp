<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>리뷰 수정 페이지</title>
    <style>
        .container{
            margin: auto;
            width: 1000px;
            height: 750px;

        }
        .review_Modify_Title{
            font-size: 3rem;
            text-align: center;
            margin: 20px;
            font-weight: bold;
        }
        .grid_Area_Container{
            display: grid;
            grid-template-columns: 800px;
            grid-template-rows: 130px 130px 300px 120px;
            margin: auto;
            border: 1px solid black;
            padding: 50px 100px 0px 100px;
        
        }
        .grid_Area_Container .grid_Area_Product_Name{
            display: grid;
            grid-template-columns: 0.8fr 4fr;
            grid-template-rows: 130px;
            grid-row-start: 1;
        }
        .grid_Area_Container .grid_Area_Product_Imgs{
            display: grid;
            grid-template-columns : repeat(6, 110px);
            grid-template-rows: 130px;
        
        }
        .grid_Area_Product_Name #product_Main{
            width: 100px;
            height: 100px;
        }
        .grid_Area_Product_Imgs .product_ThumbNail{
            width: 100px;
            height: 100px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
        }
        .add_Img #addFiles{
            width: 120px;
            height: 120px;
        }
        .grid_Area_Write_Review #Review_Write_Box{
            padding: 20px;
            width: 800px;
            height: 300px;
            font-size: 1rem;
        }
        .like_And_Button{
            display: grid;
            grid-template-columns: 1fr 3fr;
        }
        .like_And_Button img{
            width: 20px;
            height: 20px;
            margin-top: 20px;
            margin-right: 10px;
        }
         .buttons button{
            width: 100px;
            height: 50px;
            margin: 10px;
            background-color: black;
            color: white;
         }
         .buttons #back{
            margin-left: 375px;
         }
         .buttons #submit{
            margin-right: 0px;
         }
         .grid_Area_Product_Name #product_Main{
            box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
         }
         .grid_Area_Product_Name #product_Name{
            margin-top: 30px;
            font-size: 1.5rem;
            font-weight: bold;
         }
    </style>
</head>
<body>
    <div id="wrapper">
        <div class="container">
            <div class="review_Modify_Title">리뷰수정</div>
            <div class="grid_Area_Container">
                <div class="grid_Area_Product_Name">
                    <img src="../image/aircon.jpg" id="product_Main">
                    <div id="product_Name">전기세 제로 최고 혁신 에어컨</div>
                </div>
                <div class="grid_Area_Product_Imgs">
                    <div><img src="../image/bed.jpg" class="product_ThumbNail" id="img_ThumbNail1"></div>
                    <div><img src="../image/table.jpg" class="product_ThumbNail" id="img_ThumbNail2"></div>
                    <div><img src="../image/cabinet.jpg" class="product_ThumbNail" id="img_ThumbNail3"></div>
                    <div><img src="../image/bathgawn.jpg" class="product_ThumbNail" id="img_ThumbNail4"></div>
                    <div><img src="../image/chair.jpg" class="product_ThumbNail" id="img_ThumbNail5"></div>
                    <div class="add_Img"><img src="../image/addFile.PNG" id="addFiles"></div>
                </div>
                <div class="grid_Area_Write_Review">
                    <textarea placeholder="리뷰를 작성해주세요(10글자 이상.)" id="Review_Write_Box"></textarea>
                </div>
                <div class="like_And_Button">
                    <div class="likeAndDislike">
                        <img src="../image/like.png" id="like"><span id="like_Char">좋아요</span>
                        <img src="../image/dislike.png" id="dislike"><span id="dislike_Char">싫어요</span>
                    </div>
                    <div class="buttons">
                        <button id="back">돌아가기</button>
                        <button id="submit">수정하기</button>
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
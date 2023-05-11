<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<title>카드 주문 페이지</title>
    <style>
        .container{
            margin: auto;
            width: 1200px;
            height: 900px;   
        }
        .container .grid_Area1{
            display: grid;
            grid-template-columns: 600px 400px;
            grid-gap : 30px;
            padding: 20px;
        }
        .imgGrid #main_Img{
            width: 100%;   
            margin-top: 10px;  
            border: 1px outset black;
            background-color: gray;
            height: 300px;
        }
        .thumb_Nails{
            display: grid; 
            grid-template-columns: 1fr 1fr 1fr; 
            grid-gap: 1rem;
            margin-left: 10px;
           
        }
        .thumb_Nails img{
            width: 170px;
            height: 100px;
            margin-top: 20px;
            background-color: gray;
            cursor: pointer;
            border: 1px outset black;
        }
        .field_Area .product_Explane{
            line-height: 40px;
            padding: 20px;
            margin-bottom: 10px;
            width: 500px;
        }
        .field_Area .customer_Explane{
            width: 500px;
            padding: 20px;
            line-height: 40px;
        }
       .customer_Explane .customer_Box{
        border: 1px solid black;
        width: 450px;
        height: 150px;
        overflow: scroll;
       }
       .thxCard_title{
        text-align: center;
        font-size: 3rem;
        margin: 20px;
       }
       .card_Spoil_Title{
        font-size: 2rem;
    
       }
       .container .grid_Area2{
            display: grid;
            grid-template-columns: 700px 300px;
            grid-gap : 30px;
        }
        .option_Box{
            display: grid;
            grid-template-columns: 120px 120px 120px; 
            margin-right: 10px;
            width: 600px;
            grid-gap: 10px;
            margin-top: 20px;
        }
        .hr_Line{
            text-align: center;
            width: 1150px;
        }
        .container .grid_Area3{
            display: grid;
            grid-template-columns: 500px 600px;
            grid-gap : 30px;
        }
        .thx_Card_Write #thx_Card{
            width: 500px;
            height: 250px;
        }
        .write_Txt .txt_To_Card{
            width: 620px;
            height: 250px;
            padding: 20px;
        }
        .send_Btn{
            text-align: center;
            margin-top: 30px;
        }
        .send_Btn #send_Card{
            color: white;
            background-color: black;
            width: 150px;
            height: 50px;

        }
        .ck-editor__editable { height: 210px; }
      
    </style>
</head>
<body>
    <div id="wrapper">
        <div class="container">
            <div class="thxCard_title">감사카드</div>
            <div class="grid_Area1">
                <div class="imgGrid">
                   <img src="../image/card1.PNG" id="main_Img">
                   <div class="thumb_Nails"> 
                        <img src="../image/card2.PNG" id="thumb1" onmouseover="changeImage(this.src)" onmouseout="restoreImage()">
                        <img src="../image/card3.PNG" id="thumb2" onmouseover="changeImage(this.src)" onmouseout="restoreImage()">
                        <img src="../image/card4.PNG" id="thumb3" onmouseover="changeImage(this.src)" onmouseout="restoreImage()">
                   </div>
                </div>  
                <div class="field_Area">
                    <fieldset class="product_Explane">
                        <div>상품이름</div>
                        <div>재질</div>
                        <div>사이즈</div>
                        <div>가격</div>
                    </fieldset>
                        <fieldset class="customer_Explane">
                            <div>받는사람</div>
                            <div class="customer_Box"></div>
                        </fieldset>  
                </div>  
            </div>
            <div class="hr_Line"><hr></div>
            <div class="grid_Area2">
                <h1 class="card_Spoil_Title">카드 미리보기</h1>
                <div class="option_Box">
                    <select class="font_Size_Box">
                        <option>글씨크기</option>
                        <option>11</option>
                        <option>13</option>
                        <option>15</option>
                        <option>17</option>
                        <option>19</option>
                        <option>21</option>
                    </select>
                    <select class="font_Kind_Box">
                        <option>글꼴</option>
                        <option>나눔고딕</option>
                        <option>맑은고딕</option>
                        <option>궁서체</option>
                    </select>
                    <select class="font_Effect_Box">
                        <option>글씨효과</option>
                        <option>기울임</option>
                        <option>굵게</option>
                    </select>
                </div>
                <div class="grid_Area3">
                    <div class="thx_Card_Write">
                        <img src="../image/writeCard.PNG" id="thx_Card">
                    </div>
                    <div class="write_Txt">
                        <textarea name="text" id="editor"></textarea>
                    </div>
                </div>
            </div>
            <div class="send_Btn">
                <button id="send_Card" onclick="test()">카드 보내기</button>
            </div>
        </div>
    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
<script>
function changeImage(imageUrl) {
		var mainImage = document.getElementById("main_Img");
		mainImage.src = imageUrl;
		mainImage.style.transform = "scale(1)";
	}
    function restoreImage() {
		document.getElementById("main_Img").style.transform = "scale(1)";
	}

</script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script>
ClassicEditor.create( document.querySelector( '#editor' ),{
removePlugins: [ 'Heading' ],
removePlugins: [ 'Table' ],
language: "ko"
} )
.then( newEditor => {
 editor = newEditor;
console.log( 'Editor was initialized', editor );
} )
.catch( error => {
console.error( error );
} )
;
function test(){
var test1 = editor.getData();
console.log(test1);
alert(test1);
}
</script>
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
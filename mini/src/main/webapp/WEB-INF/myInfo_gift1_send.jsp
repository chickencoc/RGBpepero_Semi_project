<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
	<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
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
        .thx_Card_Write{
            width: 500px;
            height: 286px;
            text-align:center;
            vertical-align:middle;
            position: relative;
           
            
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
        .writedCard{
        width:450px;
        height:230px;
        z-index:1;
        position: absolute;
        top:12%;
        }
        .cardSampleImg{
        width:500px;
        height:286px;
        position:absolute;
        left:0%}
      
    </style>
</head>
<body>
<div id="app">
    <div id="wrapper">
        <div class="container">
            <div class="thxCard_title">감사카드</div>
            <div class="grid_Area1">
                <div class="imgGrid">
                   <img :src="info.imgsrc" id="main_Img">
                  <!--  <div class="thumb_Nails"> 
                        <img src="../image/card2.PNG" id="thumb1" onmouseover="changeImage(this.src)" onmouseout="restoreImage()">
                        <img src="../image/card3.PNG" id="thumb2" onmouseover="changeImage(this.src)" onmouseout="restoreImage()">
                        <img src="../image/card4.PNG" id="thumb3" onmouseover="changeImage(this.src)" onmouseout="restoreImage()">
                   </div> -->
                </div>  
                <div class="field_Area">
                    <fieldset class="product_Explane">
                        <div>{{info.pName}}</div>
                        <div>{{info.pPrice}}원 X {{checkedBox.length}} 명 = {{(info.pPrice*checkedBox.length).toLocaleString()}}원</div>
                    </fieldset>
                        <fieldset class="customer_Explane" >
                            <div>받는사람</div>
                            <div class="customer_Box">
                            	<div v-for="(item, index) in checkedBox">{{item.gName}} {{item.gPhone}}</div>
                            </div>
                        </fieldset>  
                </div>  
            </div>
            <div class="hr_Line"><hr></div>
            <div class="grid_Area2">
                <h1 class="card_Spoil_Title">카드 미리보기</h1>
                <div class="option_Box">                    
                </div>
                <div class="grid_Area3">
                    <div class="thx_Card_Write">
                    	<img :src="card.imgsrc" class="cardSampleImg">
                    	<div class="writedCard" v-html="cardContent">{{cardContent}}</div>
                    </div>
                    <div class="write_Txt">
                        <vue-editor v-model="cardContent"></vue-editor>
                    </div>
                </div>
            </div>
            <div class="send_Btn">
                <button id="send_Card" @click="fnAddCard">카드 보내기</button>
            </div>
        </div>
    </div>
</div> 
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
function changeImage(imageUrl) {
	var mainImage = document.getElementById("main_Img");
	mainImage.src = imageUrl;
	mainImage.style.transform = "scale(1)";
}
function restoreImage() {
	document.getElementById("main_Img").style.transform = "scale(1)";
}
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
var app = new Vue({ 
    el: '#app',
    data: {
		info:{},
		product : [],
		cardContent : '',
		userId : "${sessionId}",
		checkedBox : [],
		gPhoneO : {},
		card:{}
    }
	, components: {VueEditor}
    , methods: {
    	fnGetInfo : function() {
			var self = this;
			var nparmap = {productNo : self.product.productNo};
			for(var i=0; i<self.checkedBox.length; i++){
				var item=self.checkedBox[i];
				var gPhone = item.gPhone;
				self.gPhoneO[i]=gPhone;
				console.log(self.gPhoneO);
			}
			
			$.ajax({
				url : "/myInfoGift1Send.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					console.log(data)
					self.info = data.info;
					console.log(self.info);
					console.log(self.checkedBox);
					console.log(self.checkedBox.length)
				}
			});
		}
	    , pageChange : function(url, param) {
			var target = "_self";
			if(param == undefined){
			//	this.linkCall(url);
				return;
			}
			var form = document.createElement("form"); 
			form.name = "dataform";
			form.action = url;
			form.method = "post";
			form.target = target;
			for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
			document.body.appendChild(form);
			form.submit();
			document.body.removeChild(form);
		}
    	,fn: function() {
    	    var self = this;
    	    if (confirm("작성을 완료하시겠습니까?")) {
    	    	var nparmap = {};
    	        for(var i=0; i<self.checkedBox.length; i++){
	    	        nparmap = {
	    	            gPhone: self.gPhoneO[i],
	    	            userId: self.userId,
	    	            cardcontent: self.cardContent,
	    	            productNo: self.product.productNo,
	    	        };
	    	         $.ajax({
	    	            url: "/addCardContent.dox",
	    	            dataType: "json",
	    	            type: "POST",
	    	            data: nparmap,
	    	            success: function(data) {
	    	                console.log(data);
	    	            }
	    	        }); 
    	        }
                alert("주문 페이지로 이동합니다.");
                
    	    }
    	}
    	,fnCardInfo : function() {
			var self = this;
			var nparmap = {productNo : self.product.productNo};			
			$.ajax({
				url : "/myInfoGift1SendBackground.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					console.log(data)
					self.card = data.card;
					console.log(self.card);
				}
			});
		}
    	,fnAddCard : function(){
    		var self = this;
	    	self.pageChange("/myInfoGift8.do", {checkedBox: self.checkedBox, product : self.product})
    	}
    }
   
    , created: function () {
    	var self = this;
    	self.checkedBox = JSON.parse('${map.checkedBox}');
    	self.product = JSON.parse('${map.product}');
    	self.fnGetInfo();
    	self.fnCardInfo();

	}
});
</script>
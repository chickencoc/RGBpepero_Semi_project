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
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/myInfo_gift2_send.css">
	<title>답례품 구매 페이지</title>
</head>

<body>
    <div id="app">

    <!-- wrap START -->
    <div id="wrapper">
        <div class="container"> <!-- 전체 묶음 -->       
            <div class="thxCard_title">답례품</div>
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
                <h1 class="card_Spoil_Title">상세 설명</h1>
                <div class="option_Box">                    
                </div>
                <div class="grid_Area3">
                    <div class="thx_Card_Write">
                    	<div class="writedCard" >{{info.pContent}}</div>
                    <!-- 	<div>{{info.pDetail}}</div> -->
                    </div>
                    
                </div>
            </div>
            <div class="send_Btn">
                <button id="send_Card" @click="fnAddGift()">선물 보내기</button>
            </div>
        </div>
    </div>
    <!-- wrap END -->
    <!-- footer END -->
    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	info:{},
    	product : [],
    	userId : "${sessionId}",
    	checkedBox : [],
		gPhoneO : {},
    }
    , computed: {   
    	totalPrice: function(){
    		var self = this;
        	return self.checkedBox.length*info.price;
        }
    }
    , methods: {
    	fnGetInfo : function() {
			var self = this;
			console.log(self.product)
			var nparmap = {productNo : self.product.productNo};
			for(var i=0; i<self.checkedBox.length; i++){
				var item=self.checkedBox[i];
				var gPhone = item.gPhone;
				self.gPhoneO[i]=gPhone;
				console.log(self.gPhoneO);
			}
			
			$.ajax({
				url : "/myInfoGift2Send.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					console.log(data)
					self.info = data.info;
					console.log(self.info);
					console.log(self.checkedBox);
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
    	,fnAddGift : function(){
    		var self = this;
	    	self.pageChange("/myInfoGift8.do", {checkedBox: self.checkedBox, product : self.product})
    	}
    }   
    , created: function () {
    	var self = this;
    	self.checkedBox = JSON.parse('${map.checkedBox}');
    	self.product = JSON.parse('${map.product}');
    	self.fnGetInfo();
	}
});
</script>
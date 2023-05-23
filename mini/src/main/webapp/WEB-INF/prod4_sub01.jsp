<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<title>상품정보 수정 및 등록 페이지</title>
<style>

.container {width: 1200px; margin: 0 auto; padding-top: 50px; }

.container .grid_Area {width: 900px;height: 400px; display: grid;grid-template-columns: 1fr 1.5fr;grid-gap: 20px; margin: 0 auto; margin-bottom: 30px;  } 

.grid_Area .imgs {display: grid;grid-template-rows: 1fr; } 

.grid_Area .main_Img {border: 1px solid black; width: 340px; height: 340px; background-color: gray; margin: 20px 30px 0px 30px; text-align: center; border-radius: 5px; } 

.thumb_Nails .thumb_Nail {border: 1px solid black;width: 100px;height: 70px;background-color: gray; } 

.thumb_Nails {display: flex;justify-content: center;align-content: center;flex-direction: row; } 

.thumb_Nails .thumb_Nail {margin: 10px;text-align: center; } 

.grid_Area .inputs {display: flex; flex-direction: column; justify-content: space-evenly; }
.inputs .input_Elememt_Name {width: 300px;margin-bottom: 10px;margin-top: 10px;text-align: center; } 
.inputs .input_Elememt {width: 160px;margin-bottom: 10px;margin-top: 10px;text-align: center; } 

.inputs #product_Kind {margin-left: 15px;margin-right: 10px; } 

.inputs #product_No {margin-top: 30px;margin-left: 15px;margin-right: 10px; } 

.inputs #product_Cnt {margin-left: 45px;margin-right: 10px; } 

.inputs #product_Price {margin-left: 45px;margin-right: 10px; } 

.inputs #product_Name {margin-left: 30px; } 

.main_Img #main_Plus {width: 100%;}

.thumb_Nail #thumb_Plus {width: 30px;height: 30px;margin-top: 20px; } 


.container .product_Explane_Box {width: 950px; margin: 0 auto; padding: 0 27px;}
.product_Explane { width: 900px; height: 300px;  margin: 0 auto; } 

.product_Explane_Title { margin-bottom: 20px;} 

.container .btnBox {margin: 0 auto; margin-top: 75px; text-align: right; width: 950px; padding: 0 20px;}
.container .btnBox .btn1 {width: 100px; height: 40px;}
.modify_Btn {width: 100px;height: 40px; } 
.submit_Btn { width: 100px;height: 40px; } 

</style>
</head>

<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<div class="grid_Area boxshadowline">
					<div class="imgs">
						<div class="main_Img">
							<img v-if="productNo == null" src="../image/plus.png" id="main_Plus">
							<img v-if="productNo != null" :src="imgSrc" id="main_Plus">
						</div>
					</div>
					<div class="inputs">
						<div>
							상품명<input type="text" class="input_Elememt_Name" id="product_Name" v-model="pName">
						</div>
						<div>
							개수<input type="number" class="input_Elememt" id="product_Cnt"v-model="pStock">개
						</div>
						<div>
							가격<input type="text" class="input_Elememt" id="product_Price" v-model="pPrice">원
						</div>
						<div>
							상품종류<select v-model="pKind">
									<option value="" hidden>옵션을 선택하세요.</option>
									<option value="B">침실</option>
									<option value="L">거실</option>
									<option value="D">드레스룸</option>
									<option value="K">주방</option>
									<option value="V">다용도실</option>
									<option value="T">욕실</option>
									<option value="H">취미</option>
								 </select>
						</div>
					</div>
				</div>
				<div class="product_Explane_Box">
					<h1 class="product_Explane_Title">상품상세 설명</h1>	
				</div>
				<div class="btnBox">
					<button class="submit_Btn btn1" @click="fnLoad" v-if="productNo == null || productNo == ''">등록완료</button>
					<button class="modify_Btn btn1" @click="fnLoad" v-else>수정완료</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;
	var app = new Vue({
		el : '#app',
		data : {
			productNo : "${map.productNo}"
			, list :[]
			, pName : ""
			, pPrice : ""
			, pKind : ""
			, pStock : ""
			, pContent : ""
			, imgSrc : ""
		}
		, components: {VueEditor}
		,methods : {
			fnProductInformation : function(){
                var self = this;
                var nparmap = {productNo : self.productNo};
                $.ajax({
                    url:"/producttemporaryinfo.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                    	if(typeof data.list == "undefined" || data.list == "" || data.list == null) {
                    		console.log("로딩 실패");
                    	} else {
                    			self.list = data.list;
                    		            self.pName = self.list.pName;
                    		            self.pPrice = self.list.pPrice;
                    		            self.pStock = self.list.pStock;
                    		                        self.pContent = self.list.pContent;
                    		                        self.pKind = self.list.pKind;
                    		                        self.imgSrc = self.list.imgSrc;
                    		}
                    }
                }); 
            },fnProductUpdate : function(){
                var self = this;
                var nparmap = {productNo : self.productNo, pName : self.pName, pStock : self.pStock, pPrice : self.pPrice, pContent : self.pContent, pKind : self.pKind};
                $.ajax({
                    url:"/productUpdate.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	alert("수정되었습니다.");
                    	location.href="./main.do";
                    }
                }); 
            },
            fnProductAdd : function(){
                var self = this;
                var nparmap = { pName : self.pName, pStock : self.pStock, pPrice : self.pPrice, pContent : self.pContent, pKind : self.pKind};
                $.ajax({
                    url:"productAdd.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                        console.log(data)
		                self.info = data.info;
	                	console.log(self.info);
	                	location.href="./main.do";
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
	    	},
            fnLoad : function(){
                var self=this;
                if(self.pName == ""){
                	alert("제품의 이름을 적어주세요.");
                	return;
                }else if(self.pStock == ""){
                	alert("제품의 재고수를 정해주세요.");
                	return;
                }else if(self.pKind == ""){
                	alert("제품의 종류를 정해주세요.");
                	return;
                }else if(self.pPrice == ""){
                	alert("제품의 가격을 적어주세요.");
                	return;
                }else if(self.pContent == ""){
                	alert("제품의 설명을 적어주세요.");
                	return;
                }else if(self.productNo == ""){
                	self.fnProductAdd();
                }else if(self.procutNo != ""){
                	self.fnProductUpdate();
                }else{
                	alert("error!");
                	return;
                }
                
            }
		},
		created : function() {
			var self = this;
			self.fnProductInformation();
			console.log(self.productNo);

		}
	});
</script>
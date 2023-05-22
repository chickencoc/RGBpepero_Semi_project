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
<title>여행상품 수정 및 등록 페이지</title>
<style>
.container {
	width: 1200px;
	height: 800px;
}

.container .grid_Area {
	width: 900px;
	height: 300px;
	border: solid black 1px;
	display: grid;
	grid-template-columns: 1fr 1.5fr;
	grid-gap: 20px;
	margin: auto;
	margin-top: 100px;
	margin-bottom: 10px;
}

.grid_Area .imgs {
	display: grid;
	grid-template-rows: 1fr 0.5fr;
}

.grid_Area .main_Img {
	border: 1px solid black;
	width: 340px;
	height: 180px;
	background-color: gray;
	margin: 20px 30px 0px 30px;
	text-align: center;
}

.thumb_Nails .thumb_Nail {
	border: 1px solid black;
	width: 100px;
	height: 70px;
	background-color: gray;
}

.thumb_Nails {
	display: flex;
	justify-content: center;
	align-content: center;
	flex-direction: row;
}

.thumb_Nails .thumb_Nail {
	margin: 10px;
	text-align: center;
}

.inputs .input_Elememt {
	width: 300px;
	margin-bottom: 10px;
	margin-top: 10px;
	text-align: center;
}

.inputs #product_Kind {
	margin-left: 15px;
	margin-right: 10px;
}

.inputs #product_No {
	margin-top: 30px;
	margin-left: 15px;
	margin-right: 10px;
}

.inputs #product_Cnt {
	margin-left: 45px;
	margin-right: 10px;
}

.inputs #product_Price {
	margin-left: 45px;
	margin-right: 10px;
}

.inputs #product_Name {
	margin-left: 30px;
}

.main_Img #main_Plus {
	margin-top: 60px;
}

.thumb_Nail #thumb_Plus {
	width: 30px;
	height: 30px;
	margin-top: 20px;
}

.product_Explane {
	margin-left: 150px;
	width: 900px;
	height: 300px;
	padding: 20px;
	margin-top: 10px;
}

.product_Explane_Title {
	margin-left: 150px;
}

.modify_Btn {
	color: white;
	background-color: black;
	position: relative;
	top: 30px;
	width: 100px;
	height: 40px;
	text-align:center;
	margin:50px;
}

.submit_Btn {
	color: white;
	background-color: black;
	position: relative;
	top: -10px;
	left: 830px;
	width: 100px;
	height: 40px;
		text-align:center;
}
.btnBox{
text-align:center;
magin:30px;}
</style>
</head>

<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<div class="grid_Area">
					<div class="imgs">
						<div class="main_Img">
						<template>
							<img v-if="tripNo == null" src="../image/plus.png" id="main_Plus">
						</template>
							<img v-if="tripNo != null" :src="imgSrc" id="main_Plus">
						</div>
					</div>
					<div class="inputs">
						<div>
							 여행지 명<input type="text" class="input_Elememt" id="product_Name" v-model="tName">
						</div>
						<div>
							여행지 주소<input type="text" class="input_Elememt" id="product_Cnt"v-model="tAddr">
						</div>
						<div>
							상품종류<select v-model="tKind">
									<option value="" hidden>옵션을 선택하세요.</option>
									<option value="I">국내</option>
									<option value="O">해외</option>
								 </select>
						</div>
						<div id="file_line">
							<div> 썸네일 첨부
								<input type="file" id="file1" name="file1" accept="image/*" > 
							</div>
							<div>사진 첨부
							    <input type="file" id="file2" name="file2" accept="image/*" multiple="multiple"> 
							</div>
						</div>
					</div>
				</div>
				<h1 class="product_Explane_Title">여행지 상세 설명</h1>
				<vue-editor class="product_Explane" id="editor" v-model="tContent" placeholder="상품설명을 입력해주세요."></vue-editor>
				<div class="btnBox">
					<button class="modify_Btn btn1" v-if="tripNo != null || tripNo !=''" @click="fnLoad">수정완료</button>
					<button class="submit_Btn btn1" v-if="tripNo == null || tripNo ==''" @click="fnLoad">등록완료</button>
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
			tripNo : "${map.tripNo}"
			, info :{}
			, tName : ""
			, tAddr : ""
			, tKind : ""
			, tContent : ""
			, imgSrc : ""
		}
		, components: {VueEditor}
		,methods : {
			fnTripInformation : function(){
                var self = this;
                var nparmap = {tripNo : self.tripNo};
                if(self.tripNo!=''){
	                $.ajax({
	                    url:"/tripView.dox",
	                    dataType:"json",	
	                    type : "POST", 
	                    data : nparmap,
	                    success : function(data) { 
	                        self.info = data.info;
	                        self.tName = self.info.tName;
	                        self.tAddr = self.info.tAddr;
	                        self.tContent = self.info.tContent;
	                        self.tKind = self.info.tKind;
	                        self.imgSrc = self.info.imgSrc;
	                    }
	                		
                	}); 
                }
                return;
			}
            ,fnTripUpdate : function(){
                var self = this;
                var nparmap = {tripNo : self.tripNo, 
                		tName : self.tName, 
                		tAddr : self.tAddr, 
                		tContent : self.tContent, 
                		tKind : self.tKind};
                $.ajax({
                    url:"/tripEdit.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	alert("수정되었습니다.");
                    	location.href="./triprecommend.do";
                    }
                }); 
            },
            fnTripAdd : function(){
                var self = this;
                var nparmap = {tripNo : self.tripNo, 
                		tName : self.tName, 
                		tAddr : self.tAddr, 
                		tContent : self.tContent, 
                		tKind : self.tKind};
                $.ajax({
                    url:"addTrip.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	var form = new FormData();
	                	console.log(data);
		       	        form.append( "file1",  $("#file1")[0].files[0] );
		       	     	form.append( "tripNo",  data.tripNo); // pk
		       	     	console.log($("#file1")[0].files[0]);
		       	     	console.log(form[0]);
		           		self.upload(form);
		       	     	alert("저장되었습니다.");
		       	     	/* location.href="prod5sub0.do" */
		       	    	var form2 = new FormData();
                 		console.log( $("#file2")[0].files.length);
                 		for(var i=0;i < $("#file2")[0].files.length;i++){
                 			console.log($("#file2")[0].files);
                 			console.log($("#file2")[0].files[i]);
                 			form.append( "file2",  $("#file2")[0].files[i] );
     	       	     	 	form.append( "tripNo",  data.tripNo); // pk
     	       	     		console.log(form2);
     	           			self.upload2(form2);
     	           			form.delete("file2");
     	           		 	form.delete("tripNo");
                 			}

                    	alert("여행지가 추가되었습니다.")
	                	location.href="./triprecommend.do";
	                	} , error: function (e) { 
	                		// 전송 후 에러 발생 시 실행 코드
	                		console.log("ERROR : ", e);              	
	                	}
                }); 
            }
            , upload : function(form){
    	    	var self= this; 
    	         $.ajax({
    	             url : "/tripImgupload.dox"
    	           , type : "POST"
    	           , processData : false
    	           , contentType : false
    	           , data : form
    	           , success:function(response) { 
    	        	   
    	           }
    	           
    	       });
    		}
            , upload2 : function(form2){
    	    	var self= this; 
    	         $.ajax({
    	             url : "/tripImguploadList.dox"
    	           , type : "POST"
    	           , processData : false
    	           , contentType : false
    	           , data : form2
    	           , success:function(response) { 
    	        	   
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
	    	fnLoad: function () {
	    		  var self = this;
	    		  if (self.tName === "") {
	    		    alert("여행지의 이름을 적어주세요.");
	    		    return;
	    		  } else if (self.tAddr === "") {
	    		    alert("여행지의 주소를 입력해주세요.");
	    		    return;
	    		  } else if (self.tKind === "") {
	    		    alert("여행지의 종류를 정해주세요.");
	    		    return;
	    		  } else if (self.tContent === "") {
	    		    alert("여행의 설명을 적어주세요.");
	    		    return;
	    		  } else if (self.tripNo === "") {
	    		    self.fnTripAdd();
	    		  } else {
	    		    self.fnTripUpdate();
	    		  }
                
            }
		},
		created : function() {
			var self = this;
			self.fnTripInformation();

		}
	});
</script>
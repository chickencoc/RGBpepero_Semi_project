<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page="/layout/header.jsp"></jsp:include>
<link rel="stylesheet" href="/css/Base_rgbPepero.css">
<link rel="stylesheet" href="/css/prod6_sub2.css">
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
<title>여행상품 수정 및 등록 페이지</title>
</head>
<body>
	<div id="app">
		<div id="wrapper">
			<div class="container">
				<div id="page_title"><h3>여행상품 수정 및 등록 페이지</h3></div>
				<div class="grid_Area">
					<div class="imgs">
						<div class="main_Img">
						<template>
							<img v-if="tripNo === null ||tripNo === ''" src="../image/plus.png" id="main_Plus">
						</template>
							<img v-if="tripNo != null || tripNo != ''" :src="imgSrc" id="main_Plus">
						</div>
					</div>
					<div class="inputs">
						
							<div class="info">여행지</div>
							<input type="text" class="input_Elememt" id="product_Name" v-model="tName">
						
							<div class="info">여행지 주소</div>
							<input type="text" class="input_Elememt" id="product_Cnt"v-model="tAddr">
						
							<div class="info">상품종류</div>
							<select v-model="tKind" class="input_Elememt">
									<option value="" hidden>옵션을 선택하세요.</option>
									<option value="I">국내</option>
									<option value="O">해외</option>
								 </select>
						
						
							<div class="info"> 썸네일 첨부</div>
								<input type="file" id="file1" name="file1" accept="image/*" class="input_Elememt" > 
							
							<div class="info">사진 첨부</div>
							    <input type="file" id="file2" name="file2" accept="image/*" multiple="multiple" class="input_Elememt"> 							
						
					</div>
				</div>
				<h1 class="product_Explane_Title">여행지 상세 설명</h1>
				<vue-editor class="product_Explane" id="editor" v-model="tContent" placeholder="상품설명을 입력해주세요."></vue-editor>
				<div class="btnBox">
					<button class="modify_Btn btn1" v-if="tripNo !== null && tripNo !== ''" @click="fnTripUpdate">수정완료</button>
					<button class="submit_Btn btn1" v-if="tripNo === null || tripNo ===''" @click="fnTripAdd">등록완료</button>
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
			, info : []
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
							console.log(self.info);
	                         self.tName = self.info.tName;
	                         self.tAddr = self.info.tAddr;
	                         self.tContent = self.info.tContent;
	                         self.tKind = self.info.tKind;
	                         self.imgSrc = self.info.imgsrc;
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
                		tKind : self.tKind,
						};
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
                		tKind : self.tKind,
						};
                $.ajax({
                    url:"addTrip.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) {
                    	var form = new FormData();
	                	console.log(data);
		       	        form.append( "file1",  $("#file1")[0].files[0] );
		       	     	form.append( "tripNo",  self.tripNo); // pk
		       	     	console.log($("#file1")[0].files[0]);
		       	     	console.log(form[0]);
		           		self.upload(form);
		       	     	alert("저장되었습니다.");
						form.delete("file1");
						form.delete("tripNo");
		       	     	/* location.href="prod5sub0.do" */
		       	    	var form2 = new FormData();
                 		console.log( $("#file2")[0].files.length);
                 		for(var i=0;i < $("#file2")[0].files.length;i++){
                 			console.log($("#file2")[0].files);
                 			console.log($("#file2")[0].files[i]);
                 			form2.append( "file2",  $("#file2")[0].files[i] );
     	       	     	 	form2.append( "tripNo",  self.tripNo); // pk
     	       	     		console.log(form2);
     	           			self.upload2(form2);
     	           			form2.delete("file2");
     	           		 	form2.delete("tripNo");
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
			console.log(self.info);
		}
	});
</script>
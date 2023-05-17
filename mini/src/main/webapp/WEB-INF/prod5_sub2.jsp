<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	 <title>식장 관리 페이지</title>
    <style>
        .container{
            margin: auto;
            width: 1200px;
            height: 600px;   
        }
        .container h1{
            margin-top: 10px;
            font-size: 40px;
            margin-left: 150px;
            margin-bottom: 10px;
        }
        .container .wedding_Information_Box{
            width: 900px;
            height: 400px;
            margin: auto;
            box-shadow: 0 2px 5px rgba(0, 0, 0, .1);
            display: grid;
            grid-template-columns: 400px 500px;
        }
        .wedding_Information_Box .changeImg{
            border: 1px solid #D9D9D9;
            width: 300px;
            height: 200px;
            background-color: #D9D9D9;
            margin-left: 50px;
            margin-top: 85px;
            text-align: center;
        }
        .wedding_Information .wedding_Hall_Name{
          width: 350px; 
          margin: 20px;
          margin-top: 60px;
        }
        .wedding_Information .wedding_Hall_Location_List{
          width: 350px;
          margin: 20px;  
        }
        .wedding_Information .wedding_Hall_Address{
          margin: 20px;
          width: 350px;
        }
        .wedding_Information .wedding_Hall_URL{
          margin: 20px;  
          width: 350px;
          margin-left: 13px;
        }
        .buttons #del_Btn{
          margin-left : 150px;
          margin-right : 10px;
          width: 130px;
          height: 40px;
          margin-top: 10px;  
          background-color: black;
          color: white;
          border: solid 1px black;
        }
        .buttons #back_Btn{
          margin-right : 10px;
          width: 130px;
          height: 40px;
          margin-top: 10px;  
          background-color: black;
          color: white;
          border: solid 1px black;
        }
        .buttons #sub_Btn{
          margin-right : 10px;
          width: 130px;
          height: 40px;
          margin-top: 10px;  
          background-color: black;
          color: white;
          border: solid 1px black;
        }
        .wedding_Information label{
           width: 100px; 
           height: 100px;
        }
        .changeImg #plus{
            margin-top: 70px;
        }

    </style>
</head>
<body>
<div id="app">
    <div id="wrapper">
        <div class="container">
            <h1>식장정보 관리 (수정)</h1>
           <fieldset class="wedding_Information_Box">
                <div class="changeImg">
                    <img src="../image/plus.png" id="plus">
                </div>
                <div class="wedding_Information">
                    <div><label>웨딩홀 이름 <input type="text" class="wedding_Hall_Name" v-model="info.wName"></label></div>
                    <div><label>웨딩홀 주소 <input type="text" class="wedding_Hall_Address" v-model="info.wAddr"></label></div>
                    <div><label>웨딩홀 URL <input type="text" class="wedding_Hall_URL" v-model="info.wUrl"></label></div>  
                    <div class="wedding_Hall_Location">
                        웨딩홀 지역 
                        <select class="location" v-model="info.wLocation">
		                    <option value="">::전체::</option>
		                    <option value="서울특별시">서울</option>
		                    <option value="경기도">경기도</option>
		                    <option value="강원도">강원도</option>
		                    <option value="경상도">경상도</option>
		                    <option value="전라도">전라도</option>
		                    <option value="충청도">충청도</option>
		                    <option value="인천광역시">인천</option>
		                    <option value="광주광역시">광주</option>
		                    <option value="대전광역시">대전</option>
		                     <option value="대구광역시">대구</option>
		                    <option value="울산광역시">울산</option>
		                    <option value="부산광역시">부산</option>
		                    <option value="제주도">제주도</option>  
		                </select>
                    </div>
                    <div><label><input type="file" id="file1" name="file1" accept="image/*"></label></div>
                </div>
           </fieldset>
           <div class="buttons">
                <button id="back_Btn">돌아가기</button>
                <button id="sub_Btn" @click="fnEditWedding">수정하기</button>
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
    	wName : '',
    	wAddr : '',
    	wUrl : '',
    	wLocation : '',
    	wFile :'',
    	info : {},
    	weddingNo:"${map.weddingNo}"
    }   
    , methods: {
    	 upload : function(form){
    		var self= this; 
        	 $.ajax({
	             url : "weddingImgupload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
           		}, error: function (e) { 
           			// 전송 후 에러 발생 시 실행 코드
           			console.log("ERROR : ", e); 
           		}
           
       		});
		},
		fnGetWedding: function() {
		    var self = this;
		    var nparmap = { weddingNo: self.weddingNo };
		    $.ajax({
		        url: "/weddingView.dox",
		        dataType: "json",
		        type: "POST",
		        data: nparmap,
		        success: function(data) {
		            console.log(data.info);
		            self.info = data.info;
		        }
		    });
		}
		,fnEditWedding : function() {
			var self = this;
			var nparmap = {wName : self.info.wName,
							wLocation : self.info.wLocation,
							wAddr : self.info.wAddr,
							wUrl : self.info.wUrl}
				/*self.info;
				nparmap.boardNo = self.boardNo;*/
			 if(self.wName==''){
	            	alert("예식장 이름을 입력하세요.")
	            } else if(self.wAddr==''){
	            	alert("예식장 주소를 입력하세요.")
	            } else if(self.wUrl==''){
	            	alert("예식장 URL을 입력하세요.")
	            } else if(self.wLocation==''){
	            	alert("예식장 지역을 선택하세요.")
	            }
	            else{
				$.ajax({
					url : "/weddingEdit.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						var form = new FormData();
	                	console.log(data);
		       	        form.append( "file1",  $("#file1")[0].files[0] );
		       	     	form.append( "weddingNo",  data.weddingNo); // pk
		       	     	console.log($("#file1")[0].files[0]);
		       	     	console.log(form[0]);
		           		self.upload(form);
		       	     	alert("저장되었습니다.");
		       	     	location.href="/prod5Sub0.do";
		       	     	/* location.href="prod5sub0.do" */
	                	} , error: function (e) { 
	                		// 전송 후 에러 발생 시 실행 코드
	                		console.log("ERROR : ", e); 
	                	}
				});
	         }
		}

    }   
    , created: function () {
    	var self = this;
    	self.fnGetWedding();
	}
});
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="js/vue.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/Registry.css">
	<link rel="stylesheet" href="/css/myInfo_img.css">
	<title>배경 이미지 변경</title>
</head>
<body>
    <div id="app">  		
	    <div class="regist_img_main"> 
                <header id="regist_popup_header">
                    <div class="regist_img_title">배경 이미지 변경 페이지</div>                                   
                </header>              
                <main class="regist_img_mainbox">
                    <div class="regist_img_searchbox">
                        <input class="regist_img_uploadname" :value="uploadName" placeholder="첨부파일">
                        <label for="regist_file">파일찾기</label>
                        <input type="file" id="regist_file" @change="fnRegistImg($event)">                  
                    </div>
                    <div class="regist_img_buttonbox">
                        <button id="regist_button" @click="fnUpdateImg">등록</button>
                    </div>
                </main>
                <!-- wrap END -->
                
                <footer id="regist_popup_footer">
                    <div class="regist_popup_footer_main">
                        <img src="/image/logo_Marrimo.png" id="regist_popup_logo">              
                        <span>도움이 필요하신가요?</span>
                        <a href="#" @click="fnServiceCenter">고객센터</a>
                    </div>
                </footer>
         </div>
    </div>
</body>
</html>
<script type="text/javascript">	
			
	var app = new Vue({ 
	    el: '#app',
	    data: {
			sessionId: "${sessionId}"
		,	userId: "${sessionId}"
	    ,	image: []
		,	imageUrl: '' //이미지 주소 가져올 공간
		,	uploadName: '첨부파일'
		,	imageType: ''
	    }   
	    , methods: {

	    	fnServiceCenter : function(){
	    			window.open("/boardMain.do");
	    	}
	    
		,	fnRegistImg(event) {
				var self = this;
				var file = event.target.files[0]; // 선택된 파일
				var reader = new FileReader();

				reader.onload = function(e) {
				self.imageUrl = e.target.result; // 이미지 URL 업데이트
				};

				reader.readAsDataURL(file); // 파일을 읽어서 Data URL로 변환
				self.uploadName = file.name; //업로드 파일 이름 보이기

				self.imageType = self.extractImageType(self.uploadName);
  				console.log(self.imageType);
		    }
		,	extractImageType: function (uploadName) {
			// 파일 이름에서 마지막 점의 인덱스를 찾습니다.
			var dotIndex = uploadName.lastIndexOf('.');
			
			// 마지막 점이 존재하고, 파일 이름에 확장자가 있는 경우
			if (dotIndex !== -1 && dotIndex < uploadName.length - 1) {
				// 파일 이름의 확장자를 추출합니다.
				var extension = uploadName.substring(dotIndex + 1);
				
				// 확장자를 소문자로 변환하여 이미지 유형과 비교합니다.
				switch (extension.toLowerCase()) {
				case 'jpg':
				case 'jpeg':
					return 'JPEG';
				case 'png':
					return 'PNG';
				case 'gif':
					return 'GIF';
				case 'bmp':
					return 'BMP';
				// 추가적인 이미지 유형을 필요에 따라 여기에 추가할 수 있습니다.
				default:
					return 'Unknown';
				}
				self.imageType = extension;
				console.log(imageType);
			}
			
			return 'Unknown'; // 확장자가 없는 경우
		}
		,	fnUpdateImg : function(){
				var self= this;				 
				var nparmap = {
					userId : self.userId,
					imgSrc : self.imageUrl,
					imgName : self.uploadName,
					orgName : self.uploadName,
					imgType : self.imageType,
					imgUsetype: 1
				};
					console.log(nparmap);
				  // AJAX 요청을 보냅니다
				  $.ajax({
				    url: '/updateRegistryImg.dox', // 서버의 처리 파일 경로를 지정해야 합니다
				    type: 'POST',
					dataType: "json",
				    data: nparmap,
				    
				    success: function(response) {
				      // 요청이 성공했을 때 실행할 코드를 작성합니다
						alert("저장되었습니다.");
						console.log(response); // 응답 내용을 콘솔에 출력하거나 필요에 따라 처리합니다	
						window.opener.parent.location.reload();
						window.close();					
				    },
				    error: function(xhr, status, error) {
				      // 요청이 실패했을 때 실행할 코드를 작성합니다
				      console.error(error); // 에러 내용을 콘솔에 출력하거나 필요에 따라 처리합니다
				    }
				  });
				  
			}
	    }   
		
	    , created: function () {
	    	
	
		}
	});
</script>
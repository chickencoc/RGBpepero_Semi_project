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
	<link rel="stylesheet" href="/css/reg_options_popup.css">
	<title>회원용 레지스트리 옵션 팝업</title>
</head>
<body>
    <div id="app">	
            <div class="reg_options_popup">               
                <div class="reg_options_popup_image">
                </div>
                <div class="reg_options_popup_info">
                    <div id="reg_options_popup_name">상품 이름</div>
                    <div id="reg_options_popup_price">상품 가격</div>
                    <div>수량<input type="text" size="1" value="1" id="reg_options_popup_stock_number"></div>
                </div>
                <ul class="reg_options_popup_checkbox">
                    <li id="reg_options_popup_checkbox">상품 표시 옵션</li>
                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-bind:checked="inputWanted" v-on:change="updateWanted">정말 필요한 물건" 표시</li>                 
                    <li id="reg_options_popup_checkbox"><input type="checkbox" name="choice" v-bind:checked="inputGroup" v-on:change="updateGroup"> "그룹선물(펀딩)"로 변경하기</li>
                </ul>
                <div class="reg_options_popup_memo">
                    <div><img src="/image/fi-ss-heart.png" style="position: relative; top: 8px; margin-right: 5px;">선물할 친구들이 참고할 정보를 기재해주세요</div>
                    <input type="text" id="reg_options_popup_memo_txt" v-bind:value="inputText" v-on:input="updateInput">
                </div>
                <button class="reg_options_popup_btn" @click="fnOptionInput">저장하기</button>
            </div>       
    </div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
        registry: [] 
    ,   updatedWanted: ""
    ,   updatedGroup: ""
    ,  	updatedInput: ""
    }   
    , methods: {
        updateWanted : function(event){
            var self = this;
            self.updatedWanted = event.target.checked ? 'A' : '';
             //체크시 배지
        }
    ,   updateGroup : function(event){
            var self = this;
            self.updatedGroup = event.target.checked ? 'Y' : '';
             //체크시 펀딩
        }
    ,	updateInput : function(event) {
            var self = this;
            self.updatedInput = event.target.value;
             //텍스트 저장
        }    
    ,	fnOptionInput : function(){
            var self = this;
    		var nparmap = {rOption: self.updatedWanted, fundYn: self.updatedGroup, rContent: self.updatedInput};
                  $.ajax({
                            url: "/registryOption.dox",
                            type: "POST",
                            dataType: "json",
                            data: nparmap,
                            success: function(response) {
                                // 서버 응답을 처리하는 코드 작성
                                alert("저장되었습니다.");
                                window.close();
                            },
                            error: function(xhr, textStatus, errorThrown) {
                                // 오류 처리 코드 작성
                                console.error(textStatus);
                            }
                        });
    	}
    }   
    , created: function () {  	

	}
});
</script>
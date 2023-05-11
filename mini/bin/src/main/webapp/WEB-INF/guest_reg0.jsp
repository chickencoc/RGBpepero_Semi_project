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
	<link rel="stylesheet" href="/css/myInfo_reg.css">
	<title>첫번째 페이지</title>
</head>

<body>
    <div id="app">
		<div class="content">
        <main>
            <div class="container">              
                <span id="regi_user">{{신랑}} & {{신부}}의 레지스트리</span>            
            </div>           
            <div class="container">                
                <div class="back_image">                                  
                </div>    
                <a id="profile"></a>                       
            </div>
            <div class="container">
                <div class="regi_select">
                    <select style="width: 80px;">
                        <option>등록순</option>
                        <option>가격순</option>                   
                    </select>
                </div>               
                
                <div class="registry">                                       
                    <div class="regi_items">
                        <!--갖고싶은물건-->
                        <div id="wanted"> <!--배지-->
                        <img src="/semiproject1/image/loundry.jpg" class="items_image">
                        </div> 
                        <!-- <div id="wanted" v-else="">
                            <img src="/semiproject1/image/loundry.jpg" class="items-image">
                        </div> -->                 
                        <p class="pro_name">{{그랑데 세탁기}}</p>
                        <p class="pro_price">{{1,000,000}} 원</p>
                        <div class="items_options_taken">
                            <span id="stock_text">수량</span>
                            <input type="text" id="stock_number" value="1" size="1" readonly>
                            <button id="giveBtn" @click="">선물하기</button>
                            
                        </div>
                    </div>
                    <!--일반-->
                    <div class="regi_items">
                        <img src="/semiproject1/image/loundry.jpg" class="items_image">                   
                        <p class="pro_name">{{그랑데 세탁기}}</p>
                        <p class="pro_price">{{1,000,000}} 원</p>
                        <div class="items_options_taken">
                            <span id="stock_text">수량</span>
                            <input type="text" id="stock_number" value="1" size="1" readonly>
                            <button id="giveBtn" @click="">선물하기</button>
                            
                        </div>
                    </div>
                    <!--펀딩퍼센트-->
                    <div class="regi_items">
                        <img src="/semiproject1/image/loundry.jpg" class="items_image">                   
                        <p class="pro_name">{{그랑데 세탁기}}</p>
                        <p class="pro_price">{{1,000,000}} 원</p>
                        <div class="percentage" v-if="">
                            <progress id="progress" value="30" max="100"></progress>
                            <span>{value}%</span>                        
                        </div>
                        <div class="items_options_taken">    
                            <span id="stock_text" >수량</span>
                            <input type="text" id="stock_number" value="1" size="1" readonly>                     
                            <button id="giveBtn" @click="">선물하기</button>
                            
                        </div>
                    </div>
                    <!--선물완료인 경우-->
                    <div class="regi_items">
                        <img src="/semiproject1/image/loundry.jpg" class="items_image">                   
                        <p class="pro_name">{{그랑데 세탁기}}</p>
                        <p class="pro_price">{{1,000,000}} 원</p>
                        <div class="items_options_taken">
                            <button id="taken_gift" disabled>선물완료</button>
                        </div>
                    </div>
                    <div class="regi_items">
                        <img src="/semiproject1/image/loundry.jpg" class="items_image">                   
                        <p class="pro_name">{{그랑데 세탁기}}</p>
                        <p class="pro_price">{{1,000,000}} 원</p>
                        <div class="items_options_taken">
                            <span id="stock_text">수량</span>
                            <input type="text" id="stock_number" value="1" size="1" readonly>
                            <button id="giveBtn" @click="">선물하기</button>
                            
                        </div>
                    </div>
                    <div class="regi_items">
                        <img src="/semiproject1/image/loundry.jpg" class="items_image">                   
                        <p class="pro_name">{{그랑데 세탁기}}</p>
                        <p class="pro_price">{{1,000,000}} 원</p>
                        <div class="items_options_taken">
                            <span id="stock_text">수량</span>
                            <input type="text" id="stock_number" value="1" size="1" readonly>
                            <button id="giveBtn" @click="">선물하기</button>
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
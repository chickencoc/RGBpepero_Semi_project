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
    <link rel="stylesheet" href="/css/myInfo_gift2.css">
	<title>보낸 답례품</title>
</head>

<body>
    <div id="app">
    <div id="wrapper">
        <div class="container" id="app">
            <div class="return_gift_list_menu">
                <a href="">회원정보</a>
                <a href="">나의 레지스트리</a>
                <a href="">받은 선물 목록</a>
                <a href=""><strong>보낸답례품</strong></a>
                <a href="">캘린더</a>
            </div>
            <div class="returnSearchBox">
                <input type="text" placeholder="이름" class="returnSearchBar search">
                <button class="returnSearchBtn searchM">검색</button>
                <button class="returnSearchBtn searchR">초기화</button>
            </div>
            <fieldset class="returnProdTableBox">
                <legend class="returnProdTableTitle">보낸 답례품 목록</legend>
                <table class="returnProdTable">
                    <tr>
                        <th colspan="2">제품</th>
                        <th>받은 사람</th>
                        <th>수량</th>
                        <th>보낸 날짜</th>
                        <th>금액</th>
                    </tr>
                    <tr>
                        <td rowspan="2" class="returnProdImgBox">
                            <img src="/image/prod1.jpg" class="returnProdImg">
                        </td>
                        <td class="returnProdNameBox">p_name</td>
                        <td class="returnGuestNameBox" rowspan="2">
                            <div class="returnGuestNameBox2">
                                
                                <div @click.prevent="fnShowGuest()">
                                    <a href="" v-if="guestFlg">더 보기▼</a>
                                    <a href="" v-if="!guestFlg">접기▲</a>
                                </div>
                                <p>g_name</p>
                                <div v-if="!guestFlg">
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                    <p>g_name</p>
                                </div>
                            </div>
                        </td>
                        <td  rowspan="2" class="returnProdCntBox">1개</td>
                        <td  rowspan="2" class="returnProdDateBox">cdatetime</td>
                        <td  rowspan="2" class="returnProdPriceBox">price</td>
                    </tr>
                    
                </table>
            </fieldset>
            <template>
                <paginate
                  :page-count="pageCount"
                  :page-range="3"
                  :margin-pages="2"
                  :click-handler="fnSearch"
                  :prev-text="'<'"
                  :next-text="'>'"
                  :container-class="'pagination'"
                  :page-class="'page-item'">
                </paginate>
              </template>
        </div>
    </div>

    </div>
</body>
</html>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
Vue.component('paginate', VuejsPaginate)
var app = new Vue({ 
    el: '#app',
    data: {
        guestFlg : true,
        selectPage: 1,
        pageCount: 1,
        cnt : 0
    }   
    , methods: {
        fnShowGuest : function(){
            var self = this;
            self.guestFlg=!self.guestFlg
        }
        ,fnSearch : function(){

        }
    }   
    , created: function () {
        var self = this;
    }
});
</script>
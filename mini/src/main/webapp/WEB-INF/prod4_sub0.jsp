<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<link rel="stylesheet" href="/css/Base_rgbPepero.css">
	<link rel="stylesheet" href="/css/prod4_sub0.css">
	<title>상품 정보</title>
</head>
<body> 
    <!-- wrap START -->
 <div id="app"> 
    <div id="wrapper">
        <div class="prodCategoryList">
            <ul>
            	<li class="prodCategoryList_li" v-for="(item, index) in catList" @click="fnChange(item.code, $event)"><template v-if="item.code == pKind"><b>{{item.name}}</b></template><template v-else>{{item.name}}</template></li>
            </ul>
            </div>
        <div id="contentbox">
            <div id="prodboxtop">
                <div id="imgbox">   
                	<img id="mainimg" :src="list.imgSrc">
                </div>
                <div id="explainbox">
                    <div>상품명 : <span>{{list.pName}}</span></div>
                    <div>좋아요 : {{list.iLike}}</div>
                    <div>재고 :{{list.pSale}}</div>
                    <div>상품 가격 : {{list.pPrice}}</div>
                    <hr id="inner_line" class="div_line">
                    <div class="buttonbox">
                        <button>레지스트리 등록</button>
                        <button @click="fnMoveModifyProduct">상품정보수정</button>
                    </div>
                </div>
                
            </div>
            <div id="prodboxbottom">
                {{list.pContent}}
            </div>
            <hr class="div_line"></hr>
            <h3>후기</h3>
            <div id="reviewbox">
                <div id="re_tb">
                    <table id="review_table">
                        <!-- <template> -->
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><button>후기 수정</button></td>
                        </tr>
                        <tr>
                            <!-- 사진 -->
                            <td><img src=""></td>
                            <td><img src=""></td>
                            <td><img src=""></td>
                            <td><img src=""></td>
                            <td><img src=""></td>
                        </tr>
                        <tr>
                            <!-- 내용 -->
                            <td colspan="5"><div class="review_detail">
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                            </div></td>
                        </tr>
                        <tr>
                            <td colspan="5"><hr class="div_line"></hr></td>
                        </tr>
                        <!-- </template> -->
                    </table>
            </div>
        </div>
    </div>
  </div>  
 </div> 
    <!-- wrap END -->
</body>
<jsp:include page="/layout/footer.jsp"></jsp:include>
<script type="text/javascript">
    var app = new Vue({ 
        el: '#app',
        data: {
        	productNo : "${map.productNo}",      	
            list : [],
            pKind : "",
            catList : [],
            checkList : []
    
        }   
        , methods: {
        	fnChange : function(code, event){
        		var self = this;
        		
        		self.keyword = "";
        		console.log(self.selectPage);
        		if(code == "W"){
        			location.href="/weddingrecommend.do";
        		}else if(code == "A"){
        			location.href="/triprecommend.do";
        		}else{
            		self.pKind = code;
            		self.pageChange("./product.do", {pKind : self.pKind});
            		
                    
                    
        		}
        		console.log(self.selectPage);
        	},fnGetCategoryList : function(){
	            var self = this;
	            var nparmap = {};
	            $.ajax({
	                url:"/categoryList.dox",
	                dataType:"json",	
	                type : "POST", 
	                data : nparmap,
	                success : function(data) { 
	                	self.catList = data.code;
	                	}
	           		}); 
	        }
        	,
            fnProductInformation : function(){
                var self = this;
                var nparmap = {productNo : self.productNo};
                $.ajax({
                    url:"/producttemporaryinfo.dox",
                    dataType:"json",	
                    type : "POST", 
                    data : nparmap,
                    success : function(data) { 
                        self.list = data.list;
                        self.pKind = self.list.pKind;
                    }
                }); 
            },
            fnMoveModifyProduct : function(){
        		var self = this;
        		location.href="/productmodifytemporary.do";
        	}, pageChange : function(url, param) {
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
        }   
        , created: function () {
            var self = this;
            self.fnProductInformation();
            self.fnGetCategoryList();
    
        }
    });
    </script>
</html>
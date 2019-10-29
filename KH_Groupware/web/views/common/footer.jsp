<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<style>
   #page-container {
     position: relative;
     min-height: 13vh;
   }
   
   #content-wrap {
     padding-bottom: 2.5rem;    /* Footer height */
   }
   
   #footer {
     position: sticky;
     bottom: 0;
     width: 100%;
     /* height: 2.5rem;  */           /* Footer height */
      height: 250px;
      background: #262A2D;
      color: #F6F6F6;
      display: inline-block;
      border: none;
   }
   
   .footerDiv li{
      list-style:none;
   }

   #footerImg{
      float: right;
       margin: 10px;
   }
   .footerDiv{
      background: #262A2D; 
      /* background: grey; */
      color: #F6F6F6;
      font-size: 12px;
      position: absolute;
      bottom: 40px;
      left: 0px; 
      border: none;
      
   }
    
    .footerDiv2 li{
       list-style: none;
    }
    
    .footerDiv2{
    
      background: #262A2D; 
      /* background: grey; */
      color: #F6F6F6;
      font-size: 12px;
      position: absolute;
      right: 0px;
      bottom:60px; 
   }
   
   #img1{
      width: 50px;
   }
   #img2{
      width: 50px;
   }
   #img1:hover{
      background: red;
   }
   #img2:hover{
      background: red;
      
   }
   .li1{
        font-size: 17px;
   		margin-bottom: 5px;
   }
   .ul1{
   		position: relative;
   		left: 20px; 
   		bottom: 5px;
   
   }
   
   #footerTitle{
   		position: relative; 
   		bottom: 16px;
   	
   }
   
</style>
<script>
   $("#img1").click(function() {
      alert("ds");
      $(this).css({"background":"red"});
   });
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>footer test</title>
</head>
<body>
  <div id="page-container">
 <!--    <div id="content-wrap">
    </div> -->
    <footer id="footer">
   <!--    <div class= footerTitle><h3>KH Groupware</h3></div> -->
         <!-- <div style="height: 5px"></div> -->
         &nbsp;&nbsp;
         <div class=footerDiv style="width: 1480px; height:180px; display: inline-block;">
            　
            <ul class= "ul1">
               <li ><h1 id= "footerTitle" style="text-align: left;height: 77px;">KH Groupware</h1></li>
               <li class="li1">| SEMI-5조 | 이거사조 | 강현모, 안상재, 이준배, 조호관 |</li>
               <li class="li1">  주소: 서울특별시 강남구 테헤란로14길 6 남도빌딩 5F S반 </li>
               <li class="li1">Copyright 2019. 이거사조. ALL RIGHTS RESERVED</li>
            </ul>
            
             
         </div>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="footerDiv2" style="width: 355px; height:180px;display: inline-block;">
            　
             <ul style="font-size: 20px;">
               <li><h3 style="text-align-last: center;">CLICK BUTTON!</h3></li>
               <li style="text-align: center; height: 50px;">-----------------</li>
               <li style="text-align: center; height: 50px;">Alliance With</li>
               <li target="_blank" style="text-align-last: center;">
                  <img id="img1" src ="<%=request.getContextPath() %>/images/icon/kh.png"  onclick="location.href='https://iei.or.kr/main/main.kh'">
                  <img id="img2" src ="<%=request.getContextPath() %>/images/icon/hrd.png" onclick="location.href='http://hrd.go.kr/hrdp/ma/pmmao/indexNew.do'">
               </li>
            </ul>
         </div>
   </footer>
  </div>
</body>
</html>
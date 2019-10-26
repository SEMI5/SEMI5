<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<style>

#page-container {
   #page-container {
     position: relative;
     min-height: 13vh;
   }
   
#content-wrap {
     padding-bottom: 2.5rem;    /* Footer height */
 }
 
/* .footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: red;
   color: white;
   text-align: center;
} */
 #footer {
     position: absolute;
     bottom: 0;
     width: 100%;
     /* height: 2.5rem;  */           /* Footer height */
      height: 250px;
      background: #262A2D;
      color: #F6F6F6;
      display: inline-block;
      
   }

#footerImg{
      float: right;
       margin: 10px;
}
   #content-wrap {
     padding-bottom: 2.5rem;    /* Footer height */
   }
   
   #footer {
     position: absolute;
     bottom: 0;
     width: 100%;
     /* height: 2.5rem;  */           /* Footer height */
      height: 250px;
      background: #262A2D;
      color: #F6F6F6;
      display: inline-block;
   }
   
   .footerDiv li{
   	list-style:none;
   }
#footerDiv1{
      background: #262A2D; 
      /* background: grey; */
      color: #F6F6F6;
      font-size: 12px;
      margin-left : 10px;
}
#footerDiv2{
      background: #262A2D; 
      /* background: grey; */
      color: #F6F6F6;
      font-size: 12px;
      margin-left : 800px;
}
#img1{
      width: 50px;
}

#img2{
      width: 50px;
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
    <div id="content-wrap">

<!-- <div class="footer"> -->
<div id="footer">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <div style="height: 5px"></div>
         &nbsp;&nbsp;
         <div id="footerDiv1" style="display: inline-block;">
            <ul>
               <li><h2>KH Groupware</h2></li>
               <li>| SEMI-5조 | 이거사조 | 강현모, 안상재, 이준배, 조호관 |</li>
               <li>  주소: 서울특별시 강남구 테헤란로14길 6 남도빌딩 5F S반 </li>
               <li>Copyright 2019. 이거사조. ALL RIGHTS RESERVED</li>
            </ul>
         </div>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div id="footerDiv2" style="width: 250px; height:180px; display: inline-block;">
            <ul>
               <li><h2>KH Groupware's</h2></li> 
               <li><h3>CLICK HERE!</h3></li>
               <li style="text-align: center;">-----------------</li>
               <li style="text-align: center;">Alliance With</li>
               <li style="text-align-last: center;">
                  <img id="img1" src ="<%=request.getContextPath() %>/images/icon/KH.png">
                  <img id="img2" src ="<%=request.getContextPath() %>/images/icon/HRD.png">
               </li>
            </ul>
         </div>  
  
		</div>
    </div>
</div>
   
   
</body>
</html>
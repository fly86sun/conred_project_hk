<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title> 
<script src="js/jquery-3.4.1.js"></script>
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">   
	$(document).ready(function(){
	    $("#modal_Btn").click(function(){
	        $("div.modal").modal(); 
	    });
	});
	
	
	
	// 이미지 정보들을 담을 배열
    var sel_files = [];


    $(document).ready(function() {
        $("#input_imgs").on("change", handleImgFileSelect);
    }); 

    function fileUploadAction() {
        console.log("fileUploadAction");
        $("#input_imgs").trigger('click');
    }

    function handleImgFileSelect(e) {

        // 이미지 정보들을 초기화
        sel_files = [];
        $(".imgs_wrap").empty();

        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var index = 0;
        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
  
            sel_files.push(f);

            var reader = new FileReader();
            var imges;
            reader.onload = function(e) {
                var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                imges=$(".imgs_wrap");
	                imges.append(html);
	                index++;
            }
            reader.readAsDataURL(f);
            
        });
    }



    function deleteImageAction(index) {
        console.log("index : "+index);
        console.log("sel length : "+sel_files.length);

        sel_files.splice(index, 1);

        var img_id = "#img_id_"+index;
        $(img_id).remove(); 
    }

    function fileUploadAction() {
        console.log("fileUploadAction");
        $("#input_imgs").trigger('click');
    }
	

	 
	
</script>  
<style type="text/css"> 
	.modal-title{margin-left: 400px;}
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; }
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left;}
	
	input[type=file] {
            display: none;
     }

     .my_button {
         display: inline-block;
         width: 200px;
         text-align: center;
         padding: 10px;
         background-color: #006BCC;
         color: #fff;
         text-decoration: none;
         border-radius: 5px;
     }



     .imgs_wrap {

         width: 700px;
 
     }
     .imgs_wrap img {   
         max-width: 150px;
         margin-left: 5px;
         margin-right: 5px;
     }
	
	.input_wrap {clear: both;}
	
	  
</style> 
</head>
<body>      
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
  		<!-- Modal content-->
   		<div class="modal-content">
     		<div class="modal-header">
       			<button type="button" class="close" data-dismiss="modal">리뷰 작성 완료</button>
       			<h4 class="modal-title">가게이름</h4>
     		</div>
     		<div class="modal-body"> 
       			<span>서비스 ☆☆☆☆☆</span>|<span>가격 ☆☆☆☆☆</span>|<span>청결도 ☆☆☆☆☆</span>
     		</div>  
     		<div class="modal-footer"> 
     			<div style="margin-bottom: 50px; width: 870px;  ">   
				    <div class="imgs_wrap" style="width: 850px; border: 1 solid black;">    
				           
				    </div>          
				    <div class="input_wrap" style="border: 0;"> 
				        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
				        <input type="file" id="input_imgs" multiple/>
				    </div>   
				</div>
       			<textarea rows="20" cols="120" style="resize: none;" placeholder="리뷰 작성 해주세요."></textarea>
     		</div>
   		</div>  
	</div> 
</div>  
<div>
	<button id="modal_Btn">모달 실행하기</button>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
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

         border: 2px solid #A8A8A8;
         margin-top: 30px;
         margin-bottom: 30px;
         padding-top: 10px;
         padding-bottom: 10px;
		 width: 800px;
     }
     .imgs_wrap img {
         max-width: 120px;
         max-height: 120px; 
         min-width: 120px; 
         min-height: 120px; 
         margin-left: 10px;
         margin-right: 10px;
     }
     
     .backimg{width: 140px; height:90px; margin-left: 5px; background-color:#E6E6E6; text-align: center; line-height: 90px;}
     .backimg_size{color: #A4A4A4;} 
</style>


<script type="text/javascript">

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
            reader.onload = function(e) {
                var html = "<a style='width:120px;height:120px;' href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile overfive' title='Click to remove' ></a>";
                $(".imgs_wrap").append(html);
                index++; 	
				if(index>5){ 
					$(".overfive").eq(5).remove();
					$(".b").text("5개까지만 등록할 수 있습니다.");
				}else{
					$(".b").text("");
				}
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
</head>
<body> 
<div>
    <div class="imgs_wrap">
    	<div class="backimg">
  			<span class="backimg_size">140x90</span>
    	</div>   
<!--         <img id="img" /> -->
    </div>
</div> 
<div>
    <div class="input_wrap">
    	<div class="b"></div>
        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
        <input type="file" id="input_imgs" multiple/>
    </div>
</div>

</body>
</html>
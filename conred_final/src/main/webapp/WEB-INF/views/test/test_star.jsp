<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="css/star.css" rel="stylesheet">
<script type="text/javascript">
	onload=function(){
		starRating(); 
	}
	var starRating = function(){
		  var $star = $(".star-input"),
		      $result = $star.find("output>b");
		  $(document)
		    .on("focusin", ".star-input>.input", function(){
		    $(this).addClass("focus");
		  })
		    .on("focusout", ".star-input>.input", function(){
		    var $this = $(this);
		    setTimeout(function(){
		      if($this.find(":focus").length === 0){
		        $this.removeClass("focus");
		      }
		    }, 100);
		  })
		    .on("change", ".star-input :radio", function(){ 
		    $result.text($(this).next().text());
		  })
		    .on("mouseover", ".star-input label", function(){
		    $result.text($(this).text());
		  })
		    .on("mouseleave", ".star-input>.input", function(){
		    var $checked = $star.find(":checked");
		    if($checked.length === 0){
		      $result.text("0");
		    } else {
		      $result.text($checked.next().text());
		    }
		  });
	
		};
</script>
</head>
<body>
<h1>별점테스트</h1>
<span class="star-input">
  <span class="input">
    <input type="radio" name="star-input" id="p1" value="1"><label for="p1">0.5</label>
    <input type="radio" name="star-input" id="p2" value="2"><label for="p2">1</label>
    <input type="radio" name="star-input" id="p3" value="3"><label for="p3">1.5</label>
    <input type="radio" name="star-input" id="p4" value="4"><label for="p4">2</label>
    <input type="radio" name="star-input" id="p5" value="5"><label for="p5">2.5</label>
    <input type="radio" name="star-input" id="p6" value="6"><label for="p6">3</label>
    <input type="radio" name="star-input" id="p7" value="7"><label for="p7">3.5</label>
    <input type="radio" name="star-input" id="p8" value="8"><label for="p8">4</label>
    <input type="radio" name="star-input" id="p9" value="9"><label for="p9">4.5</label>
    <input type="radio" name="star-input" id="p10" value="10"><label for="p10">5</label>
  </span>
  <output for="star-input"><b>0</b>점</output>
</span>

</body>
</html>
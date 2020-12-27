<!DOCTYPE HTML>
<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Navbar</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/myCss.css">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<script src="/fund/resources/myjsFunction/projectFunction.js"></script>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<style type="text/css">


.dropdown-submenu {
    position: relative;
}

.dropdown-submenu>.dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: -6px;
    margin-left: -1px;
    -webkit-border-radius: 0 6px 6px 6px;
    -moz-border-radius: 0 6px 6px;
    border-radius: 0 6px 6px 6px;
}

.dropdown-submenu:hover>.dropdown-menu {
    display: block;
}

.dropdown-submenu>a:after {
    display: block;
    content: " ";
    float: right;
    width: 0;
    height: 0;
    border-color: transparent;
    border-style: solid;
    border-width: 5px 0 5px 5px;
    border-left-color: #ccc;
    margin-top: 5px;
    margin-right: -10px;
}

.dropdown-submenu:hover>a:after {
    border-left-color: #fff;
}

.dropdown-submenu.pull-left {
    float: none;
}

.dropdown-submenu.pull-left>.dropdown-menu {
    left: -100%;
    margin-left: 10px;
    -webkit-border-radius: 6px 0 6px 6px;
    -moz-border-radius: 6px 0 6px 6px;
    border-radius: 6px 0 6px 6px;
}
body{
    padding:10px;
}

.show-on-hover:hover > ul.dropdown-menu {
    display: block;    
}
</style>


</head>
  <body onload='build()'>

  
<!------ Include the above in your HEAD tag ---------->



<div class="container">
	<div class="row">


      
        <!-- Single button -->
        <div class="btn-group">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
           	 카테고리
          </button>
          <ul id="category" class="dropdown-menu" role="menu">
       
          </ul>
		 </div>
		 
		 
		 <div class="btn-group">
		           
          
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
           	 상태
          </button>
          <ul id="state" class="dropdown-menu" role="menu">
          </ul>
		 
		 </div>
		 
		 
		 
		 <div class="btn-group">
		           
          
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
           	 달성률
          </button>
          <ul id="achieveRate" class="dropdown-menu" role="menu">

          </ul>
		 
		 </div>
		 
		 
	</div>
</div>

 
 
 
    
<div class="container">
	<div class="row">
        <div class="dropdown">
            <a id="dLabel" role="button" data-toggle="dropdown" class="btn btn-primary" data-target="#" href="/page.html">
                Dropdown <span class="caret"></span>
            </a>
    		<ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
            
            </ul>
        </div>
	</div>
</div>
<form id="rateForm" action="discover">
	<input type="text" name="minAchieveRate" id="min" maxlength="4" oninput="numberMaxLength(this)"> - 
	<input type="text" name="maxAchieveRate" id="max" maxlength="4" oninput="numberMaxLength(this)">
	<span id="warn">s</span>
	<input type="button" id="sub" value="적용"> 
</form>


<script type="text/javascript">

function numberMaxLength(e){
	e.value = e.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
	if(e.value.length > e.maxLength){
		e.value = e.value.slice(0, e.maxLength);
	}
}

$(document).ready(function(){

	$("#sub").prop("disabled",true); //초기에는 disable
	$("#sub").attr('style','opacity:0.5');
	
	$('input[type="text"]').on('keyup',function(){ //값 넣으면..?
			
			var min = Number($('#min').val());
			var max = Number($("#max").val());
			
			
			console.log("min:"+min);
			console.log("max:"+max);

			//경우의 수
			//1.값이 둘다 없음 -> disable
			//2.max에 값이 들어왔는데 min보다 작음 ->disable + text로 명시해줌 ->상위 조건문에 둘다 값이 있는데, 로 해야할듯
			//3.둘 중 하나만 들어왔을 경우
			
			
			
			if((min=='' && max=='')){ //둘다 값 안들어옴.
				console.log("둘다 값 ㄴㄴ")
				$('#sub').prop("disabled",true);
				$("#sub").attr('style','opacity:0.5');
				
			}else if((min!=''&& max=='') || (max !=''&& min=='' )){
				console.log("둘중 하나만");
				$('#sub').prop("disabled",false);
				$('#sub').removeAttr('style');
				$('#warn').text('');
				
			} else if(min!='' && max !=''){ //둘다 들어옴
				
				if(max<=min){ //max가 작음
					console.log("둘다들어왔는데 맥스가 더 작아");
					$('#sub').prop("disabled",true);
					$("#sub").attr('style','opacity:0.5');
					$('#warn').text("다시적어라");
					
					
				} else{ //그것만 아니면 ㄱㅊ
					console.log("둘다 들왔고 괜찮음");
					$('#sub').prop("disabled",false);
					$('#sub').removeAttr('style');
					$('#warn').text('');
				}
				
			}
			
			$("min").val(min);
			$("max").val(max);
		
	});

});
	

$("#sub").click(function(){
	var path = makePath();
	path = "?"+makePath;
	$('#rateForm').attr('action','discover'+path);

	$('#rateForm').submit();
	
});
	





function removeParam(name, _url){
    var reg = new RegExp("((&)*" + name + "=([^&]*))","g");
    return _url.replace(reg,'');
}

function makePath(){
	let url = location.search;
	url = url.replace(/\?/gi,''); //물음표 없앰
	var param = url.split('&');
	var path = '';
	
	if(param !=''){
		for(var i in param){
			path += '&'+param[i];
		}
	}
	
	console.log(path);
	return path;
}


function build(){
	
		
	cateBuild();
	stateBuild();
	//achieveRate();
		//var html ='<c:set var="path" value="'+path+'" />'
		//$("#p").append(html);*/
		
		/*
		var path = location.search
		if(path==''){ path +='?category='+category;}
		else{ path +='&category='+category;}
	
		console.log(path);
		location.href= path;
		*/
		
}

/*
function achieveRate(){
	var path = makePath();
	path = removeParam('achieveRate', path);
	path = removeParam('minAchieveRate', path);
	path = removeParam('maxAchieveRate', path);
	
	var rateLinks = [
		{'75% 이하' : '?achieveRate=1'},
		{'75% ~ 100%' : '?achieveRate=2'},
		{'100% 이상' : '?achieveRate=3'},
		{'직접 입력' : ''}
		
	];
	
	
	$.each(rateLinks,function(list,map){
		$.each(list,function(percent, value){
			console.log(percent);
			console.log(value);
			var output ='';

				output += '<li><a href="/fund/discover'+value+path'">'+percent+'</a></li>';

			$("#achieveRate").append(output);
			
		});
		
		
	});
}
*/
	
function stateBuild(){
	var path = makePath();
	path = removeParam('ongoing', path);

	
	
	var stateLinks = [ 
		{'진행중인 프로젝트':'?ongoing=ongoing'},
		{'성사된 프로젝트':'?ongoing=confirm'},
		{'공개예정 프로젝트':'?ongoing=prelaunching'}
			
	];
	
	$.each(stateLinks, function(index,list){
		$.each(list, function(title,param){
			var output ='';
			output += '<li><a href="/fund/discover'+param+path+'">'+title+'</a></li>';
			$("#state").append(output);
		});
		
	});
	
	
}

	
function cateBuild(){
	
	//무족권 앞에 붙일거임..
	var path = makePath();
	path = removeParam('category', path);


	console.log("path:"+path);
	


	
	var categoryLinks = [
		 {  
			 'game': { 
				 	'title' : '게임',
			 		'게임전체' : 'games',
					'모바일 게임' : 'mobile-game', 
					'비디오 게임':'video-game',
					'보드 게임':'board-game'} ,
		 },
		 
		 {
			 'show': { 
				 	
				 	'title' : '공연',
				 	'공연전체' : 'dance',
					'무용' : 'dance', 
					'뮤지컬':'musical',
					'공연':'theater'},
		  
	 	 },
	 	 
	 	 {'design': {
	 				'title' : '디자인',
	 		 		'디자인 전체' : 'design',
					 '건축, 공간' : 'architecture', 
					 '그래픽 디자인':'graphic-design',
					 '제품 디자인':'product-design'}
 		 },
 		 
 		 {'comics': {'title' : '만화', '모든만화' : 'comics',
					'웹툰' : 'web-comics', 
					'만화책':'comic-books',
					}
         },
 		 {'art': {'title' : '예술',
 			 	  '모든예술' : 'art',
 			 	  '전시' : 'exhibitions',
				  '웹툰' : 'sculpture-and-action-figures', 
				  '일러스트레이션':'illustration',
				 }
  		 },		
         
  		 {'crafts': {'title' : '공예',
				 	  '모든공예' : 'crafts',
				 	  '캔들&조향&비누' : 'candles-and-diffusers-and-soaps',
				 	  '가죽&금속&목 공예' : 'leather-and-metal-and-woodworking',
				 	  '도예' : 'pottery',
					  
					}
			 },
			 
			{'photography': {'title' : '사진',
					 	  '모든사진' : 'photography',
					 	  '인물' : 'people-photography',
					 	  '배경' : 'space-and-urban-photography',
					 	  '동물' : 'animals-photography',
						  
						}
			 
		 },

 		{'video': {'title' : '영상',
					 	  '모든영상' : 'video',
					 	  '영화' : 'film',
					 	  '다큐멘터리' : 'documentary',
					 	  '애니메이션' : 'animation',
					 	  '뮤직비디오' : 'music-videos',
						  
				   }
 
 		},
 		
			{'food': {'title' : '음식',
					 	  '모든음식' : 'food',
					 	  '에피타이저' : 'appetizer',
					 	  '메인디쉬' : 'main-dish',
					 	  '디저트' : 'dessert',
						  
				 }
			},
			
			{'music': {'title' : '음악',
				 	  '모든음악' : 'music',
				 	  '클래식' : 'classical-music',
				 	  '대중음악' : 'popular-music',
				 	  '인디음악' : 'independent-music',
					  
			 		}
			},
			
			{'publication': {'title' : '출판',
						 	  '모든출판' : 'publication',
						 	  '잡지' : 'zines',
						 	  '문학&에세이' : 'literature-and-essay',
						 	  '그림책' : 'picture-books',
							  
					 		}
		},
		
			{'technology': {'title' : '테크',
					 	  '모든테크' : 'technology',
					 	  '소프트웨어' : 'software',
					 	  '하드웨어' : 'hardware',
					 	  '앱' : 'apps',
					 	  '웹' : 'web',
						  
				 		}
		},
		
			{'fashion': {'title' : '패션',
					 	  '모든패션' : 'fashion',
					 	  '의류' : 'apparels',
					 	  '악세서리' : 'accessories',
					 	  '뷰티' : 'beauty',

						  
				 		}
		},
	
			{'journalism': {'title' : '저널',
					 	  '모든저널' : 'journalism',
					 	  '오디오 저널' : 'audio-journals',
					 	  '비디오 저널' : 'video-journals',
					 	  '웹 저널' : 'web-journals',
						  
				 		}
		},


 		
 		
 		
         
    ];
	
	
	$.each(categoryLinks, function(index, list){		
		
		$.each(list,function(mainCate, subCateList){

			$.each(subCateList, function(index,subCate){
				if(index=='title'){
					var mainCategory ='';
					mainCategory = '<li class="dropdown-submenu"><a href="#">'+subCate+'</a><ul id="'+mainCate+'" class="dropdown-menu"></ul>';
					
					$('#category').append(mainCategory);
				} else{
					var output='';
					output += '<li><a href="/fund/discover?category='+subCate+path+'">'+index+'</a></li>';
					
					
					$('#'+mainCate).append(output);
				}
			});

		});

	});
	

}
	


</script>
      
</body>
</html>
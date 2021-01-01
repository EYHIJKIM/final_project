

function build(){
	
	sortBuild();
	cateBuild();
	stateBuild();
	achieveRateBuild();
	currentMoneyBuild();
	buttonSet();
		
}


$("#init").click(function(){location.href='discover'});




$(document).ready(function(){

	$("#rateSub").prop("disabled",true); //초기에는 disable
	$("#rateSub").attr('style','opacity:0.5');
	
	$("#moneySub").prop("disabled",true); //초기에는 disable
	$("#moneySub").attr('style','opacity:0.5');
	
	
	$('input[type="text"]').on('keyup',function(){ //값 넣으면..?
			
			var min = $('#min').val();
			var max = $("#max").val();
			
			var minM = $('#minMoney').val();
			var maxM = $("#maxMoney").val();


			//경우의 수
			//1.값이 둘다 없음 -> disable
			//2.max에 값이 들어왔는데 min보다 작음 ->disable + text로 명시해줌 ->상위 조건문에 둘다 값이 있는데, 로 해야할듯
			//3.둘 중 하나만 들어왔을 경우
			
			
			
			if(min==='' && max===''){ //둘다 값 안들어옴.
				console.log("둘다 값 ㄴㄴ")
				$('#rateSub').prop("disabled",true);
				$("#rateSub").attr('style','opacity:0.5');
				
			}else if( (min!==''&& max==='') || (max !==''&& min==='' ) ){
				console.log("둘중 하나만");
				$('#rateSub').prop("disabled",true);
				$("#rateSub").attr('style','opacity:0.5');
				$('#rateWarn').text('');
				
			} else if(min!=='' && max !==''){ //둘다 들어옴
				
				if( Number(max)<=Number(min) ){ //max가 작음
					console.log("둘다들어왔는데 맥스가 더 작아");
					$('#rateSub').prop("disabled",true);
					$("#rateSub").attr('style','opacity:0.5');
					$('#rateWarn').text(min+"보다 작은 수를 입력하세요 ");
					
					
				} else{ //그것만 아니면 ㄱㅊ
					console.log("둘다 들왔고 괜찮음");
					$('#rateSub').prop("disabled",false);
					$('#rateSub').removeAttr('style');
					$('#rateWarn').text('');
				}
				
			}

			
			
			
			
			
			
			
			//이건 currentMOney 폼 조건
			
			if( minM==='' && maxM==='' ){ //둘다 값 안들어옴.
				console.log("둘다 값 ㄴㄴ")
				$('#moneySub').prop("disabled",true);
				$("#moneySub").attr('style','opacity:0.5');
				
			}else if( (minM !==''&& maxM==='') || ( maxM !==''&& minM==='') ){ //하나만 들어옴
				console.log("둘중 하나만");
				$('#moneySub').prop("disabled",true);
				$('#moneySub').attr('style','opacity:0.5');
				$('#moneySub').text('');
				
				
			} else if( (minM ===0 || minM !=='') && (maxM ===0 || maxM !=='') ){ //둘다들어옴
						//minM이 숫자0 이거나 혹은 값이 있으면 true반환 
				
				if( Number(maxM)<=Number(minM) ){ //max가 작음
					console.log("둘다들어왔는데 맥스가 더 작아");
					$('#moneySub').prop("disabled",true);
					$('#moneySub').attr('style','opacity:0.5');
					$('#moneyWarn').text(minM+"보다 낮은 값을 입력해주세요");
					
					
				} else{ //그것만 아니면 ㄱㅊ
					console.log("둘다 들왔고 괜찮음");
					$('#moneySub').prop("disabled",false);
					$('#moneySub').removeAttr('style');
					$('#moneyWarn').text('');
				}
				
			}
			
			
			
			
			
			
		
	});

	

});

//비율 버튼
$("#rateSub").click(function(){
	var path = makePath();
	path = removeParam('maxAchieveRate',path);
	path = removeParam('minAchieveRate',path);
	path = removeParam('achieveRate', path);
	location.href="discover?minAchieveRate="+$("#min").val()+"&maxAchieveRate="+$("#max").val()+path;
	
});


//돈 버튼
$("#moneySub").click(function(){
	var path = makePath();
	path = removeParam('maxMoney',path);
	path = removeParam('minMoney',path);
	path = removeParam('currentMoney', path);
	location.href="discover?minMoney="+$("#minMoney").val()+"&maxMoney="+$("#maxMoney").val()+path;
	
});




function buttonSet(){
	console.log("버튼셋하자");
	let category = [
		 { 
			 		'게임' : 'game',
					'모바일 게임' : 'mobile-game', 
					'비디오 게임':'video-game',
					'보드 게임':'board-game'
		 },
		 
		 {
				 	'공연' : 'show',
					'무용' : 'dance', 
					'뮤지컬':'musical',
					'공연':'theater'
	 	 },
	 	 
	 	 {
	 		 		 '디자인' : 'design',
					 '건축, 공간' : 'architecture', 
					 '그래픽 디자인':'graphic-design',
					 '제품 디자인':'product-design'
 		 },
 		 
 		 {
 			        '만화' : 'comics',
					'웹툰' : 'web-comics', 
					'만화책':'comic-books'
					
         },
 		 {			
 			 	  '예술' : 'art',
 			 	  '전시' : 'exhibitions',
				  '웹툰' : 'sculpture-and-action-figures', 
				  '일러스트레이션':'illustration'
				
  		 },		
         
  		 	{			
				 	  '공예' : 'crafts',
				 	  '캔들&조향&비누' : 'candles-and-diffusers-and-soaps',
				 	  '가죽&금속&목 공예' : 'leather-and-metal-and-woodworking',
				 	  '도예' : 'pottery'
					  
					
			 },
			 
			{			
					 	  '사진' : 'photography',
					 	  '인물' : 'people-photography',
					 	  '배경' : 'space-and-urban-photography',
					 	  '동물' : 'animals-photography'				
			 
		 },

 		{				
					 	  '영상' : 'video',
					 	  '영화' : 'film',
					 	  '다큐멘터리' : 'documentary',
					 	  '애니메이션' : 'animation',
					 	  '뮤직비디오' : 'music-videos'
						  
			
 
 		},
 			{
						
					 	  '모든' : 'food',
					 	  '에피타이저' : 'appetizer',
					 	  '메인디쉬' : 'main-dish',
					 	  '디저트' : 'dessert'
						  
				 
			},
			
			{
				 	  '음악' : 'music',
				 	  '클래식' : 'classical-music',
				 	  '대중음악' : 'popular-music',
				 	  '인디음악' : 'independent-music'
					  
			},
			
			{
						 '출판' : 'publication',
						 '잡지' : 'zines',
						 '문학&에세이' : 'literature-and-essay',
						 '그림책' : 'picture-books'		  			 		
		    },
		    
			{
			
					 	  '모든테크' : 'technology',
					 	  '소프트웨어' : 'software',
					 	  '하드웨어' : 'hardware',
					 	  '앱' : 'apps',
					 	  '웹' : 'web'
						  
			
			},
		
			{
					 	  '패션' : 'fashion',
					 	  '의류' : 'apparels',
					 	  '악세서리' : 'accessories',
					 	  '뷰티' : 'beauty'
			 		
		   },
	
			{
					 	  '저널' : 'journalism',
					 	  '오디오 저널' : 'audio-journals',
					 	  '비디오 저널' : 'video-journals',
					 	  '웹 저널' : 'web-journals'
	
			}	
	];
	

	let state = [
		
		{'진행중인 프로젝트':'ongoing'},
		{'성사된 프로젝트':'confirm'},
		{'공개예정 프로젝트':'prelaunching'}	
	];
	

	let rate = [
		{'100% 이상' : '3'},
		{'75% ~ 100%' : '2'},
		{'75% 이하' : '1'}	
	];
	

	let money = [
		{'1억원 이상' : '5'},
		{'5천만원 ~ 1억원' : '4'},
		{'1천만원 ~ 5천만원' : '3'},
		{'1백만원 ~ 1천만원' : '2'},
		{'1백만원 이하' : '1'}	
	];
	
	
	let sort = [
		{'인기순' : 'popular'},
		{'최신순' : 'publishedAt'},
		{'최다 금액순' : 'amount'},
		{'마감 임박순' : 'EndedAt'}

	];
	
	
	var cateP = '${param.category}';
	var stateP =  '${param.ongoing}';
	var rateP =  urlParam('achieveRate');
	var rateMinP =  urlParam('minAchieveRate');
	var rateMaxP =  urlParam('maxAchieveRate');

	var moneyP =  '${param.currentMoney}';
	var moneyMinP =  '${param.minMoney}';
	
	var moneyMaxP =  '${param.maxMoney}';
	
	var sortP = '${param.sort}';
	
	console.log("rateP:"+rateP);

	
	if(sortP !=''){//소트누룸
		$.each(state,function(list,val){
			$.each(val, function(title,value){
				if(sortP==value){
					$("#sortBtn").html(title);
					
					return false;
				}
				
			});	
		});		
	}//소트
	
	
	
	if(cateP!=''){//카테고리 눌렀다면
		$.each(category,function(list,val){
			$.each(val, function(title,value){
				if(cateP==value){
					$("#cateBtn").html(title);
					return false;
				}
				
			});	
		});		
	}//카테고리
	
	if(stateP!=''){//상태누름
		$.each(state,function(list,val){
			$.each(val, function(title,value){
				if(stateP==value){
					$("#stateBtn").html(title);
					
					return false;
				}
				
			});	
		});		
	}//상태
	
	if(rateP!==null){//달성률 클릭시
		console.log("달성률 클ㄹ릭!");
		$.each(rate,function(list,val){
			console.log(val);
			$.each(val, function(title,value){
				if(rateP==value){
					console.log(rateP);
					$("#rateBtn").html(title);
					return false;
				}
			});	
		});		
	}//달성률
	
	
	if(rateMinP!==null || rateMaxP!==null){//둘다 값이 존재함.
		if(rateMinP==0 && rateMaxP!==null){ //최소달성률이 0이면
			$("#rateBtn").html(rateMaxP+"% 이하");
		} else if(rateMaxP==0 && rateMinP!==null){
			$("#rateBtn").html(rateMinP+"% 이상");
			
		} else if(rateMaxP!==null && rateMinP!==null){//둘다 존재
			$("#rateBtn").html(rateMinP+"% ~ "+rateMaxP+"%");
		}
		
		
	}// 달성률 직접입력
	
	
	if(moneyP!=''){//모인돈 클릭시
		$.each(money,function(list,val){
			$.each(val, function(title,value){
				if(moneyP==value){
					$("#moneyBtn").html(title);
					return false;
				}
			});	
		});		
	}//모인돈
	
	
	
	if(moneyMinP!=='' || moneyMaxP!==''){ //돈 직접입력
		console.log(moneyMinP);
		console.log(moneyMaxP);
		if(moneyMinP==0 && moneyMaxP!==''){ //최소돈 0
			$("#moneyBtn").html(moneyMaxP+"원 이하");
		} else if(moneyMaxP==0 && moneyMinP!=''){
			$("#moneyBtn").html(moneyMinP+"원 이상");
			
		} else if(moneyMaxP!=='' && moneyMinP!==''){//둘다 존재
			console.log("둘다 있으니까 적용하자");
			$("#moneyBtn").html(moneyMinP+"원 ~ "+moneyMaxP+"원");
		}
		
	}//돈 직접입력
	
	
	
	
	
	
	
	
	
	
	
}


 
function sortBuild(){
	var path = makePath();
	path = removeParam('ongoing', path);

	let sortList = [
		{'인기순' : '?sort=popular'},
		{'최신순' : '?sort=publishedAt'},
		{'최다 금액순' : '?sort=amount'},
		{'마감 임박순' : '?sort=EndedAt'},

	];

	
	$.each(sortList,function(list,map){
		$.each(map,function(title, value){
	
			var output ='';
			output += '<li><a href="/fund/discover'+value+path+'">'+title+'</a></li>';

			$("#sort").append(output);
			
		});
		
		
	});
	
	
	
	
}








//모인금액
function currentMoneyBuild(){
	var path = makePath();
	path = removeParam('currentMoney', path);
	path = removeParam('minMoney', path);
	path = removeParam('maxMoney', path);
	
	let moneyLinks = [
		{'직접 입력' : ''},
		{'1억원 이상' : '?currentMoney=5'},
		{'5천만원 ~ 1억원' : '?currentMoney=4'},
		{'1천만원 ~ 5천만원' : '?currentMoney=3'},
		{'1백만원 ~ 1천만원' : '?currentMoney=2'},
		{'1백만원 이하' : '?currentMoney=1'}
		
	];
	
	$.each(moneyLinks,function(list,map){
		$.each(map,function(percent, value){
	
			var output ='';
			if(value!=''){
				output += '<li><a href="/fund/discover'+value+path+'">'+percent+'</a></li>';
				
			} else{
				output = '<li class="divider"></li><li><a>'+percent+'</a></li>';
			}
				
	
				$("#currentMoney").prepend(output);
			
		});
		
		
	});
	
	
}




function achieveRateBuild(){
	var path = makePath();
	path = removeParam('achieveRate', path);
	path = removeParam('minAchieveRate', path);
	path = removeParam('maxAchieveRate', path);
	
	let rateLinks = [
		{'직접 입력' : ''},
		{'100% 이상' : '?achieveRate=3'},
		{'75% ~ 100%' : '?achieveRate=2'},
		{'75% 이하' : '?achieveRate=1'}
		
	];
	
	$.each(rateLinks,function(list,map){
		$.each(map,function(percent, value){
	
			var output ='';
			if(value!=''){
				output += '<li><a href="/fund/discover'+value+path+'">'+percent+'</a></li>';
				
			} else{
				output = '<li class="divider"></li><li><a>'+percent+'</a></li>';
			}
				
	
				$("#achieveRate").prepend(output);
			
		});
		
		
	});
	
	
}




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







	
function stateBuild(){
	var path = makePath();
	path = removeParam('ongoing', path);

	
	
	let stateLinks = [ 
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


	
	
	

	
	let categoryLinks = [
		 {  
			 'game': { 
				 	'title' : '게임',
			 		'모든 게임' : 'game',
					'모바일 게임' : 'mobile-game', 
					'비디오 게임':'video-game',
					'보드 게임':'board-game'} ,
		 },
		 
		 {
			 'show': { 
				 	
				 	'title' : '공연',
				 	'모든 공연' : 'show',
					'무용' : 'dance', 
					'뮤지컬':'musical',
					'공연':'theater'},
		  
	 	 },
	 	 
	 	 {'design': {
	 				'title' : '디자인',
	 		 		'모든 디자인' : 'design',
					 '건축, 공간' : 'architecture', 
					 '그래픽 디자인':'graphic-design',
					 '제품 디자인':'product-design'}
 		 },
 		 
 		 {'comics': {'title' : '만화', 
 			 '모든 만화' : 'comics',
					'웹툰' : 'web-comics', 
					'만화책':'comic-books',
					}
         },
 		 {'art': {'title' : '예술',
 			 	  '모든 예술' : 'art',
 			 	  '전시' : 'exhibitions',
				  '조소&피규어' : 'sculpture-and-action-figures', 
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
		}


 		
 		
 		
         
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


function urlParam(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return 0;
    }
}



//글자 제한 + 텍스트입력 막기
function numberMaxLength(e){
	e.value = e.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');	
	if(e.value.length > e.maxLength){
		e.value = e.value.slice(0, e.maxLength);
	}
}


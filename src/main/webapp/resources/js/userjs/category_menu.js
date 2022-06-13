$(document).ready(function(){
			
			$(".category_list_others_item").click(function(){
				var item = $(this).attr('id');
				alert(item);
				$(".category_list").html("");
				
				var caca = '<div class="category_list_title">'+
							'<a id="2" href="#">패브릭</a>'+
						'</div>'+
						'<ul class="category_tree">'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="20000" href="#" class="category_entry_move">침구세트</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path'+
												'd="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="20100" href="#" class="category_entry_move">이불.이불솜</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
								'</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+

								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
									'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="20101" href="#">이불</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20102" href="#">이불솜.구스</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="20200" href="#" class="category_entry_move">베개.베개커버</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'+<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
								'</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
									'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="20201" href="#">베개커버</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20202" href="#">베개솜</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20203" href="#">라텍스베개</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20204" href="#">폼베개</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20205" href="#">자연소재베개</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20206" href="#">바디필로우.롱쿠션</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20207" href="#">기타베개</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
								'<a id="20300" href="#" class="category_entry_move">테이블.책상</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path'+ 'd="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
							'</button>'+
							'</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
									'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="20301" href="#">패드.스프레드</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20302"  href="#">요.토퍼</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="10303"  href="#">쿨매트</a>'+
										'</li>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
							'<div class="category_entry_header">'+
							'<a id="20400" href="#" class="category_entry_move">매트리스커버</a>'+
							'<button class="category_entry_expand">'+
							'<svg class="icon" width="12" height="12" fill="currentColor"'+
							'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
							'<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
							'</button>'+
							'</li>'+
						'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="20500" href="#" class="category_entry_move">블라인드.롤스크린</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
										'	<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
							'	</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
							'	<div class="category_tree_child_layer" style="overflow: hidden;">'+
							'		<ul class="category_tree_children">'+
							'			<li class="category_tree_children_entry"><a id="20501" href="#">블라인드</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20502" href="#">롤스크린</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20503" href="#">버티컬</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20504" href="#">빔스크린</a>'+
							'			</li>'+
							'		</ul>'+
							'	</div>'+
							'</li>'+
							'<li class="category_entry">'+
							'	<div class="category_entry_header">'+
							'		<a id="20600" href="#" class="category_entry_move">커튼.부자재</a>'+
							'		<button class="category_entry_expand">'+
							'			<svg class="icon" width="12" height="12" fill="currentColor"'+
							'				viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
							'				<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
							'		</button>'+
							'	</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
							'	<div class="category_tree_child_layer" style="overflow: hidden;">'+
							'		<ul class="category_tree_children">'+
							'			<li class="category_tree_children_entry"><a id="20601" href="#">암막커튼</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20602" href="#">일반커튼</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20603" href="#">레이스.속커튼</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20604" href="#">가리개커튼</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20605" href="#">바란스.주방커튼</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20606" href="#">커튼부자재</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20607" href="#">캐노피</a>'+
							'			</li>'+
							'		</ul>'+
							'	</div>'+
							'</li>'+
							'<li class="category_entry">'+
							'	<div class="category_entry_header">'+
							'		<a id="20700" href="#" class="category_entry_move">러그.카페트</a>'+
							'		<button class="category_entry_expand">'+
							'			<svg class="icon" width="12" height="12" fill="currentColor"'+
							'				viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
							'				<path'+
							'					d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
							'		</button>'+
							'	</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
							'	<div class="category_tree_child_layer" style="overflow: hidden;">'+
							'	<ul class="category_tree_children">'+
							'			<li class="category_tree_children_entry"><a id="20701" href="#">극세사.단모러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20702" href="#">사이잘룩러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20703" href="#">샤기러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20704" href="#">면.핸드메이드러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20705" href="#">페르시안러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20706" href="#">라탄.수초러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20707" href="#">샤기러그</a>'+
							'			</li>'+
							'			<li class="category_tree_children_entry"><a id="20708" href="#">기타러그</a>'+
							'			</li>'+
							'		</ul>'+
							'	</div>'+
							'</li>'+
							'<li class="category_entry">'+
							'	<div class="category_entry_header">'+
						'			<a id="20800" href="#" class="category_entry_move">매트</a>'+
						'			<button class="category_entry_expand">'+
						'				<svg class="icon" width="12" height="12" fill="currentColor"'+
						'					viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
						'					<path'+
						'						d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
						'			</button>'+
						'		</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
						'		<div class="category_tree_child_layer" style="overflow: hidden;">'+
						'		<ul class="category_tree_children">'+
						'				<li class="category_tree_children_entry"><a id="20801" href="#">주방.다용토매트</a>'+
						'				</li>'+
						'				<li class="category_tree_children_entry"><a id="20802" href="#">PVC.리빙매트</a>'+
						'				</li>'+
						'				<li class="category_tree_children_entry"><a id="20803" href="#">놀이.안전매트</a>'+
						'				</li>'+
						'				<li class="category_tree_children_entry"><a id="20804" href="#">현관.발매트</a>'+
						'				</li>'+
						'				<li class="category_tree_children_entry"><a id="20805" href="#">피크닉매트</a>'+
						'				</li>'+
						'			</ul>'+
						'		</div>'+
						'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="20900" href="#" class="category_entry_move">쿠션.방석</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path'+
											'd="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
								'</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
								'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="20901" href="#">쿠션</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20902" href="#">스톨.벤치</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="20903" href="#">쿠션.방석솜</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="21000" href="#" class="category_entry_move">소파.생활커버</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
								'</div> '+
								'<!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
								'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="21001" href="#">소파커버</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21002" href="#">소파패드</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21003" href="#">선풍기커버</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21004" href="#">에어컨.제습기커버</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21005" href="#">의자커버</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21006" href="#">원단</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21007" href="#">기타커버</a>'+
										'</li>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="21100" href="#" class="category_entry_move">홈패브릭</a>'+									
										'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path'+
												'd="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
								'</div> <!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
								'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="21101" href="#">담요.블랭킷</a>'+'										</li>'+
										'<li class="category_tree_children_entry"><a id="21102" href="#">실내화</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21103" href="#">홈웨어</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="21200" href="#" class="category_entry_move">주방패브릭</a>'+
								'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path'+
												'd="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
									'</div> '+
								'<!--버튼 누르면 밑에 토글다운 생기게-->'+
									'<div class="category_tree_child_layer" style="overflow: hidden;">'+
								'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="21201" href="#">식탁보.러너</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21202" href="#">테이블매트</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21203" href="#">앞치마.주방장갑</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21204" href="#">행주.티타월</a>'+
										'</li>'+										
										'<li class="category_tree_children_entry"><a id="21205" href="#">기타주방패브릭</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="21300" href="#" class="category_entry_move">욕실패브릭</a>'+
									'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path'+
												'd="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
									'</button>'+
								'</div> '+
								'<!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
								'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="21301" href="#">수건.타월</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21302" href="#">샤워가운</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21303" href="#">샤워커튼</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21304" href="#">발매트</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
						'</li>'+
							'<li class="category_entry">'+
								'<div class="category_entry_header">'+
									'<a id="21400" href="#" class="category_entry_move">유아용패브릭</a>'+									
								'<button class="category_entry_expand">'+
										'<svg class="icon" width="12" height="12" fill="currentColor"'+
											'viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">'+
											'<path d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>'+
											'</button>'+
								'</div> '+
								'<!--버튼 누르면 밑에 토글다운 생기게-->'+
								'<div class="category_tree_child_layer" style="overflow: hidden;">'+
								'<ul class="category_tree_children">'+
										'<li class="category_tree_children_entry"><a id="21401" href="#">이불.패드</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21402" href="#">베개.쿠션</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21403" href="#">놀이매트.러그</a>'+
										'</li>'+
										'<li class="category_tree_children_entry"><a id="21404" href="#">패브릭소품</a>'+
										'</li>'+
									'</ul>'+
								'</div>'+
							'</li> '+
						'<ul class="category_list_others">'+
							'<li id="1" class="category_list_others_item"><a >가구</a></li>'+
							'<li id="16" class="category_list_others_item"><a >조명</a></li>'+
							'<li id="3" class="category_list_others_item"><a href="#">가전</a></li>'+
							'<li id="4" class="category_list_others_item"><a href="#">주방용품</a></li>'+
							'<li id="5" class="category_list_others_item"><a href="#">데코.식물</a>'+
							'</li>'+
							'<li id="7" class="category_list_others_item"><a href="#">수납.정리</a>'+
							'</li>'+
							'<li id="6" class="category_list_others_item"><a href="#">생활용품</a></li>'+
							'<li id="8" class="category_list_others_item"><a href="#">생필품</a></li>'+
							'<li id="9" class="category_list_others_item"><a href="#">공구.DIY</a>'+
							'</li>'+							'<li id="10" class="category_list_others_item"><a href="#">인테리어시공</a>'+
							'</li>'+
							'<li id="11" class="category_list_others_item"><a href="#">반려동물</a></li>'+
							'<li id="12" class="category_list_others_item"><a href="#">캠핑용품</a></li>'+
							'<li id="13" class="category_list_others_item"><a href="#">실내운동</a></li>'+
							'<li id="14" class="category_list_others_item"><a href="#">유아.아동</a>'+
							'</li>'+
							'<li id="15" class="category_list_others_item"><a href="#">렌탈</a></li>'+
						'</ul>'+
					'</section>'+
				'</div>'


		if(item==="2"){
			$(".category_list").append(caca);
			}
				})
			
				
				
				
			
				});
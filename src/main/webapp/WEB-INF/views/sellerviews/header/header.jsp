<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="index.seller">판매자 관리 센터</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group" style="display: none;">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end dropdown-style"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
						data-bs-target="#modal-view">쇼핑몰 정보</a></li>
					<li>
						<hr class="dropdown-divider" />
					</li>
					<li><a class="dropdown-item" href="logout.seller">로그아웃</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Main</div>
						<a class="nav-link" href="index.seller">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 센터 홈
						</a>

						<div class="sb-sidenav-menu-heading">Product Management</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 상품/판매글
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>

						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="insertProduct.seller">상품등록</a>
								<a class="nav-link" href="productManagement.seller">상품관리</a>
								<a class="nav-link" href="productPostingManagement.seller">판매글관리</a>
							</nav>
						</div>

						<a class="nav-link" href="order.seller">
							<div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> 주문관리
						</a>

						<div class="sb-sidenav-menu-heading">Sales Management</div>
						<a class="nav-link" href="salesManagement.seller">
							<div class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> 매출내역
						</a>
						
						<div class="sb-sidenav-menu-heading"><!-- CS Management --></div>
						<a class="nav-link" href="#">
							<div class="sb-nav-link-icon">
								<!-- <i class="bi bi-pencil-square"></i> -->
							</div> <!-- 고객문의 -->
						</a> <a class="nav-link" href="review.seller">
							<div class="sb-nav-link-icon">
								<!-- <i class="bi bi-pencil-square"></i> -->
							</div> <!-- 리뷰관리 -->
						</a> <a class="nav-link" href="notice.seller">
							<div class="sb-nav-link-icon">
								<!-- <i class="bi bi-megaphone-fill"></i> -->
							</div> <!-- 공지사항 -->
						</a>
					</div>

				</div>

				<div class="sb-sidenav-footer">
					<div class="shopName">${seller.getCompany_name()}</div>
					<div class="signDate">
						입점일 : ${entrydate}</div>
				</div>
			</nav>
		</div>
		<!-- 주문상세 Modal -->
		<div class="modal fade" id="modal-view" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-shopinfo">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">쇼핑몰 정보</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body modal-status-select-product">
						<div class="modal-delete-select-product marginTop1">
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">상호명</div>
										<div class="col">${seller.getCompany_name()}</div>
										<div class="col-3 view-title-last">대표이사</div>
										<div class="col">${seller.getRepresentative()}</div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">주소</div>
										<div class="col">
											[우편번호 들어가는곳]
											${seller.getAddress()}</div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding bottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">대표 전화번호</div>
										<div class="col">${seller.getShop_tell()}</div>
										<div class="col-3 view-title-last">대표 이메일</div>
										<div class="col">${seller.getEmail()}</div>
									</div>
								</div>
							</div>
							<div class="product-list-group">
								<div
									class="container container-option container-option-topPadding notbottomline">
									<div class="row optionGroup1">
										<div class="col-3 view-title">입점일</div>
										<div class="col">${entrydate}</div>
										<div class="col-3 view-title-last">사업자등록번호</div>
										<div class="col">${seller.getRegistration_num()}</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>
		</div>
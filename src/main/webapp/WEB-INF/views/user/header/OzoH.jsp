<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../cssList/header/OzoH.css?var=1">
    <link rel="stylesheet" href="../../cssList/header/category.css">
    <link rel="stylesheet" href="../../cssList/header/sidebar.css">
    <link rel="stylesheet" href="../../cssList/header/sidebar_search.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://kit.fontawesome.com/58c5618a7b.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <!-----카테고리js------->
    <script>
        $(document).ready(function () {

            $('#custumstyle .layout-navigation-hamburger-pc__content').hide();
            $('#catcat').mouseover(function () {
                $('.layout-navigation-hamburger-pc__content').children().eq(0).find('a').addClass('on');
                // #gnb에 자식 요소(li)가 몇번째인지를 확인한 후 on이라는 클래스 추가
                $('.layout-navigation-hamburger-pc__content').css({
                    display: 'flex'
                })
            });
            $('.layout-navigation-hamburger-pc').mouseover(function () {
                $('.layout-navigation-hamburger-pc').children().eq(0).find('a').addClass('on');
                // #gnb에 자식 요소(li)가 몇번째인지를 확인한 후 on이라는 클래스 추가
                $('.layout-navigation-hamburger-pc').css({
                    display: 'flex'
                })
            });

            $('.layout-navigation-hamburger-pc').mouseleave(function () {
                $('.layout-navigation-hamburger-pc').hide();
            });
        });
    </script>
    <script>
        $(function () {
            var Accordion = function (el, multiple) {
                this.el = el || {};
                this.multiple = multiple || false;

                // Variables privadas
                var links = this.el.find('.layout-navigation-drawer-secondary-menu__item--openable');
                // Evento
                links.on('click', { el: this.el, multiple: this.multiple }, this.dropdown)
            }

            Accordion.prototype.dropdown = function (e) {
                var $el = e.data.el;
                $this = $(this),
                    $next = $this.next();

                $next.slideToggle();
                $this.parent().toggleClass('open');

                if (!e.data.multiple) {
                    $el.find('.layout-navigation-drawer-secondary-menu__child').not($next).slideUp().parent().removeClass('open');
                };
            }

            var accordion = new Accordion($('#catecate'), false);
        });
    </script>


    <title>Document</title>
</head>

<body>

    <header class="layout-navigation-bar">
        <div class="sticky-container layout-navigation-primary-wrap" >
            <div class="sticky-child layout-navigation-primary"
                style="position: fixed; transition: top 0.1s ease 0s; top: 0px; left: 0px; right: 0px;">
                <div class="layout-navigation-primary__content">
                    <div class="layout-navigation-primary__leftmost"><button
                            class="layout-navigation-bar-icon layout-navigation-bar-drawer-button" title="메뉴"
                            aria-label="메뉴" type="button"><svg id="hambuck_btn" class="icon" width="24" height="24"
                                viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                <path fill="currentColor" d="M3 4h18v2H3V4zm0 7h18v2H3v-2zm0 7h18v2H3v-2z"></path>
                            </svg></button></div>
                    <div class="layout-navigation-primary__left"><a href=""><img src="../../cssList/header/ozohouse-logo.svg" alt="오조의집"></a>
                        <path fill="#000"
                            d="M14.2 25.17H9.28V20.7a1.45 1.45 0 0 0-2.9 0v4.47H1.44a1.45 1.45 0 1 0 0 2.9H14.2a1.45 1.45 0 0 0 0-2.9M4.5 9.15c0-4.6 2.08-5.28 3.33-5.28 1.24 0 3.33.69 3.33 5.28v.36c0 4.6-2.09 5.28-3.33 5.28-1.25 0-3.34-.69-3.34-5.28v-.36zm3.33 8.54c3.84 0 6.23-3.13 6.23-8.18v-.36c0-5.05-2.39-8.18-6.23-8.18-3.85 0-6.24 3.13-6.24 8.18v.36c0 5.05 2.39 8.19 6.24 8.19zm25.54-7.34H17.81a1.45 1.45 0 0 0 0 2.9h15.56a1.45 1.45 0 1 0 0-2.9m-1.55 15.5c-7.08 1.83-9.45.79-10.14.25-.45-.35-.65-.8-.65-1.48v-.87h10.25c.8 0 1.46-.65 1.46-1.45v-5.08c0-.8-.66-1.45-1.46-1.45h-11.7a1.45 1.45 0 1 0 0 2.9h10.25v2.18H19.57c-.8 0-1.45.65-1.45 1.45v2.32a4.6 4.6 0 0 0 1.78 3.78c1.2.93 2.94 1.39 5.21 1.39 2.05 0 4.54-.38 7.44-1.13a1.45 1.45 0 1 0-.73-2.82M20.3 7.83h10.8a1.45 1.45 0 1 0 0-2.9h-9.35V1.45a1.45 1.45 0 1 0-2.9 0v4.93c0 .8.65 1.45 1.45 1.45">
                        </path>
                        <rect width="3" height="15" x="70" fill="#000" rx="1.5"></rect>
                        <path fill="#000"
                            d="M64.5 13.28a1.45 1.45 0 0 0 2.73-1c-.05-.13-1-2.68-3.38-4.5l3.7-4.1a1.45 1.45 0 0 0-1.09-2.42h-9.05a1.45 1.45 0 1 0 0 2.9h5.8l-6.88 7.64a1.45 1.45 0 1 0 2.16 1.95l3.41-3.8a8 8 0 0 1 2.6 3.33M69.56 26.52h-7.01a.82.82 0 0 1-.82-.82v-1.95h8.65v1.95c0 .45-.37.82-.82.82m2.27-9.37c-.8 0-1.45.65-1.45 1.45v2.25h-8.65V18.6a1.45 1.45 0 1 0-2.9 0v7.1a3.73 3.73 0 0 0 3.72 3.72h7.01a3.73 3.73 0 0 0 3.72-3.72v-7.1c0-.8-.65-1.45-1.45-1.45M42.46 3.87c2.22 0 2.33 4.24 2.33 5.08 0 .85-.11 5.09-2.33 5.09-2.21 0-2.32-4.24-2.32-5.08 0-.86.11-5.09 2.32-5.09m0 13.07c1.76 0 3.23-.93 4.14-2.62.71-1.34 1.1-3.2 1.1-5.36s-.39-4.02-1.1-5.37A4.6 4.6 0 0 0 42.46.97c-1.76 0-3.22.93-4.13 2.62-.72 1.35-1.1 3.2-1.1 5.37s.38 4.01 1.1 5.36a4.59 4.59 0 0 0 4.13 2.62">
                        </path>
                        <path fill="#000"
                            d="M51.4.49c-.8 0-1.45.65-1.45 1.45v17.78c-1.93.6-5.75 1.13-10.38 1.13h-2.2a1.45 1.45 0 0 0 0 2.9h2.2c2.64 0 7.21-.23 10.38-1.02v4.84a1.45 1.45 0 0 0 2.9 0V1.94c0-.8-.65-1.45-1.45-1.45">
                        </path>
                        </g>
                        </svg></a>
                    </div>
                    <nav class="layout-navigation-primary__menu">
                        <a class="layout-navigation-primary__menu__item" href="">스토어홈</a>
                        <a id="catcat" class="layout-navigation-primary__menu__item layout-navigation-primary__menu__item--active 
                            layout-navigation-primary__menu__item--open" href="">카테고리</a>

                        <a class="layout-navigation-primary__menu__item" href="/experts">베스트</a>
                        <a class="layout-navigation-primary__menu__item" href="/experts">오늘의딜</a>
                    </nav>
                    <div class="layout-navigation-primary__right">
                        <div class="layout-navigation-bar-search">
                            <div class="layout-navigation-search" id="id-1">
                                <div class="layout-navigation-search__header">
                                    <div id="id-1-combobox" class="layout-navigation-search__combobox" role="combobox"
                                        aria-haspopup="listbox" aria-expanded="false">
                                        <div class="layout-navigation-search__input"><input type="text"
                                                class="layout-navigation-search__input__text" value=""
                                                autocomplete="off" size="1" id="id-1-input" aria-autocomplete="list"
                                                placeholder="스토어 검색" aria-label="스토어 검색"><svg
                                                class="layout-navigation-search__input__icon" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                preserveAspectRatio="xMidYMid meet">
                                                <path d="M22 22l-5-5"></path>
                                                <circle cx="11" cy="11" r="8"></circle>
                                            </svg></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button class="layout-navigation-bar-icon layout-navigation-bar-search-button" title="검색"
                            aria-label="검색" type="button"><svg class="icon" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" preserveAspectRatio="xMidYMid meet">
                                <path d="M22 22l-5-5"></path>
                                <circle id="search_btn" cx="11" cy="11" r="8"></circle>
                            </svg></button>
                       




                        <list class="end_word_pre"><a class="end_word" href="">로그인</a></list>
                        <i id="i_divide" class="fa-solid fa-grip-lines-vertical"></i>
                        <list class="end_word_pre"><a class="end_word" href="">회원가입</a></list>
                        <i id="i_divide" class="fa-solid fa-grip-lines-vertical"></i>
                        <list class="end_word_pre"><a class="end_word" href="">고객센터</a></list>


                    </div>
                </div>

                <!-- --클론상 메뉴 정리가 어려워 메뉴 하나더 추가 접두어에 mobile- 붙임------------------- -->
                <nav class="mobile-layout-navigation-primary__menu">
                    <a class="layout-navigation-primary__menu__item" href="/">스토어홈</a>
                    <a class="layout-navigation-primary__menu__item layout-navigation-primary__menu__item--active 
                        layout-navigation-primary__menu__item--open" href="/store">카테고리</a>
                    <a class="layout-navigation-primary__menu__item" href="/experts">베스트</a>
                    <a class="layout-navigation-primary__menu__item" href="/experts">오늘의딜</a>
                </nav>
                <!-- -----------------------------------사이드바------------------------------------- -->
                <div id="bg_menu"></div>
                <div id="sidebar_site"
                    class="react-modal react-modal--center layout-navigation-drawer-wrap open open-active">

                    <div class="react-modal__content-wrap ">
                        <div id="sidebar_menu" class="react-modal__content layout-navigation-drawer"
                            style="overflow:scroll; height:730px;">
                            <div class="layout-navigation-drawer-header"><a
                                    class="layout-navigation-logo layout-navigation-drawer-header__logo"
                                    aria-label="오늘의집" href="/"><svg class="icon" width="74" height="30"
                                        viewBox="0 0 74 30" preserveAspectRatio="xMidYMid meet">
                                        <g fill="none" fill-rule="evenodd">
                                            <img class="ham_logo" src="ozohouse-logo.svg" alt="오조의집"
                                                style="height:70px;">
                                        </g>
                                    </svg></a>

                                <!-- <div class="layout-navigation-app-download layout-navigation-drawer-header__app-download">
                                     <a class="layout-navigation-app-download__link" href="/app"><svg class="icon"
                                            width="20" height="20" viewBox="0 0 20 20"
                                            preserveAspectRatio="xMidYMid meet">
                                            <g fill="none" fill-rule="evenodd">
                                                <path fill="#35C5F0"
                                                    d="M16.41 0H3.59A3.59 3.59 0 0 0 0 3.59v12.82A3.59 3.59 0 0 0 3.59 20h12.82A3.59 3.59 0 0 0 20 16.41V3.59A3.59 3.59 0 0 0 16.41 0">
                                                </path>
                                                <path fill="#FFF"
                                                    d="M14.75 10.34c-.74 0-1.33-.6-1.33-1.34 0-.74.6-1.34 1.33-1.34s1.32.6 1.32 1.34c0 .74-.59 1.34-1.32 1.34zm-1 3.53H6.12V8.75l3.82-2.7 2.2 1.55a3.01 3.01 0 0 0-.35 1.4 3 3 0 0 0 1.98 2.83v2.04zm1-7.87c-.34 0-.66.06-.97.17l-3.17-2.24a1.18 1.18 0 0 0-1.35 0L4.5 7.28a1.2 1.2 0 0 0-.51.98v6.54c0 .66.53 1.2 1.19 1.2h9.5a1.2 1.2 0 0 0 1.18-1.2v-3.02A3 3 0 0 0 17.7 9c0-1.65-1.32-3-2.96-3z">
                                                </path>
                                            </g>
                                        </svg>앱다운로드</a> 
                                </div> -->
                            </div>
                            <!-- 스마일 로그인 아이콘 -->
                            <!-- <a class="layout-navigation-drawer-user" href="/users/17136427"><span
                                    class="layout-navigation-drawer-user__image"><img class="image" alt=""
                                        src="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=36&amp;h=36&amp;c=c"
                                        srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=72&amp;h=72&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=72&amp;h=72&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/default_images/avatar.png?gif=1&amp;w=144&amp;h=144&amp;c=c 3x"></span><span
                                    class="layout-navigation-drawer-user__nickname">우동이형님</span></a> -->
                            <div class="sidebar2">
                                <a class="sidebar_login" href="">로그인</a>
                                <a class="sidebar_join" href="">회원가입</a>
                            </div>
                            <ul class="layout-navigation-drawer-menu">
                                <li class="layout-navigation-drawer-menu__item-wrap">
                                    <div class="layout-navigation-drawer-menu__item">
                                        <!-- <button class="layout-navigation-drawer-menu__item__button" type="button"><svg
                                                class="icon" width="24" height="24" viewBox="0 0 24 24"
                                                preserveAspectRatio="xMidYMid meet">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path d="M1 1h22v22H1z"></path>
                                                    <path fill="#424242" fill-rule="nonzero"
                                                        d="M5.5 11.5v7.6h13v-7.6h-13zM4 10h16v10.6H4V10z"></path>
                                                    <path fill="#424242" fill-rule="nonzero"
                                                        d="M17.92 4.1H6.08l-2 6h15.84l-2-6zM5 2.6h14l3 9H2l3-9z"></path>
                                                    <path stroke="#424242" stroke-width="1.5"
                                                        d="M13.25 19.85h-2.5v-4.5h2.5v4.5z">
                                                    </path>
                                                </g>
                                            </svg>커뮤니티<svg class="arrow-icon" width="12" height="7" fill="currentColor"
                                                viewBox="0 0 12 7" preserveAspectRatio="xMidYMid meet">
                                                <path d="M11 0L5 6l1 1 6-6z"></path>
                                                <path d="M6 7L0 1l1-1 6 6z"></path>
                                            </svg></button> -->
                                        <div class="layout-navigation-drawer-menu__item__content"
                                            style="overflow: hidden;"></div>
                                    </div>
                                </li>
                                <li class="layout-navigation-drawer-menu__item-wrap">
                                    <div
                                        class="layout-navigation-drawer-menu__item layout-navigation-drawer-menu__item--active layout-navigation-drawer-menu__item--open">
                                        <button class="layout-navigation-drawer-menu__item__button" type="button"><svg
                                                class="icon" width="24" height="24" viewBox="0 0 24 24"
                                                preserveAspectRatio="xMidYMid meet">
                                                <g fill="none" fill-rule="evenodd">
                                                    <path d="M1 1h22v22H1z"></path>
                                                    <path stroke="#424242" stroke-width="1.5" d="M19 12v8H5v-8"></path>
                                                    <path stroke="#424242" stroke-width="1.5"
                                                        d="M3.25 3.75v6a2.5 2.5 0 0 0 2.5 2.5h.5a2.5 2.5 0 0 0 2.5-2.5v-6h-5.5zm6 0v6a2.5 2.5 0 0 0 2.5 2.5h.5a2.5 2.5 0 0 0 2.5-2.5v-6h-5.5zm6 0v6a2.5 2.5 0 0 0 2.5 2.5h.5a2.5 2.5 0 0 0 2.5-2.5v-6h-5.5z">
                                                    </path>
                                                    <path fill="#424242" d="M5.5 3H18v1.03H5.5z"></path>
                                                </g>
                                            </svg>스토어<svg class="arrow-icon" width="12" height="7" fill="currentColor"
                                                viewBox="0 0 12 7" preserveAspectRatio="xMidYMid meet">
                                                
                                            </svg></button>
                                        <div class="layout-navigation-drawer-menu__item__content open expanded"
                                            style="overflow: hidden;">
                                            <ul class="layout-navigation-drawer-secondary-menu">
                                                <li class="layout-navigation-drawer-secondary-menu__item-wrap"><a
                                                        class="layout-navigation-drawer-secondary-menu__item layout-navigation-drawer-secondary-menu__item--active"
                                                        href="/store">스토어홈</a></li>
                                                <li id="catecate"
                                                    class="layout-navigation-drawer-secondary-menu__item-wrap"><button
                                                        class="layout-navigation-drawer-secondary-menu__item layout-navigation-drawer-secondary-menu__item--openable"
                                                        type="button">카테고리<svg class="arrow-icon" width="12" height="7"
                                                            fill="currentColor" viewBox="0 0 12 7"
                                                            preserveAspectRatio="xMidYMid meet">
                                                            <path d="M11 0L5 6l1 1 6-6z"></path>
                                                            <path d="M6 7L0 1l1-1 6 6z"></path>
                                                        </svg></button>
                                                    <div
                                                        class="layout-navigation-drawer-secondary-menu__child open expanded">
                                                        <ul id="accodian" class="layout-navigation-hamburger-mobile">
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=24">식품</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=0">가구</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=1">패브릭</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=27">조명</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=3">가전</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=5">주방용품</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=2">데코/식물</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=11">수납/정리</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=4">생활용품</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=21">생필품</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=6">공구/DIY</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=8">반려동물</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=7">인테리어시공</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=20">캠핑용품</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=22">실내운동</a>
                                                            </li>
                                                            <li class="layout-navigation-hamburger-mobile__item-wrap"><a
                                                                    class="layout-navigation-hamburger-mobile__item"
                                                                    href="/store/category?affect_type=StoreHamburger&amp;category=25">렌탈</a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </li>
                                                <!-- ------------------------아코디언메뉴-------------------------------- -->

                                                <li class="layout-navigation-drawer-secondary-menu__item-wrap"><a
                                                        class="layout-navigation-drawer-secondary-menu__item"
                                                        href="/commerces/ranks">베스트</a></li>
                                                <li class="layout-navigation-drawer-secondary-menu__item-wrap"><a
                                                        class="layout-navigation-drawer-secondary-menu__item"
                                                        href="/commerces/today_deals?special_feed=true">오늘의딜</a></li>
                                                
                                            </ul>
                                        </div>
                                    </div>
                                </li>

                                <ul class="layout-navigation-drawer-user-menu">
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><a
                                            class="layout-navigation-drawer-user-menu__item"
                                            href="/users/17136427">마이페이지</a></li>
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><a
                                            class="layout-navigation-drawer-user-menu__item"
                                            href="/user_shopping_pages/order_list">나의
                                            쇼핑</a></li>
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><a
                                            class="layout-navigation-drawer-user-menu__item"
                                            href="/users/17136427/collections">스크랩북</a>
                                    </li>
                                    
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><a
                                            class="layout-navigation-drawer-user-menu__item"
                                            href="/competitions/feed">이벤트</a></li>
                            
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><a
                                            class="layout-navigation-drawer-user-menu__item"
                                            href="/customer_center">고객센터</a></li>
                                </ul>
                                <ul
                                    class="layout-navigation-drawer-user-menu layout-navigation-drawer-user-menu--footer">
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><a
                                            class="layout-navigation-drawer-user-menu__item"
                                            href="https://partners.ohou.se/partner/applications/new">입점 신청</a></li>
                                    <li class="layout-navigation-drawer-user-menu__item-wrap"><button
                                            class="layout-navigation-drawer-user-menu__item" type="button">로그아웃</button>
                                    </li>
                                </ul>
                        </div>
                    </div>

                </div>
                <script>

                    $(document).ready(function () {
                        var target = $("#sidebar_menu");
                        $('#hambuck_btn').on('click', function () {
                            $('#bg_menu').show();
                            $('#sidebar_menu').show().animate({
                                left: 0
                            });
                        });
                        $(".react-modal__content-wrap").mouseup(function (e) {
                            if (target.has(e.target).length == 0) {
                                $('#bg_menu').hide();
                                $('#sidebar_menu').animate({
                                    left: '-' + 50 + '%'
                                }, function () {
                                    $('#sidebar_menu').hide();
                                });
                            }

                        });

                    });

                </script>

            </div>
            <!-- -------------------------------------------------서치바----------------------- -->
            <div class="bg_search"></div>
            <div id="sidebar_search" class="react-modal__content-wrap">
                <div class="react-modal__content layout-navigation-search-modal__content">
                    <div class="layout-navigation-search layout-navigation-search-modal__search" id="id-14">
                        <div class="layout-navigation-search__header">
                            <div id="id-14-combobox" class="layout-navigation-search__combobox" role="combobox"
                                aria-haspopup="listbox" aria-expanded="false">
                                <div class="layout-navigation-search__input"><input
                                        class="layout-navigation-search__input__text" type="text" autocomplete="off"
                                        size="1" id="id-14-input" aria-autocomplete="list" placeholder="스토어 검색"
                                        aria-label="스토어 검색" value=""><svg class="layout-navigation-search__input__icon"
                                        width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                        stroke-width="2" preserveAspectRatio="xMidYMid meet">
                                        <path d="M22 22l-5-5"></path>
                                        <circle cx="11" cy="11" r="8"></circle>
                                    </svg></div>
                            </div>
                            <button class="layout-navigation-search-modal__search__close" type="button">취소</button>
                        </div>
                        <div>
                            <ul id="id-14-list" class="layout-navigation-search__list" role="listbox"
                                aria-label="스토어 검색">
                                <div class="layout-navigation-search__list__history-header"><span
                                        class="layout-navigation-search__list__history-header__title">최근 검색어</span>
                                </div>
                                <div class="layout-navigation-search__list__history-empty">최근 검색한 내역이 없습니다.</div>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    var target = $("#sidebar_search");
                    $('#search_btn').on('click', function () {
                        $('.bg_search').show();
                        $('#sidebar_search').show().animate({
                            right: 0
                        });
                    });
                    $(".bg_search").mouseup(function (e) {
                        if (target.has(e.target).length == 0) {
                            $('.bg_search').hide();
                            $('#sidebar_search').animate({
                                right: '-' + 50 + '%'
                            }, function () {
                                $('#sidebar_search').hide();
                            });
                        }

                    });

                });
            </script>

        </div>

        </div>
        </div>

    </header>





    <ul id="custumstyle" class="custumstyle">
        <!-- --------------------------------카테고리 메뉴 ------------------------------------------------- -->
        <div class="layout-navigation-tertiary open open-active" style="top: 73px;">
            <div class="layout-navigation-hamburger-pc">
                <ul class="layout-navigation-hamburger-pc__content">
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>


                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=24"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164819973129963284.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164819973129963284.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164819973129963284.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164819973129963284.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">식품</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=0"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164333420626278506.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164333420626278506.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164333420626278506.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164333420626278506.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">가구</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=1"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980444900252.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980444900252.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980444900252.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980444900252.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">패브릭</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=27"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980888059254.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980888059254.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980888059254.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835980888059254.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">조명</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=3"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981383575039.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981383575039.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981383575039.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981383575039.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">가전</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=5"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981863959257.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981863959257.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981863959257.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835981863959257.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">주방용품</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=2"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982382781033.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982382781033.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982382781033.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982382781033.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">데코/식물</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=11"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982930888316.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982930888316.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982930888316.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835982930888316.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">수납/정리</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=4"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163609846171803764.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163609846171803764.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163609846171803764.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163609846171803764.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">생활용품</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=21"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163575475291672614.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163575475291672614.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163575475291672614.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/163575475291672614.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">생필품</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=6"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985103343415.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985103343415.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985103343415.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985103343415.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">공구/DIY</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=8"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986432363224.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986432363224.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986432363224.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986432363224.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">반려동물</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=7"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985751246256.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985751246256.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985751246256.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835985751246256.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">인테리어시공</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=20"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986953510985.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986953510985.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986953510985.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835986953510985.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">캠핑용품</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item"
                            href="/store/category?affect_type=StoreHamburger&amp;category=22"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835987414167522.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835987414167522.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835987414167522.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/162835987414167522.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">실내운동</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item layout-navigation-hamburger-pc__item--selected"
                            href="/store/category?affect_type=StoreHamburger&amp;category=25"><span
                                class="image-wrap"><img class="image"
                                    src="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164148741337337391.png?gif=1&amp;w=80&amp;h=80&amp;c=c"
                                    srcset="https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164148741337337391.png?gif=1&amp;w=144&amp;h=144&amp;c=c 1.5x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164148741337337391.png?gif=1&amp;w=160&amp;h=160&amp;c=c 2x,https://image.ohou.se/i/bucketplace-v2-development/uploads/category/store_hamburger_categories/164148741337337391.png?gif=1&amp;w=240&amp;h=240&amp;c=c 3x"></span><span
                                class="text">렌탈</span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>
                    <li class="layout-navigation-hamburger-pc__item-wrap"><a
                            class="layout-navigation-hamburger-pc__item" href=""><span class="image-wrap"><img
                                    class="image" src="" srcset=""></span><span class="text"></span></a></li>
                </ul>

            </div>
        </div>
    </ul>

    </div>




</body>

</html>
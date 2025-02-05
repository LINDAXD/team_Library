<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<div class="tnb">
	<div class="tnb_menu">  
		<!-- 미 로그인 시 -->
		<sec:authorize access="isAnonymous()">
		<span><a href="/member/login">로그인</a></span>
		<span>|</span>
	    <span><a href="/member/signup-check">회원가입</a></span>
		</sec:authorize>
		
		<!-- 로그인 시 -->
		<sec:authorize access="isAuthenticated()">
		<span><sec:authentication property="principal.dto.user_name"/>님</span>
		<span>|</span>
	    <span><a href="/logout">로그아웃</a></span>
	    <span>|</span>
	    <span><a href="/mylib/mypage">정보수정</a></span>
	    
	    <!-- 관리자 권한을 가지고 있을 경우 -->
	    <sec:authorize access="hasRole('ROLE_ADMIN')">
	    <span>|</span>
	    <span><a href="/admin/member-list">관리자메뉴</a></span>
	    </sec:authorize>
		</sec:authorize>
	</div>	
</div>

    
    
<div class="navi">
    <div>
        <ul class="header_menu">
            <li>
                <div style=" width: 160px; height: 70px; margin-right: 250px;">
                	<a href="/"><img src="/resources/imges/index/ezen-logo-black.png"></a>
                </div>
            </li>
            <li class="header_menu1"><span><a href="/search/book">도서검색</a></span></li>
            <li class="header_menu2"><span><a href="/info/signup">이용안내</a></span></li>
            <li class="header_menu3"><span><a href="/board/noticeList">열린공간</a></span></li>
            <li class="header_menu4"><span><a href="/intro/greeting">회사소개</a></span></li>
            <li class="header_menu5"><span><a href="/mylib/loan-history">마이페이지</a></span></li>
        </ul>
    </div>
</div>

<div class="header_submenu header_sub1">
    <ul class="header_submenu1">
        <li><span><a href="/search/book">도서검색</a></span></li>
        <li><span><a href="/search/best-book">대출베스트</a></span></li>
        <li><span><a href="/search/recommend-book">추천도서</a></span></li>
    </ul>
</div>

<div class="header_submenu header_sub2">
    <ul class="header_submenu2">
        <li><span><a href="/info/signup">회원가입안내</a></span></li>
        <li><span><a href="/info/loanBook">도서대출/반납/예약</a></span></li>
    </ul>
</div>

<div class="header_submenu header_sub3">
    <ul class="header_submenu3">
        <li><span><a href="/board/noticeList">공지사항</a></span></li>
        <li><span><a href="/board/faq">자주묻는질문</a></span></li>
        <li><span><a href="/board/qnaBoardList">묻고답하기</a></span></li>
    </ul>
</div>

<div class="header_submenu header_sub4">
    <ul class="header_submenu4">
        <li><span><a href="/intro/greeting">인사말</a></span></li>
        <li><span><a href="/intro/road">찾아오시는길</a></span></li>
    </ul>
</div>

<div class="header_submenu header_sub5">
    <ul class="header_submenu5">
        <li><span><a href="/mylib/loan-history">도서관련</a></span></li>
        <li><span><a href="/mylib/hope">희망도서신청/조회</a></span></li>
        <li><span><a href="/mylib/mypage">개인정보</a></span></li>
    </ul>
</div>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
  crossorigin="anonymous"></script>
<script>
    $(function () {
        $(".header_menu1, .header_sub1").on({
            "mouseover": function () {
                $(".header_sub1").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub1").css("display", "none");
            }
        })

        $(".header_menu2, .header_sub2").on({
            "mouseover": function () {
                $(".header_sub2").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub2").css("display", "none");
            }
        })

        $(".header_menu3, .header_sub3").on({
            "mouseover": function () {
                $(".header_sub3").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub3").css("display", "none");
            }
        })

        $(".header_menu4, .header_sub4").on({
            "mouseover": function () {
                $(".header_sub4").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub4").css("display", "none");
            }
        })

        $(".header_menu5, .header_sub5").on({
            "mouseover": function () {
                $(".header_sub5").css("display", "block");
            },
            "mouseleave": function () {
                $(".header_sub5").css("display", "none");
            }
        })
    })

</script>
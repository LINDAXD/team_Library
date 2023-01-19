<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>라온도서관 > 열린공간 > 묻고답하기</title>
	<link rel="stylesheet" href="/resources/css/board/sub3/qna_edit_page.css">
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
</head>
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" 
  crossorigin="anonymous"></script>
<body>

	<div class="header">
    <jsp:include page="../header.jsp"></jsp:include>
    </div>

    <div class="container">
<div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>도서검색</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/search/book">자료검색</a>
                        </li>
                        <li>
                            <a href="/search/book">도서검색</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="lnb.jsp"></jsp:include>

                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs" style="">

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <h2>도서의 상세 내용을 확인하세요</h2>
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 200px;">이미지</th>
                                            <th style="">도서 정보</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="">
                                                <img src="${book.book_cover }" style="width: 200px;">
                                            </td>
                                            <td class="" style="text-align: left;">
                                                <h2>${book.book_title }</h2>
                                                <p><b>저자명</b> : ${book.book_author }</p>
                                                <p><b>출판사</b>: ${book.book_publisher }</p>
                                                <p><b>출간일</b> : ${book.book_pubDate }</p>
                                                <p>
                                                <b>가격</b>: 
                                                <fmt:formatNumber value="${book.priceStandard }" type="currency"/>
                                                </p>
                                            </td>

                                        </tr>
                                    
                                    </tbody>
                               
                                </table>
                                
                                
                                <form action="/review/reviewBoardUpdate" method="post" onsubmit="return false;">
                                	<input type="hidden" name="review_no" value="${dto.review_no}" >
                                	<input type="hidden" name="writer_id" value="writer_id">
<<<<<<< HEAD
=======
                                    <input type="hidden" name="writer_name" value="writer_name">
>>>>>>> 409999c778d5b4b42c16ef162d890bb0cf9c2646
                                    <input type="hidden" name="amount" value="${cri.amount}">
                                	<input type="hidden" name="page" value="${cri.page}">
                                	<input type="hidden" name="type" value="${cri.type}">
                                	<input type="hidden" name="keyword" value="${cri.keyword}">
                                    
                                    <table class="bbs-edit">
                                        <tbody>

                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${dto.writer_name}</td>
                                                <th class="first">작성일</th>
                                                <td>
<<<<<<< HEAD
                                                ${fn:substring(dto.review_reg_date, 0, 11)}
=======
                                                ${fn:substring(dto.enquiry_reg_date, 0, 11)}
>>>>>>> 409999c778d5b4b42c16ef162d890bb0cf9c2646
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="padding: 8px 0px;">
<<<<<<< HEAD
                                                    <textarea id="popContent" name="review_content">
                                                    ${dto.review_content}</textarea>
=======
                                                    <textarea id="popContent" name="enquiry_content">
                                                    ${dto.enquiry_content}</textarea>
>>>>>>> 409999c778d5b4b42c16ef162d890bb0cf9c2646
                                                </td>
                                            </tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <input type="submit" class="write_btn" value="수정하기" style="margin-top: 40px;">
                                    </div>

                                </form>
                                
                                <div class="list_wrap">
<<<<<<< HEAD
                                	<form action="/review/reviewBoardList" method="get">
=======
                                	<form action="/board/qnaBoardList" method="get">
>>>>>>> 409999c778d5b4b42c16ef162d890bb0cf9c2646
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>                                
<<<<<<< HEAD

=======
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
>>>>>>> 409999c778d5b4b42c16ef162d890bb0cf9c2646
                                
                                
                                
                            </div>

                        </div>

                    </div>
                                        <div style="display: flex; justify-content: center; align-items: center;">
                    
                        <form id="loan" onsubmit="return false;" method="post">
                        	<sec:authorize access="isAuthenticated()">
							<input type="hidden" class="user_email" name="user_email" 
								value=<sec:authentication property="principal.dto.user_email"/>>
							</sec:authorize>
							
							<sec:authorize access="isAnonymous()">
							<input type="hidden" class="user_email" name="user_email">
							</sec:authorize>
							
							<input type="hidden" name="book_title" value="${book.book_title }">
							<input type="hidden" name="book_author" value="${book.book_author }">
							<input type="hidden" class="book_isbn" name="book_isbn" value="${book.book_isbn }">
							<input type="hidden" name="book_cover" value="${book.book_cover }">
							<input type="hidden" name="book_pubDate" value="${book.book_pubDate }">
							<input type="hidden" name="book_publisher" value="${book.book_publisher }">
							<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
                            <button id="loan_btn" class=" btn2">대출 (${count }  / 2)</button>
                        </form>

                        <span>　</span>

                        <form action="/search/book">
                        	<input type="hidden" name="amount" value="${cri.amount }">
							<input type="hidden" name="page" value="${cri.page }">
							<input type="hidden" name="type" value="${cri.type }">
							<input type="hidden" name="keyword" value="${cri.keyword }">
                            <button class="btn3" style="display: flex; justify-content: center; align-items: center;">
                                <img src="/resources/imges/search/book_icon.png" style="width: 30px;">　목록
                            </button>
                        </form>

                    </div>

                    <h3>책 소개</h3>
                    <div style="border: 1px solid #ccc; height: 500px;">
                        상품 설명
                        ${book.description}

                    </div>
                <div class="review_title">
<<<<<<< HEAD
                <h3>REVIEW</h3>
                <form id="review_form" method="POST" action="/review/reviewBoardWrite"onsubmit="return false;">
                <input type="submit" class="write_btn" style="cursor: pointer">리뷰작성하기</button>
=======
                <h3>REVIEW</h3><button class="write_btn" onclick="location.href='/board/qnaBoardWrite'" style="cursor: pointer">리뷰작성하기</button>
                <form id="review_form" method="POST" onsubmit="return false;">
>>>>>>> 409999c778d5b4b42c16ef162d890bb0cf9c2646
                <textarea type="text" class="review_input" name="review_input" placeholder="후기를 작성해주세요." cols="140" rows="10" ></textarea>
                </form>
                </div>
                </div>

            </div>
        </div>
    </div>
        <div class="section">
            <div class="doc">

                <!-- 왼쪽 사이드바 -->
                <jsp:include page="lnb.jsp"></jsp:include>

                <!-- 본문 -->
                <div class="content">
                    <div class="doc">
                        <div class="wrapper-bbs">

                            <!-- 테이블 -->
                            <div class="table-wrap">
                                <form action="/review/reviewBoardUpdate" method="post" onsubmit="return false;">
                                	<input type="hidden" name="review_no" value="${dto.review_no}" >
                                	<input type="hidden" name="writer_id" value="writer_id">
                                    <input type="hidden" name="writer_name" value="writer_name">
                                    <input type="hidden" name="amount" value="${cri.amount}">
                                	<input type="hidden" name="page" value="${cri.page}">
                                	<input type="hidden" name="type" value="${cri.type}">
                                	<input type="hidden" name="keyword" value="${cri.keyword}">
                                    
                                    <table class="bbs-edit">
                                        <tbody>
                                            <tr>
                                                <th class="first">제목</th>
                                                <td colspan="3">
                                                    <input type="text" style="width: 80%; height: 27px;"
                                                        placeholder="제목을 작성해 주세요"
                                                        name="review_title" id="title" maxlength="50"
                                                        value="${dto.review_title}" autocomplete="off">
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="first">작성자</th>
                                                <td>${dto.writer_name}</td>
                                                <th class="first">작성일</th>
                                                <td>
                                                ${fn:substring(dto.review_reg_date, 0, 11)}
                                                </td>
                                            </tr>
                                            <tr>
												<td colspan="4" style="padding: 8px 0px;"><textarea
														type="text" class="review_input" id="popContent" name="review_content"
														placeholder="후기를 작성해주세요." cols="140" rows="10"></textarea>
												</td>
											</tr>
                                        </tbody>

                                    </table>

                                    <!-- 글쓰기 btn -->
                                    <div class="write">
                                        <input type="submit" class="write_btn" value="수정하기" style="margin-top: 40px;">
                                    </div>

                                </form>
                                
                                <div class="list_wrap">
                                	<form action="/review/reviewBoardList" method="get">
                                		<input type="hidden" name="amount" value="${cri.amount}">
                                		<input type="hidden" name="page" value="${cri.page}">
                                		<input type="hidden" name="type" value="${cri.type}">
                                		<input type="hidden" name="keyword" value="${cri.keyword}">
                                		<button class="list_btn">목록으로</button>
                                	</form>
                                </div>
                                
                            </div>
                            
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="../footer.jsp"></jsp:include>

<script type="text/javascript" src="/resources/js/ckeditor/ckeditor.js"></script>
<script>
	$(function() {
		
		CKEDITOR.replace('popContent' , {
			 filebrowserImageUploadUrl: "/upload?boardName=review",
			 height: 500                                                  
	     });

		
		$(".sub3").addClass("active");
		
		$(".write_btn").on("click", function() {
			
			var title = $("#title").val();

	        if (title == "") {

	            $("#title").focus();
	             
	            return false;
	        }
	         
			if(confirm('수정하시겠습니까?')) {
				$("form").attr("onsubmit", "result true");
				$("form").submit();
			}else{
				returnn false;
			}
		});
		
		
	});

</script>

</body>
</html>
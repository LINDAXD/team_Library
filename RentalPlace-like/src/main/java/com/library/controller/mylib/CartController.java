package com.library.controller.mylib;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.List;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.model.search.BookDTO;
import com.library.model.search.DateDTO;
import com.library.page.Criteria;
import com.library.service.mylib.CartService;
import com.library.service.search.AladinApi;
import com.library.util.DateUtil;

@Controller
@RequestMapping("/mylib")
public class CartController {

	@Autowired
	private AladinApi api;

	@Autowired
	private CartService service;

	@RequestMapping(value = "/cart/{productId}")
	public @ResponseBody String addGoodsInCart(@PathVariable("productId") String productId, HttpSession session) {
		
		MemberVO vo = (MemberVO) session.getAttribute("login");
		String userid = vo.getUserid();
		/* 로그인 되어있는 정보를 이용해서 userid를 가져온다 */
		CartDTO cartDTO = new CartDTO();
		/* cart객체를 생성하고*/
		cartDTO.setUserid(userid);
		cartDTO.setProductId(productId);
		/* 객체 안에 userid와 productId를 set해준다 */

		boolean istAlreadyExisted = cartService.findCartGoods(cartDTO);
        /* 이미 해당 상품이 카트에 존재하는지 여부를 판별해주는 메서드 */
		System.out.println("istAlreadyExisted : " + istAlreadyExisted);
		
		if (istAlreadyExisted) {
			return "already_existed";
            /* 만약 이미 카트에 저장되어있다면, already_existed를 리턴 */
		} else {
            cartService.addGoodsInCart(cartDTO);
			return "add_success";
             /* 카트에 없으면 카트에 저장 후, add_success를 리턴  */
		}
	}

	// 책 대출
	@PostMapping("/cart")
	public String cart(Model model, Criteria cri, BookDTO book, @RequestParam String detail, Principal principal) {

		// 로그인 된 user_id 받아오기
		String id = principal.getName();

		// id 세팅
		book.setUser_id(id);

		System.out.println("\n======================== 대출 신청 ========================");
		System.out.println("대출자 아이디 : " + book.getUser_id());
		System.out.println("대출 책 제목 : " + book.getBook_title());
		System.out.println("대출 책 ISBN : " + book.getBook_isbn());
		System.out.println("keyword : " + cri.getKeyword());
		System.out.println("========================================================\n");

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/search/book";
		}

		// 도서 대출 실행(대출하려는 도서의 대출 수가 2가 아닐 때)
		if (bookService.count(book.getBook_isbn()) != 2) {

			// 대출
			bookService.loan(book); //insert into loan_history

			// 대출자 대출 중 도서수 증가
			bookService.increase_count(book.getUser_id());

		} else {
			System.out.println("대출불가");
		}

		if (detail.equals("true")) {

			return "redirect:/search/best-book-detail?book_isbn=" + book.getBook_isbn();

		} else {
			return "redirect:/search/book-detail?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&type="
					+ cri.getType() + "&keyword=" + keyword + "&book_isbn=" + book.getBook_isbn();
		}

	}

	// 대출자 상태 체크
	@ResponseBody
	@PostMapping("/statusChk")
	public String statusChk(String book_isbn, Principal principal) throws Exception {

		// 로그인 된 user_id 받아오기
		String id = principal.getName();

		System.out.println(id);
		System.out.println("statusChk() 진입");

		// 대출하려는 회원의 대출 상태를 체크
		int result = bookService.statusCheck(id);

		if (result == 1) {

			// 대출하려는 회원이 대출 중인 도서인지 체크
			int loan_check = bookService.loan_check(id, book_isbn);

			if (loan_check == 1) {

				return "loan";

			} else {

				// 대출 중인 도서 상태 체크
				int count = bookService.count(book_isbn);

				if (count < 2) {

					// 대출 중인 해당 도서수가 2권 미만일 경우 success
					return "success";

				} else {
					return "fail";
				}

			}

		} else {

			return "fail";

		}
	}
	
	//============================== 찜하기 추가 ==========================================
	// 대출자 상태 체크
	@ResponseBody
	@PostMapping("/likeChk")
	public String likeChk(String book_isbn, Principal principal) throws Exception {

		// 로그인 된 user_id 받아오기
		String id = principal.getName();

		System.out.println(id);
		System.out.println("likeChk() 진입");


		// 대출하려는 회원이 대출 중인 도서인지 체크
		int loan_check = bookService.like_check(id, book_isbn);

		if (loan_check == 1) {

			return "alreadyLike";

		} else {

			// 아직 좋아요 안한 책이라면 success 리턴
			return "success";

			} 
	}
	
		
	// 찜하기
	@PostMapping("/like")
	public String like(Model model, Criteria cri, BookDTO book, @RequestParam String detail, Principal principal) {

		// 로그인 된 user_id 받아오기
		String id = principal.getName();

		// id 세팅
		book.setUser_id(id);

		System.out.println("\n======================== 찜하기 ========================");
		System.out.println("아이디 : " + book.getUser_id());
		System.out.println("찜한 책 제목 : " + book.getBook_title());
		System.out.println("찜한 책 ISBN : " + book.getBook_isbn());
		System.out.println("keyword : " + cri.getKeyword());
		System.out.println("========================================================\n");

		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/search/book";
		}
		
		// 대출
		bookService.like(book); //insert into loan_history

		if (detail.equals("true")) {

			return "redirect:/search/best-book-detail?book_isbn=" + book.getBook_isbn();

		} else {
			return "redirect:/search/book-detail?amount=" + cri.getAmount() + "&page=" + cri.getPage() + "&type="
					+ cri.getType() + "&keyword=" + keyword + "&book_isbn=" + book.getBook_isbn();
		}

	}
	
	// 찜한 도서 삭제
	@PostMapping("/delete-like")
	public String delete_rec(@RequestParam String book_isbn) {
		bookService.delete_like_book(book_isbn);
		return "redirect:/mylib/like-history";
	}
	//============================== 찜하기 추가 ==========================================

	
	
	// 대출베스트 출력
	@GetMapping("/best-book")
	public String best_book(Model model, Criteria cri, DateDTO date) {

		System.out.println("best_book 진입");

		// year이 null 이면 현재 날짜 기준 year
		if (date.getYear() == null) {
			date.setYear(DateUtil.date("year"));
		}

		// month가 null 이면 현재 날짜 기준 month
		if (date.getMonth() == null) {
			date.setMonth(DateUtil.date("month"));
		}

		List<BookDTO> list = bookService.book_rank(date);

		for (BookDTO book : list) {
			book.setCount(bookService.count(book.getBook_isbn()));
		}

		model.addAttribute("list", list);

		// 년
		model.addAttribute("year", date.getYear());
		// 월
		model.addAttribute("month", date.getMonth());

		return "/search/sub2/best_book";

	}

	// 대출베스트 책 상세내용
	@GetMapping("/best-book-detail")
	public String best_book_detail(Model model, Criteria cri, DateDTO date, @RequestParam String book_isbn) {

		if (book_isbn != null && book_isbn != "") {

			try {

				BookDTO book = api.search_detail(book_isbn);

				if (book.getBook_title() != null) {

					System.out.println("선택 책 제목 : " + book.getBook_title());
					model.addAttribute("book", book);

					int count = bookService.count(book_isbn);
					count = 2 - count;
					model.addAttribute("count", count);

					// year이 null 이면 현재 날짜 기준 year
					if (date.getYear() == null) {
						date.setYear(DateUtil.date("year"));
					}

					// month가 null 이면 현재 날짜 기준 month
					if (date.getMonth() == null) {
						date.setMonth(DateUtil.date("month"));
					}

					// 년
					model.addAttribute("year", date.getYear());
					// 월
					model.addAttribute("month", date.getMonth());

				} else {

					System.out.println("잘못된 값 입력");
					return "redirect:/search/book";

				}

			} catch (ParseException e) {
				e.printStackTrace();
			}

		} else {

			System.out.println("빈 검색어 입력");
			return "redirect:/search/book";

		}
		model.addAttribute("cri", cri);
		return "/search/sub2/best_book_detail";
	}

}

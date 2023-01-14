package com.library.service.mylib;

import com.library.model.mylib.CartDTO;

public interface CartService {
	boolean findCartGoods(CartDTO cartDTO);
	
	void addGoodsInCart(CartDTO cartDTO);



	// 도서 대출
	public void cart(CartDTO dto);

	// 대출 중인 해당 도서 수 카운트
	public int count(String isbn);

	// 대출자 상태 체크
	public int cartCheck(String user_id, String book_isbn);


	// 찜한 도서 삭제
	public void delete_cart(String book_isbn);
}

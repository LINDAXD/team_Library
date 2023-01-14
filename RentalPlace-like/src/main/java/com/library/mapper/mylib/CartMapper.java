package com.library.mapper.mylib;

import org.apache.ibatis.annotations.Param;


import com.library.model.mylib.CartDTO;

public interface CartMapper {

	// 도서 대출
	public void cart(CartDTO dto);

	// 대출 중인 해당 도서 수 카운트
	public int count(String isbn);



	// 회원이 대출 중인 도서인지 체크
	public int cartCheck(@Param("user_id")String user_id, @Param("book_isbn")String book_isbn);
	
	
	
	////////////////////////// 찜하기 추가 //////////////////////////////

	
	// 찜한 도서 삭제
	public void delete_cart(@Param("book_isbn") String book_isbn);
	

	public boolean findCartGoods(CartDTO cartDTO);
	
	public void addGoodsInCart(CartDTO cartDTO);
	

			




}

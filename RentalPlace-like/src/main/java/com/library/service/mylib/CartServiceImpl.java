package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.CartMapper;
import com.library.model.mylib.CartDTO;
import com.library.model.search.DateDTO;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;

	// 도서 대출
	@Override
	public void cart(CartDTO dto) {
		mapper.cart(dto);
	}

	// 대출 중인 해당 도서 수 카운트
	@Override
	public int count(String isbn) {
		return mapper.count(isbn);
	}


	
	// 대출자 상태 체크
	@Override
	public int cartCheck(String user_id, String book_isbn) {
		return mapper.cartCheck(user_id, book_isbn);
	}
	

	@Override
	public void delete_cart(String book_isbn) {
		mapper.delete_cart(book_isbn);
	}
	@Override
	public boolean findCartGoods(CartDTO cartDTO) {
		
		return mapper.findCartGoods(cartDTO);
	}

	@Override
	public void addGoodsInCart(CartDTO cartDTO) {
		
		mapper.addGoodsInCart(cartDTO);
	}



}

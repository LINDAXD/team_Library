package com.library.service.mylib;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.mapper.mylib.MyLoanHistoryMapper;
import com.library.model.search.BookDTO;
import com.library.page.Criteria;

@Service
public class MyLoanHistoryServiceImpl implements MyLoanHistoryService {

	@Autowired
	private MyLoanHistoryMapper mapper;

	// 대출 내역 조회
	@Override
	public List<BookDTO> loan_history(String user_id, Criteria cri, String start_date, String end_date) {
		return mapper.loan_history(user_id, cri, start_date, end_date);
	}
	
	// 대출 수 출력
	@Override
	public int get_total(String user_id, String start_date, String end_date) {
		return mapper.get_total(user_id, start_date, end_date);
	}

	
	
	//<!--=========== 찜하기 추기 =================-->
	// 찜한 내역 조회
	@Override
	public List<BookDTO> like_history(String user_id, Criteria cri) {
		return mapper.like_history(user_id, cri);
	}

	@Override
	public int get_total_like(String user_id) {
		return mapper.get_total_like(user_id);
	}
	
	
}
